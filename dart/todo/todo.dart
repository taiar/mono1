import 'dart:html';
import 'dart:indexed_db' as idb;
import 'dart:async';

class TodoList {
  static final String _TODOS_DB = "todo";
  static final String _TODOS_STORE = "todos";

  idb.Database _db;
  int _version = 2;
  InputElement _input;
  Element _todoItems;

  TodoList() {
    _todoItems = querySelector('#todo-items');
    _input = querySelector('#todo');
    querySelector('input#submit').onClick.listen((e) => _onAddTodo());
  }

  Future open() {
    return window.indexedDB.open(_TODOS_DB, version: _version,
        onUpgradeNeeded: _onUpgradeNeeded)
      .then(_onDbOpened)
      .catchError(_onError);
  }

  void _onError(e) {
    window.alert('Oh no! Something went wrong. See the console for details.');
    window.console.log('An error occurred: {$e}');
  }

  void _onDbOpened(idb.Database db) {
    _db = db;
    _getAllTodoItems();
  }

  void _onUpgradeNeeded(idb.VersionChangeEvent e) {
    idb.Database db = (e.target as idb.OpenDBRequest).result;
    if (!db.objectStoreNames.contains(_TODOS_STORE)) {
      db.createObjectStore(_TODOS_STORE, keyPath: 'timeStamp');
    }
  }

  void _onAddTodo() {
    var value = _input.value.trim();
    if (value.length > 0) {
      _addTodo(value);
    }
    _input.value = '';
  }

  Future _addTodo(String text) {
    var trans = _db.transaction(_TODOS_STORE, 'readwrite');
    var store = trans.objectStore(_TODOS_STORE);
    return store.put({
      'text': text,
      'timeStamp': new DateTime.now().millisecondsSinceEpoch.toString()
    }).then((_) => _getAllTodoItems())
    .catchError((e) => _onError);
  }

  void _deleteTodo(String id) {
    var trans = _db.transaction(_TODOS_STORE, 'readwrite');
    var store =  trans.objectStore(_TODOS_STORE);
    var request = store.delete(id);
    request.then((e) => _getAllTodoItems(), onError: _onError);
  }

  void _getAllTodoItems() {
    _todoItems.nodes.clear();

    var trans = _db.transaction(_TODOS_STORE, 'readwrite');
    var store = trans.objectStore(_TODOS_STORE);

    var request = store.openCursor(autoAdvance:true).listen((cursor) {
      _renderTodo(cursor.value);
    }, onError: _onError);
  }

  void _renderTodo(Map todoItem) {
    var textDisplay = new Element.tag('span');
    textDisplay.text = todoItem['text'];

    var deleteControl = new Element.tag('a');
    deleteControl.text = '[Delete]';
    deleteControl.onClick.listen((e) => _deleteTodo(todoItem['timeStamp']));

    var item = new Element.tag('li');
    item.nodes.add(textDisplay);
    item.nodes.add(deleteControl);
    _todoItems.nodes.add(item);
  }
}

void main() {
  new TodoList().open();
}

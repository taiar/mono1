import 'dart:math';
import 'package:http/http.dart' as http;

readFromRemoteFile(url, sentence) {
  var rng = new Random();
  print(sentence);
  http.get(url).then((val){
    var texto = val.body;
    var frases = texto.split("\n");
    print(frases[rng.nextInt(frases.length)]);
  });
}

ramones() {
  readFromRemoteFile('http://aurelio.net/doc/ramones.txt',
    "Please wait, consulting the Ramones:");
}

main() {
  ramones();
}

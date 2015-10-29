import 'dart:math';
import 'package:http/http.dart' as http;

import 'dart:math';
import 'package:http/http.dart' as http;

readFromRemoteFile(url) {
  var rng = new Random();
  print("Please wait, consulting the Ramones:");
  http.get(url).then((val){
    var texto = val.body;
    var frases = texto.split("\n");
    print(frases[rng.nextInt(frases.length)]);
  });
}

natal() {
  readFromRemoteFile('http://www.crossladies.com/feliz_natal.txt');
}

main() {
  natal();
}

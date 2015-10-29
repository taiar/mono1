import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:io';

natal() async {
  var rng = new Random();
  var url = 'http://www.crossladies.com/feliz_natal.txt';
  print("This is how we say 'Merry Christmas' in:");
  var response = await http.get(url);
  var texto = response.body;
  var frases = texto.split("\n");
  print(frases[rng.nextInt(frases.length)]);
}

ramones() async {
  var rng = new Random();
  var url = 'http://aurelio.net/doc/ramones.txt';
  print("Please wait, consulting the Ramones:");
  var response = await http.get(url);
  var texto = response.body;
  var frases = texto.split("\n");

  print(frases[rng.nextInt(frases.length)]);
}

main() async {
  await natal();
  ramones();
}
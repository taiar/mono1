import 'dart:math';
import 'package:http/http.dart' as http;

main() async {
  var rng = new Random();
  var url = 'http://aurelio.net/doc/ramones.txt';
  print("Please wait, consulting the Ramones:");
  
  var response = await http.get(url);
  var texto = response.body;
  var frases = texto.split("\n");

  print(frases[rng.nextInt(frases.length)]);
}
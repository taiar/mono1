import 'dart:math';
import 'package:http/http.dart' as http;

main() async {
  var rng = new Random();
  var url = 'http://www.crossladies.com/feliz_natal.txt';
  print("This is how we say 'Merry Christmas' in:");

  var response = await http.get(url);
  var texto = response.body;
  var frases = texto.split("\n");

  print(frases[rng.nextInt(frases.length)]);
}
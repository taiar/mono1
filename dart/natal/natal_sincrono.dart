import 'dart:math';
import 'package:http/http.dart' as http;

main() {
  var rng = new Random();
  var url = 'http://www.crossladies.com/feliz_natal.txt';
  print("This is how we say 'Merry Christmas' in:");

  http.get(url).then((val){
    var texto = val.body;
    var frases = texto.split("\n");
    print(frases[rng.nextInt(frases.length)]);
  });
}

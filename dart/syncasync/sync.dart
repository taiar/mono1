import 'dart:math';
import 'package:http/http.dart' as http;

readFromRemoteFile(url, sentence) async {
  var rng = new Random();
  print(sentence);
  var response = await http.get(url);
  var texto = response.body;
  var frases = texto.split("\n");
  print(frases[rng.nextInt(frases.length)]);
}

ramones() async {
  await readFromRemoteFile("http://aurelio.net/doc/ramones.txt",
    "Please wait, consulting the Ramones:");
}

natal() async {
  await readFromRemoteFile("http://www.crossladies.com/feliz_natal.txt",
    "This is how we say 'Merry Christmas' in:");
}

main() async {
  await ramones();
  natal();
}

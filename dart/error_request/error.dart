import 'package:http/http.dart' as http;

handleSuccess(http.Response response) {
  print('something went wrong');
  print(response.body);
}

handleFailure(error) {
  print('Something went wrong.');
  print(error.message);
}

main() async {
  try {
    var response = await http.get("http://some_bogus_website.org");
    handleSuccess(response);
  } catch (e) {
    handleFailure(e);
  }
}


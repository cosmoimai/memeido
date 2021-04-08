import 'package:http/http.dart' as http;

Future<bool> getImages() async {
  try{
    var response = http.get(Uri.parse("something"));
    print(response);
    return true;
  }
  catch(e){
    print(e.toString());
    return false;
  }
}
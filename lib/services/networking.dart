import 'package:http/http.dart' as http;

class Network {
  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.body);
    }
  }
}

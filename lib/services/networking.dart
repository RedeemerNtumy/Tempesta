import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey="2fb1d1f24e95db0c7193031c10589f72";

class Network {
  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = jsonDecode(data)["main"]["temp"];
      var condition = jsonDecode(data)["weather"][0]["id"];
      var cityName = jsonDecode(data)["name"];
      var longitude = jsonDecode(data)["coord"]["lon"];
      var latitude = jsonDecode(data)["coord"]["lat"];
      var weatherDescription = jsonDecode(data)["weather"][0]["description"];
      print(longitude);
      print(latitude);
      print(temperature);
      print(condition);
      print(cityName);
      print(weatherDescription);
    } else {
      print(response.body);
    }
  }
}

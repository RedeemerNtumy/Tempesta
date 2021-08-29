import 'package:flutter/material.dart';
import 'package:tempesta/services/location.dart';
import 'dart:convert';
import 'package:tempesta/utilities/constants.dart';

import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = jsonDecode(data)["main"]["temp"];
      var condition = jsonDecode(data)["weather"][0]["id"];
      var cityName = jsonDecode(data)["name"];

      var weatherDescription = jsonDecode(data)["weather"][0]["description"];

      print(temperature);
      print(condition);
      print(cityName);
      print(weatherDescription);
    } else {
      print(response.body);
    }
  }
  //initState occurs only once.
  // Build however occurs everytime something in the widget changes

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

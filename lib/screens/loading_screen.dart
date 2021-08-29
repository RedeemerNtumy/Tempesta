import 'package:flutter/material.dart';
import 'package:tempesta/services/location.dart';
import 'package:tempesta/utilities/constants.dart';
import 'package:tempesta/services/networking.dart';
import 'package:tempesta/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await network.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ),
    );
  }

  //initState occurs only once.
  // Build however occurs everytime something in the widget changes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

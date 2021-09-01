import 'package:flutter/material.dart';
import 'package:tempesta/services/weather.dart';
import 'package:tempesta/utilities/constants.dart';
import 'package:tempesta/screens/city_screen.dart';

WeatherModel weather = WeatherModel();

class LocationScreen extends StatefulWidget {
  LocationScreen(this.info);
  final info;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weatherIcon;
  late String weatherInfo;
  var cityName;
  var cond;
  void initState() {
    super.initState();
    updateUI(widget.info);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        weatherInfo = "Unable to access location  ";
        cityName = " your area 😭";
        return;
      }
      var temp = weatherData["main"]["temp"];

      temperature = temp.toInt();

      var condition = weatherData["weather"][0]["id"];
      cityName = weatherData["name"];
      weatherIcon = weatherMod.getWeatherIcon(condition);
      weatherInfo = weatherMod.getMessage(temperature);
    });
  }

  WeatherModel weatherMod = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var dataWeather = await weather.getWeatherLocation();
                      updateUI(dataWeather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityInput = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (cityInput != null) {
                        var weatherData =
                            await weatherMod.getNeededWeather(cityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temperature°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherInfo in $cityName",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

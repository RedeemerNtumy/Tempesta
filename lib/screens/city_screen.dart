import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tempesta/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/weather.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.6), BlendMode.dstATop)),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(35.0),
                child: TextField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kInputField,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 200,
                    color: Colors.blue,
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

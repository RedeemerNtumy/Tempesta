import 'package:flutter/material.dart';
import 'package:tempesta/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.jpg'),
            fit: BoxFit.cover,
          ),
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
                padding: EdgeInsets.all(55.0),
                child: null,
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
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

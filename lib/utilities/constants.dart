import 'package:flutter/material.dart';

const apiKey = "2fb1d1f24e95db0c7193031c10589f72";

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kSingleTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
);
const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputField = InputDecoration(
  filled: true,
  fillColor: Color(0xffbdbdbd),
  icon: Icon(
    Icons.location_city,
    size: 35,
  ),
  hintText: "Check weather for this City",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);

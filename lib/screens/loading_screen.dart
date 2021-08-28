import 'package:flutter/material.dart';
import 'package:tempesta/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Location location = Location();
    location.getCurrentLocation();
  }
  //initState occurs only once.
  // Build however occurs everytime something in the widget changes

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

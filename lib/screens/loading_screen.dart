import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationPermission? permission;
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    permission = await Geolocator.requestPermission();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}

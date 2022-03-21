import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/apikey.dart';
import 'package:clima_flutter/services/networking.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationPermission? permission;
  Location location = Location();
  double? latitude;
  double? longitude;

  String apiKey = WeatherAPIKey.getAPIkey();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    permission = await Geolocator.requestPermission();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    var temp = weatherData['main']['temp'];
    var conditionNumber = weatherData['weather'][0]['id'];
    var cityName = weatherData['name'];
    print(temp);
    print(conditionNumber);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}

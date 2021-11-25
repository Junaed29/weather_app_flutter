import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter/services/weather.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var decodedData = await weatherModel.getLocationWeather();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(decodedData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

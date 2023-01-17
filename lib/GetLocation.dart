import 'dart:convert';
import 'package:flutter/material.dart';
import 'Networking.dart';

class GeoLocation extends StatefulWidget {
  const GeoLocation({super.key});

  @override
  State<GeoLocation> createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  var fetchedJSONData;
  String Weather = '';
  NetworkingData networkingData = NetworkingData();

  @override
  void initState() {
    super.initState();
    networkingData.getLocation();
    getAPIData();
  }

  void getAPIData() async {
    fetchedJSONData = await networkingData.getLocation();
    Weather = jsonDecode(fetchedJSONData)['weather'][0]['description'];
    print(Weather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB6E388),
        title: const Text(
          'CLIMA',
          style: TextStyle(
            color: Color(0xFF1E2547),
            fontSize: 20.0,
            fontFamily: 'SourceSansPro',
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Weather: $Latitude'),
          ],
        ),
      ),
    );
  }
}

// double Longitude = 0.0;
// double Latitude = 0.0;

// Future<void> getLocation() async {
//   LocationPermission permission;
//   permission = await Geolocator.requestPermission();
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.low);
//   Longitude = position.longitude;
//   Latitude = position.latitude;
//   http.Response response = await http.get(Uri.parse(
//       'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));
//   String apiData = response.body;
//   Weather = jsonDecode(apiData)['weather'][0]['description'];
//   print(Weather);
//   print(Latitude);
//   print(Longitude);
// }
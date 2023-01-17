import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

String url = ' ';
const String apiKey = '6c23d1c62cf574c52eb0e9fb97e6d3f8';
var jsonAPIData;

class NetworkingData {
  Future getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    url =
        'https://openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    jsonAPIData = response.body;
    return jsonAPIData;
  }
}
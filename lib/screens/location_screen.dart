import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body:
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('images/weatherbghappy.jpg'),
          //       fit: BoxFit.fill,
          //       colorFilter: ColorFilter.mode(
          //           Colors.white.withOpacity(0.9), BlendMode.dstATop),
          //     ),
          //   ),
          //   constraints: BoxConstraints.expand(),
          //   child:
          SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    var weatherData = await weather.getLocationWeather();
                    updateUI(weatherData);
                  },
                  child: const Icon(
                    Icons.near_me_rounded,
                    color: Color(0xFF191919),
                    size: 30.0,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var typedName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ),
                    );
                    if (typedName != null) {
                      var weatherData = await weather.getCityWeather(typedName);
                      updateUI(weatherData);
                    }
                  },
                  child: const Icon(
                    Icons.location_city,
                    color: Color(0xFF191919),
                    size: 30.0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' $cityName',
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                '$weatherMessage in $cityName',
                textAlign: TextAlign.center,
                style: kNewMessageTextStyle,
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
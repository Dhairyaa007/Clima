import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body:
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('images/city_background.jpg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   constraints: BoxConstraints.expand(),
          //   child:
          SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF191919),
                  size: 30.0,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldInputDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                FloatingActionButton.small(
                  backgroundColor: Color(0xFFE42F45),
                  child: Icon(Icons.arrow_right, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
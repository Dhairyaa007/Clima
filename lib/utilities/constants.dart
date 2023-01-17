import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Roboto-Bold',
  fontSize: 70.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'LuckiestGuy', fontSize: 30.0, color: Color(0xFFE42F45),
  // fontWeight: FontWeight.bold,
);

const kNewMessageTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontWeight: FontWeight.bold,
  fontSize: 26.0,
);

const kButtonTextStyle = TextStyle(
    fontSize: 20.0, fontFamily: 'SourceSansPro', color: Color(0xFFEEEEEE));

const kConditionTextStyle = TextStyle(
  fontSize: 70.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Color(0xFF191919),
    size: 30.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    fontFamily: 'SourceSansPro',
    fontSize: 16,
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
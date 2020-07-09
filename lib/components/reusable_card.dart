import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.temp, this.humidity, this.iconUrl, this.time});

  final int temp;
  final int humidity;
  final String iconUrl;
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
      padding: EdgeInsets.only(left: 30.0),
      height: 50.0,
      decoration: BoxDecoration(
        color: kCardColour,
        borderRadius: BorderRadius.circular(5.0),

      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              '$time',
              style: kTimeTextStyle,
            ),
          ),
          Expanded(
            child:Image.network(iconUrl),
          ),
          Expanded(
            child: Text(
              '$humidity%',
              style: kPercentageTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              '$temp°C',
              style: kTimeTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
//
//Text(
//'🌤',
//style: kIconTextStyle,
//)
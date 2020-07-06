import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.near_me,
                      color: kGreyColor,
                      size: 30.0,
                    ),
                    label: Text(
                      'Ngong',
                      style: kLocationTextStyle,
                    ),
                  ),
                  FlatButton(
                    onPressed: (){

                    },
                    child: Icon(
                      Icons.search,
                      color: kGreyColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          '21°C',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,

                          ),
                        ),

                        Text(
                          'Mostly Cloudy with Showers',
                          style: TextStyle(
                            fontSize: 50.0,
                            color: kGreyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('🌤',
                  style: TextStyle(
                      fontSize: 200.0
                  ),),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ReusableCard(),
                ReusableCard(),
                ReusableCard(),
                ReusableCard(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
  }) : super(key: key);

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
              'Now',
              style: kTimeTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              '🌤',
              style: kIconTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              '100%',
              style: kPercentageTextStyle,
            ),
          ),
          Expanded(
            child: Text(
                '21°C',
              style: kTimeTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

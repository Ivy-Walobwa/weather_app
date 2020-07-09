import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/components/reusable_card.dart';
import 'package:weatherapp/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String city;
  List tempArray;
  List humidityArray;
  List iconsArray;
  List timeArray;
  String description;
  String imageUrl;

//  String weatherIconUrl;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  updateUI(dynamic weatherData) {
    setState(() {
      tempArray = getConditionArray(Weather().getTemperatures(weatherData));
      humidityArray = getConditionArray(Weather().getHumidities(weatherData));
      iconsArray = getConditionArray(Weather().getWeatherIcon(weatherData, 2));
      timeArray = getConditionArray(Weather().getTime(weatherData));
      description = Weather().getWeatherDescription(weatherData);
      city = weatherData['city']['name'];
      imageUrl = Weather().getWeatherIcon(weatherData, 4)[0];
    });
  }

  getConditionArray(var function) {
    List newArray = [];
    var receivedArray = function;
    for (int i = 0; i < 4; i++) {
      newArray.add(receivedArray[i]);
    }
    return newArray;
  }

  List<Widget> addReusableCard() {
    List<Widget> cardArray = [];
    for (int i = 0; i < 4; i++) {
      if(i==0){
        timeArray[i] = 'now';
      }
      cardArray.add(ReusableCard(
        temp: tempArray[i],
        humidity: humidityArray[i],
        iconUrl: iconsArray[i],
        time: timeArray[i],
      ));
    }
    return cardArray;
  }

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
                      city,
                      style: kLocationTextStyle,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
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
                          '${tempArray[0]}°C',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '$description in $city',
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
               Image.network(imageUrl),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: addReusableCard(),
            ),
          ],
        ),
      ),
    );
  }
}

//Text(
//'🌤',
//style: TextStyle(fontSize: 200.0),
//)
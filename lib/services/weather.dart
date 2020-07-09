import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:intl/intl.dart';

class Weather{

  final apiKey = '711aa1dac24cc43c62a34ea3132602de';
  final openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/forecast';
  final openWeatherMapIconImageUrl = 'http://openweathermap.org/img/wn';

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(url:
    '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networking.getData();
    print(getTemperatures(weatherData));
    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async{
    Networking networking = Networking(url:
    '$openWeatherMapURL?q=$city&appid=$apiKey&units=metric');

    var weatherData = await networking.getData();
    return weatherData;
  }

  List getWeatherIcon(dynamic weatherData, int size){
    List<String> iconArray = [];
    for(var data in weatherData['list']){
      var icon = data['weather'][0]['icon'];
      iconArray.add('$openWeatherMapIconImageUrl/$icon@$size'+'x.png');
    }
     return iconArray;
  }

  List<int> getTemperatures(dynamic weatherData){
    List<int> tempArray = [];
    for(var data in weatherData['list']){
      var temp = data['main']['temp'];
      tempArray.add(temp.toInt());
    }
    return tempArray;
  }

  List getHumidities(dynamic weatherData){
    List<int> humidityArray = [];
    for(var data in weatherData['list']){
      humidityArray.add(data['main']['humidity']);
    }
    return humidityArray;
  }

  List getTime(dynamic weatherData){
    List timeArray = [];
    for(var data in weatherData['list']){
      var timeText = data['dt_txt'];
      var parsedTime = DateTime.parse(timeText);

      timeArray.add(DateFormat.jm().format(parsedTime));
    }
    return timeArray;
  }

   String getWeatherDescription(dynamic weatherData){
    return weatherData['list'][0]['weather'][0]['description'];
  }

}
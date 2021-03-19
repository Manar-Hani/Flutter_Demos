import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot.data.weather;
    var city = snapshot.data.name;
    var timezone = snapshot.data.timezone;
    var formattedDate =
    new DateTime.fromMillisecondsSinceEpoch(forecastList[0].id);
    var forecast = forecastList[0];

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$city, $timezone",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87),
            ),
            Text(
              "${Util.getFormattedDate(formattedDate)}",
              style: TextStyle(fontSize: 15),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(
                  weatherDescription: forecastList[0].description[0],
                  color: Colors.pinkAccent,
                  size: 198),
            ),
            //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),
            //Icon(Icons.wb_sunny, size: 195,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${forecast.description}",
                    style: TextStyle(fontSize: 34),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast.description.toUpperCase()}"),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast.icon} "),
                        Icon(
                          FontAwesomeIcons.wind,
                          size: 20,
                          color: Colors.brown,
                        )
                        //Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast.main}"),
                        Icon(
                          FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20,
                          color: Colors.brown,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast.description}"),
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 20,
                          color: Colors.brown,
                        )
                        //Icon(Icons.wb_sunny, size: 20, color: Colors.brown,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.weather;
  var city = snapshot.data.name;
  var timezone = snapshot.data.timezone;
  var formattedDate =
  new DateTime.fromMillisecondsSinceEpoch(forecastList[0].id);

  var forecast = forecastList[0];
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$city, $timezone",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87),
          ),
          Text(
            "${Util.getFormattedDate(formattedDate)}",
            style: TextStyle(fontSize: 15),
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: forecastList[0].description[0],
                color: Colors.pinkAccent,
                size: 198),
          ),
          //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),
          //Icon(Icons.wb_sunny, size: 195,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "${forecast.main}",
                    style: TextStyle(fontSize: 34),
                  ),
                ),
                Text("${forecast.description.toUpperCase()}"),
              ],
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast.icon}"),
                      Icon(
                        FontAwesomeIcons.wind,
                        size: 20,
                        color: Colors.brown,
                      )
                      //Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast.main} "),
                      Icon(
                        FontAwesomeIcons.solidGrinBeamSweat,
                        size: 20,
                        color: Colors.brown,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast.main}"),
                      Icon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 20,
                        color: Colors.brown,
                      )
                      //Icon(Icons.wb_sunny, size: 20, color: Colors.brown,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
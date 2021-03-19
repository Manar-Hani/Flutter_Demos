import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.weather;
  var dayOfWeek = "";
  DateTime date =
  new DateTime.fromMillisecondsSinceEpoch(forecastList[index].id * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(child: Text(dayOfWeek)
          ),
        ),
     Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                  weatherDescription: forecastList[index].description[0],
                  color: Colors.pinkAccent,
                  size: 45),
            ),
            ),

            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                          "${forecastList[index].description}"),
                    ),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleDown,
                      color: Colors.white,
                      size: 17,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          "${forecastList[index].description}"),
                      Icon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        color: Colors.white,
                        size: 17,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          "Sky:${forecastList[index].main}"),
//                     Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
//                       size: 17,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          "Icon:${forecastList[index].icon} "),
//                     Icon(FontAwesomeIcons.wind, color: Colors.white,
//                       size: 17,)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
    ],
  );
}
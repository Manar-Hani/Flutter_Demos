import 'package:intl/intl.dart';

class Util {
  //static String appId ="ADD YOUR OWN APPID";
  static String appId = "034dab1743573bd9242f2e852b80fee0";


  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat("EEEE, MMM d, y").format(dateTime);
    //... 1999
  }


}
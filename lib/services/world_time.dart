import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  late String location;

  late String time;
  late String flag;
  late String url; //location url for endpoint
  late bool isDaytime ; // true if it is daytime
  WorldTime({required this.location, required this.flag, required this.url
  });

  Future<void> getTime() async {
    // chuyen string ve URI
    // Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // Response response = await get(url);
    // // print(response.body);
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    try{
      Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //  2024-05-13 10:02:00.241542Z

      // set time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(e){
      print('caught error : $e');
      time = 'could not get time data';

    }
  }

}


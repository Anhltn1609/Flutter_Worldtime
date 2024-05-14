import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.jpg'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.jpg'),
    WorldTime(url: 'America/New_York', location: 'NewYork', flag: 'usa.jpg'),
    WorldTime(url: 'Asia/Ho_Chi_Minh', location: 'Hanoi', flag: 'vietnam.jpg')
  ];
void updateTime(index) async{

  WorldTime instance = locations[index];
  await instance.getTime();
  //navigate to home screen
  Navigator.pop(context, {
    'location': instance.location,
    'time': instance.time,
    'flag': instance.flag,
    'isDaytime': instance.isDaytime,
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Location'),
          centerTitle: true,
          elevation: 0,
        ),
          body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding : const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            },
          )
    );
  }
}

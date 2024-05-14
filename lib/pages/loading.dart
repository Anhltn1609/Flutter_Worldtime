import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async{
  //   // simulate network request for a username
  //
  //   await Future.delayed(Duration(seconds: 10), (){
  //     print('hi');
  //   });
  //
  //   await Future.delayed(Duration(seconds: 50), (){
  //     print('hello');
  //   });
  //   // neu khong co await  chung ta in 'hello truoc va 'hi' sau tổng 10s
  //   // nếu dùng await ta sẽ mất 15s, và 'hi' sẽ đc in trc
  // }
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Hanoi', flag: 'vn.png', url: 'Asia/Ho_Chi_Minh');
    await instance.getTime();

    Navigator.pushReplacementNamed(context!, '/home',
        arguments: {
          'location': instance.location,
          'time': instance.time,
          'flag': instance.flag,
          'isDaytime': instance.isDaytime,
        });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setupWorldTime();
    });
    // khong can doi getData() chay xong, van chay print trc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

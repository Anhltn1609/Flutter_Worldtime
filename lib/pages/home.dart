import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty?data: ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    print('data $data');

    // setBackground
    String bgImage = data['isDaytime'] ? 'daytime.jpg' : 'nighttime.jpg';
    Color? textColor = data['isDaytime'] ? Colors.blue[900] : Colors.blue[100];
    Color? bgColor = data['isDaytime'] ? Colors.blue[100] : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                OutlinedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    print('Reslut : $data');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  }, // Changed "onePressed" to "onPressed"
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit location'),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textColor
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                      color: textColor
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

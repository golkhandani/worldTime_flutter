import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/services/world-time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = "Loading ...";

  void setupWorldTime() async {
    try {
      WorldTime instance = WorldTime();
      await instance.getData();
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
          'isDayTime': instance.isDayTime,
        });
      });
      // Navigator.pushNamed(context, '/home');
      // Navigator.pushReplacementNamed(context, '/home', arguments: {
      //   'location': instance.location,
      //   'flag': instance.flag,
      //   'time': instance.time
      // });
      // setState(() {
      //   this.time = instance.time;
      // });
    } catch (e) {
      print("Cought error $e");
      //  setState(() {
      //   this.time = "Can't get data";
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState function ran");
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SpinKitChasingDots(
          color: Colors.black,
          size: 180.0,
        ),
      )),
    );
  }
}

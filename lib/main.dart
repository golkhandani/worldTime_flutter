import 'package:flutter/material.dart';
import 'package:flutterapp/pages/choose_location.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=> Loading(),
      '/home':(context) => Home(),
      '/locations':(context)=> ChooseLocation(),
      },
    )
  );

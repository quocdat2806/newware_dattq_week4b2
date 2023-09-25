import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4b2/pages/home.dart';
import 'package:week4b2/providers/setting_provider.dart';
import 'package:week4b2/providers/weather_provider.dart';

void main() async {
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ChangeNotifierProvider(create: (context) => SettingProvider()),
    ],
    child: const  MaterialApp(
      home:Home(),
      locale: Locale('en', 'US'),

    ),
  )
  );
}

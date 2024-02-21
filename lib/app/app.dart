import 'package:converter/app/feature/converter/currency_page.dart';
import 'package:converter/app/feature/converter/length_page.dart';
import 'package:converter/app/feature/converter/st_unit_page.dart';
import 'package:converter/app/feature/converter/temperature_page.dart';
import 'package:converter/app/feature/converter/weight_page.dart';
import 'package:converter/app/feature/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Converter(),
        '/weight': (context) => const WeightPage(),
        '/currency': (context) => const CurrencyPage(),
        '/temperature': (context) => const TemperaturePage(),
        '/st_unit': (context) => const StUnitPage(),
        '/length': (context) => const LengthPage(),
      },
    );
  }
}

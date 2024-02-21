import 'package:flutter/material.dart';
import 'dart:math';


class StUnitPage extends StatefulWidget {
  const StUnitPage({super.key});

  @override
  State<StUnitPage> createState() => _StUnitPageState();
}

class _StUnitPageState extends State<StUnitPage> {

  final TextEditingController _bitsController = TextEditingController();
  double _bytes = 0;
  double _kilobytes = 0;
  double _gigabytes = 0;
  double _terabytes = 0;

  void _convertInformation(String value) {
    double bits = double.tryParse(value) ?? 0;
    setState(() {
      _bytes = bits / 8;
      _kilobytes = bits / 1024;
      _gigabytes = bits / pow(1024,2);
      _terabytes = bits / pow(1024, 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stUnit'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _bitsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Введите биты',
                ),
                onChanged: _convertInformation,
              ),
              const SizedBox(height: 20),
              Text('Bytes: $_bytes'),
              Text('Kilobytes: $_kilobytes'),
              Text('Gigabytes: $_gigabytes'),
              Text('Terabytes: $_terabytes'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}


class _TemperaturePageState extends State<TemperaturePage> {

  String selectedUnit1 = 'Цельсия (°C)';
  String selectedUnit2 = 'Фаренгейта (°F)';
  double inputValue = 0.0;
  double changeValue = 0.0;

    double convertTemperature(double value, String fromUnit, String toUnit){
   if (fromUnit == 'Цельсия (°C)') { // Кило
      if (toUnit == 'Фаренгейта (°F)') {
        return value * 9/5 + 32;
      } else if (toUnit == 'Кельвина (K)') {
        return value + 273.15;
      }
    }else if(fromUnit == 'Фаренгейта (°F)'){ // Фунты
      if (toUnit == 'Цельсия (°C)'){
        return (value - 32) * 5/9;
      }if (toUnit == 'Кельвина (K)'){
        return ((value - 32) * 5/9) + 273.15;
      }
    } else if(fromUnit == 'Кельвина (K)'){ // Граммы
      if (toUnit == 'Цельсия (°C)'){
        return value - 273.15;
      }if (toUnit == 'Фаренгейта (°F)'){
        return (value - 273.15) * 9/5 + 32;
      }
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature'),
        backgroundColor: Colors.black,
      ),
      body:
      Column(
        children: [
          Center(
            child: DropdownButton<String>(
              items: <String>['Цельсия (°C)', 'Фаренгейта (°F)', 'Кельвина (K)'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,                 
                child: Text(value),
                );
              }).toList(),
      
              value: selectedUnit1,
              onChanged: (String? newValue) {
                setState(() {
                  selectedUnit1 = newValue!;
                  changeValue = inputValue;
                  changeValue = convertTemperature(
                    inputValue, 
                    selectedUnit1, 
                    selectedUnit2
                    );
                });
              },
      
              hint: Text(selectedUnit1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value){
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                  changeValue = inputValue;
                  changeValue = convertTemperature(
                    inputValue, 
                    selectedUnit1, 
                    selectedUnit2
                    );
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '$inputValue',
              )
            ),
          ),
          Center(
            child: DropdownButton(
              items: <String>['Цельсия (°C)', 'Фаренгейта (°F)', 'Кельвина (K)'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                );
              }).toList(),
      
              value: selectedUnit2,
              
              onChanged: (String? newValue) {
                setState(() {
                  selectedUnit2 = newValue!;
                  changeValue = inputValue;
                changeValue = convertTemperature(
                    inputValue, 
                    selectedUnit1, 
                    selectedUnit2
                    );
                });
              },
      
              hint: Text(selectedUnit2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              readOnly: true,
              keyboardType: TextInputType.number,
              onChanged: (value){
                setState(() {
                  changeValue = double.tryParse(value) ?? 0.0;
                  changeValue = inputValue;
                  changeValue = convertTemperature(
                    inputValue, 
                    selectedUnit1, 
                    selectedUnit2
                    );
                });
              },
              decoration:  InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '$changeValue',
              )
            ),
          ),
        ],
      ),
    );
  }
}

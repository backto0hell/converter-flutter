
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
  
}

class _WeightPageState extends State<WeightPage> {
  String selectedUnit1 = 'Килограммы';
  String selectedUnit2 = 'Килограммы';
  double inputValue = 0.0;
  double changeValue = 0.0;

  double convertWeight(double value, String fromUnit, String toUnit){
   if (fromUnit == 'Килограммы') { // Кило
      if (toUnit == 'Фунты') {
        return value * 2.20462;
      } else if (toUnit == 'Граммы') {
        return value * 1000;
      } else if (toUnit == 'Унции') {
        return value * 35.274;
      }
    }else if(fromUnit == 'Фунты'){ // Фунты
      if (toUnit == 'Килограммы'){
        return value * 0.45359237;
      }if (toUnit == 'Граммы'){
        return value * 453.59237;
      }if (toUnit == 'Унции'){
        return value * 16;
      }
    } else if(fromUnit == 'Граммы'){ // Граммы
      if (toUnit == 'Килограммы'){
        return value * 0.001;
      }if (toUnit == 'Фунты'){
        return value / 453.59237;
      }if (toUnit == 'Унции'){
        return value / 28.34952;
      }
    }else if(fromUnit == 'Унции'){ // Граммы
      if (toUnit == 'Килограммы'){
        return value * 0.02834952;
      }if (toUnit == 'Фунты'){
        return value / 16;
      }if (toUnit == 'Граммы'){
        return value * 28.34952;
      }
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
        backgroundColor: Colors.black,
      ),
      body:
      Column(
        children: [
          Center(
            child: DropdownButton<String>(
              items: <String>['Килограммы', 'Фунты', 'Граммы', 'Унции'].map<DropdownMenuItem<String>>((String value) {
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
                changeValue = convertWeight(
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
                changeValue = convertWeight(
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
              items: <String>['Килограммы', 'Фунты', 'Граммы', 'Унции'].map<DropdownMenuItem<String>>((String value) {
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
                changeValue = convertWeight(
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
                changeValue = convertWeight(
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
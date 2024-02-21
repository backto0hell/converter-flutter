import 'package:flutter/material.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({super.key});

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  
  String selectedUnit1 = 'Километр';
  String selectedUnit2 = 'Метр';
  double inputValue = 0.0;
  double changeValue = 0.0;

   double convertLength(double value, String fromUnit, String toUnit){
   if (fromUnit == 'Километр') { // Кило
      if (toUnit == 'Метр') {
        return value * 1000;
      } else if (toUnit == 'Сантиметр') {
        return value * 100000;
      } else if (toUnit == 'Миллиметр') {
        return value * 1000000;
      }
    }else if(fromUnit == 'Метр'){ // Фунты
      if (toUnit == 'Километр'){
        return value * 0.001;
      }if (toUnit == 'Сантиметр'){
        return value * 100;
      }if (toUnit == 'Миллиметр'){
        return value * 1000;
      }
    } else if(fromUnit == 'Сантиметр'){ // Граммы
      if (toUnit == 'Метр'){
        return value * 0.01;
      }if (toUnit == 'Миллиметр'){
        return value * 10;
      }if (toUnit == 'Километр'){
        return value * 0.00001;
      }
    }else if(fromUnit == 'Миллиметр'){ // Граммы
      if (toUnit == 'Метр'){
        return value * 0.001;
      }if (toUnit == 'Сантиметр'){
        return value * 0.1;
      }if (toUnit == 'Километр'){
        return value * 0.000001;
      }
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Length'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Center(
            child: DropdownButton<String>(
              items: <String>['Метр', 'Километр', 'Сантиметр', 'Миллиметр'].map<DropdownMenuItem<String>>((String value) {
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
                changeValue = convertLength(
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
                changeValue = convertLength(
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
              items: <String>['Метр', 'Километр', 'Сантиметр', 'Миллиметр'].map<DropdownMenuItem<String>>((String value) {
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
                changeValue = convertLength(
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
                changeValue = convertLength(
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

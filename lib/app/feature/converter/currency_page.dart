import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {

    String selectedUnit1 = 'Российский рубль';
    String selectedUnit2 = 'Доллар США';
    double inputValue = 0.0;
    double changeValue = 0.0;
    
    double convertCurrency(double value, String fromUnit, String toUnit){
   if (fromUnit == 'Российский рубль') { 
      if (toUnit == 'Доллар США') {
        return value * 0.011 ;
      } else if (toUnit == 'Евро') {
        return value * 0.01028;
      } else if (toUnit == 'Китайский юань') {
        return value * 0.078;
      }
    }else if(fromUnit == 'Доллар США'){ 
      if (toUnit == 'Российский рубль'){
        return value * 90.23;
      }if (toUnit == 'Евро'){
        return value * 0.93;
      }if (toUnit == 'Китайский юань'){
        return value * 7.19;
      }
    } else if(fromUnit == 'Евро'){
      if (toUnit == 'Российский рубль'){
        return value * 97.96;
      }if (toUnit == 'Доллар США'){
        return value * 1.08;
      }if (toUnit == 'Китайский юань'){
        return value * 7.74;
      }
    }else if(fromUnit == 'Китайский юань'){
      if (toUnit == 'Российский рубль'){
        return value * 12.65;
      }if (toUnit == 'Доллар США'){
        return value * 0.14;
      }if (toUnit == 'Евро'){
        return value * 0.13;
      }
    }
    return value;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
        backgroundColor: Colors.black,
      ),
            body:
      Column(
        children: [
          Center(
            child: DropdownButton<String>(
              items: <String>['Российский рубль', 'Доллар США', 'Евро', 'Китайский юань'].map<DropdownMenuItem<String>>((String value) {
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
                changeValue = convertCurrency(
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
                changeValue = convertCurrency(
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
              items: <String>['Российский рубль', 'Доллар США', 'Евро', 'Китайский юань'].map<DropdownMenuItem<String>>((String value) {
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
                changeValue = convertCurrency(
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
                changeValue = convertCurrency(
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

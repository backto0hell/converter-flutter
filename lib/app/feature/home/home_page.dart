import 'package:converter/app/model/converter_model.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConvertState();
}

class _ConvertState extends State<Converter> {
  List<ConverterModel> models = [
    ConverterModel(title: 'Вес', icon: Icons.terrain),
    ConverterModel(title: 'Единицы хранения', icon: Icons.accessible_forward_sharp),
    ConverterModel(title: 'Длина', icon: Icons.show_chart),
    ConverterModel(title: 'Валюта', icon: Icons.local_atm),
    ConverterModel(title: 'Температура', icon: Icons.ac_unit),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter converter'),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
            crossAxisCount: 1,
          ),
          itemCount: models.length,
          itemBuilder: (BuildContext ctx, i) {
            return GestureDetector(
              onTap: () {
                if (i == 0) {
                  Navigator.of(context).pushNamed('/weight');
                }
                if (i == 1) {
                  Navigator.of(context).pushNamed('/st_unit');
                }
                if (i == 2) {
                  Navigator.of(context).pushNamed('/length');
                }
                if (i == 3) {
                  Navigator.of(context).pushNamed('/currency');
                }
                if (i == 4) {
                  Navigator.of(context).pushNamed('/temperature');
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Icon(
                          models[i].icon,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      models[i].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

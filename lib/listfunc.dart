import 'package:flutter/material.dart';
import 'package:simulado/listfuncoes.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => FormsState(); //instância
}

class FormsState extends State<Forms> {
  final List<String> items = [
    "Funcionário 1",
    "Funcionário 2",
    "Funcionário 3",
    "Funcionário 4",
    "Funcionário 5",
    "Funcionário 6",
    "Funcionário 7",
    "Funcionário 8",
    "Funcionário 9",
    "Funcionário 10",
  ];
  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;
  String _selectItem = "";
  bool envio = false;
  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Lista de Funcionarios',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const Divider(),
            Container(
              width: 350,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: _selectItem == items[index] ? Text(items[index], style: const TextStyle(color: Colors.red), ) : Text(items[index]),
                    onTap: () {
                      changeSelectedItem(items[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormsFuncoes(funcionario: _selectItem)));
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                ),
                child: const Text(
                  "Selecionar",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

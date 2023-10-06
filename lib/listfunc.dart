import 'package:flutter/material.dart';
import 'package:simulado/listfuncoes.dart';

class Forms extends StatefulWidget {
  final TextEditingController email;

  const Forms({super.key, required this.email});

  @override
  State<Forms> createState() => FormsState(); //instância
}

class FormsState extends State<Forms> {
  final List<String> itens = [
    "Médico",
    "Engenheiro",
    "Professor",
    "Advogado",
    "Programador",
    "Designer",
    "Contador",
    "Enfermeiro",
    "Arquiteto",
    "Chef de Cozinha",
  ];
  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;
  String _selectItem = "";
  bool envio = false;

  TextEditingController _conclusao = TextEditingController();


  @override
  void dispose() {
    _conclusao.dispose();
    super.dispose();
  }


  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
    });
  }
  void handleConclusao(TextEditingController e) {
    setState(() {
      _conclusao = e;
    });
  }
  @override
  Widget build(BuildContext context) {
    String usuario = widget.email.text;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Usuario: $usuario"),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Selecionar Tecnico',
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
                itemCount: itens.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: _selectItem == itens[index]
                        ? Text(
                            itens[index],
                            style: const TextStyle(color: Colors.red),
                          )
                        : Text(itens[index]),
                    onTap: () {
                      changeSelectedItem(itens[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 350,
              height: 25,
              child: TextField(
                  controller: _conclusao,
                  keyboardType: TextInputType.number,
                )
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FormsFuncoes(curso: _selectItem, conclusaoTecnico: _conclusao, user: usuario,)));
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

import 'package:flutter/material.dart';
import 'package:simulado/ultimatela.dart';

class TempoFunc extends StatefulWidget {
  const TempoFunc({super.key, required this.funcionario, required this.funcao});

  final String funcionario;
  final String funcao;

  @override
  State<TempoFunc> createState() => _FormsTempoFunc();
}

class _FormsTempoFunc extends State<TempoFunc> {
  TextEditingController tempoFuncao = TextEditingController();

  void handleTempoFuncao(TextEditingController value) {
    setState(() {
      tempoFuncao = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String funcionario = widget.funcionario;
    String funcao = widget.funcao;
    return Scaffold(
        body: Align(
      child: Column(
        children: [
          const SizedBox(height: 50.0),
          SizedBox(
            width: 350,
            child: Column(
              children: [
                Text(
                  "Funcionario Selecionada\n$funcionario",
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(),
                Text(
                  "Função Selecionada\n$funcao",
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(),
                const Text(
                  "Tempo na Função",
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  controller: tempoFuncao,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TelaFinal()))
                  },
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                  ),
                  child: const Text(
                    "Confirmar",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

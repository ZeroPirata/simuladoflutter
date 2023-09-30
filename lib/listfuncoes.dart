import 'package:flutter/material.dart';
import 'package:simulado/tempofunc.dart';

class FormsFuncoes extends StatefulWidget {
  const FormsFuncoes({super.key, required this.funcionario});

  final String funcionario;

  @override
  State<FormsFuncoes> createState() => _FormsFuncoesState();
}

class _FormsFuncoesState extends State<FormsFuncoes> {
  List<String> funcoesDaEmpresa = [
    "Gerente Geral",
    "Gerente de Recursos Humanos",
    "Gerente de Vendas",
    "Gerente de Marketing",
    "Gerente de Finanças",
    "Analista de Dados",
    "Desenvolvedor de Software",
    "Designer Gráfico",
    "Especialista em Marketing Digital",
    "Gerente de Projetos",
    "Assistente Administrativo",
    "Analista de Recursos Humanos",
    "Contador",
    "Analista de Qualidade",
    "Analista de Suporte Técnico",
  ];
  String _selectItem = "";
  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    String funcionario = widget.funcionario;
    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50.0),
          Text(
            "Funcionario Selecionado\n$funcionario",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Divider(),
          const Text(
            'Selecionar Função',
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
              itemCount: funcoesDaEmpresa.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: _selectItem == funcoesDaEmpresa[index]
                      ? Text(
                          funcoesDaEmpresa[index],
                          style: const TextStyle(color: Colors.red),
                        )
                      : Text(funcoesDaEmpresa[index]),
                  onTap: () {
                    changeSelectedItem(funcoesDaEmpresa[index]);
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TempoFunc(
                              funcionario: funcionario,
                              funcao: _selectItem,
                            )));
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
    ));
  }
}

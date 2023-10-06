import 'package:flutter/material.dart';
import 'package:simulado/ultimatela.dart';

class TempoFunc extends StatefulWidget {
  const TempoFunc(
      {super.key,
      required this.usuario,
      required this.curso,
      required this.graduacao,
      required this.graduacaoTempo,
      required this.cursoTempo});

  final String usuario;
  final String curso;
  final String graduacao;
  final String graduacaoTempo;
  final String cursoTempo;

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

  String _selectItem = "";
  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
    });
  }

  final List<String> especializacoes = [
    "Especialização em Tecnologia da Informação",
    "Especialização em Marketing Digital",
    "Especialização em Gestão de Projetos",
    "Especialização em Engenharia de Software",
    "Especialização em Finanças Corporativas",
    "Especialização em Recursos Humanos",
    "Especialização em Psicologia Clínica",
    "Especialização em Marketing Esportivo",
    "Especialização em Design de Interiores",
    "Especialização em Medicina Cardiológica",
    "Especialização em Educação Inclusiva",
    "Especialização em Nutrição Clínica",
    "Especialização em Direito do Trabalho",
    "Especialização em Energias Renováveis",
    "Especialização em Logística e Cadeia de Suprimentos",
  ];

  TextEditingController _conclusao = TextEditingController();
  @override
  void dispose() {
    _conclusao.dispose();
    super.dispose();
  }

  void handleConclusao(TextEditingController e) {
    setState(() {
      _conclusao = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    String usuario = widget.usuario;
    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50.0),
          Text(
            "Usuario: $usuario",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Divider(),
          const Text(
            'Selecionar Graduação',
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
              itemCount: especializacoes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: _selectItem == especializacoes[index]
                      ? Text(
                          especializacoes[index],
                          style: const TextStyle(color: Colors.red),
                        )
                      : Text(especializacoes[index]),
                  onTap: () {
                    changeSelectedItem(especializacoes[index]);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
              width: 350,
              height: 35,
              child: TextField(
                controller: _conclusao,
                keyboardType: TextInputType.number,
              )),
          const SizedBox(height: 16.0),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaFinal(
                              usuario: widget.usuario,
                              curso: widget.curso,
                              cursoTempo: widget.cursoTempo,
                              graduacao: widget.graduacao,
                              graduacaoTempo: widget.graduacaoTempo,
                              especializaocao: _selectItem,
                              especializacaoTempo: _conclusao.text
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

import 'package:flutter/material.dart';
import 'package:simulado/tempofunc.dart';

class FormsFuncoes extends StatefulWidget {
  const FormsFuncoes({super.key, required this.curso, required this.conclusaoTecnico, required this.user});

  final String curso;
  final String user;
  final TextEditingController conclusaoTecnico;

  @override
  State<FormsFuncoes> createState() => _FormsFuncoesState();
}

class _FormsFuncoesState extends State<FormsFuncoes> {
  final List<String> niveisGraduacao = [
    "Bacharelado",
    "Licenciatura",
    "Mestrado",
    "Doutorado",
    "Pós-Graduação",
    "Graduação Tecnológica",
    "Especialização",
    "Diploma",
    "Associado",
    "Certificação",
  ];

  String _selectItem = "";
  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
    });
  }  
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

    String userCurso = widget.curso;
    String user = widget.user;
    String conclusaoUser = widget.conclusaoTecnico.text;


    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50.0),
          Text(
            "Usuario: $user",
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
              itemCount: niveisGraduacao.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: _selectItem == niveisGraduacao[index]
                      ? Text(
                          niveisGraduacao[index],
                          style: const TextStyle(color: Colors.red),
                        )
                      : Text(niveisGraduacao[index]),
                  onTap: () {
                    changeSelectedItem(niveisGraduacao[index]);
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
                        builder: (context) => TempoFunc(
                              usuario: user,
                              curso: userCurso,
                              cursoTempo: conclusaoUser,
                              graduacao: _selectItem,
                              graduacaoTempo: _conclusao.text,
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

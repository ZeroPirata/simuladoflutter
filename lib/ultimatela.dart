import 'package:flutter/material.dart';
import 'package:simulado/home.dart';

class TelaFinal extends StatefulWidget {
  const TelaFinal({
    super.key,
    required this.usuario,
    required this.curso,
    required this.cursoTempo,
    required this.graduacao,
    required this.graduacaoTempo,
    required this.especializaocao,
    required this.especializacaoTempo,
  });

  final String usuario;
  final String curso;
  final String cursoTempo;
  final String graduacao;
  final String graduacaoTempo;
  final String especializaocao;
  final String especializacaoTempo;

  @override
  State<TelaFinal> createState() => _TelaFinal();
}

class _TelaFinal extends State<TelaFinal> {
  @override
  Widget build(BuildContext context) {
    String wusuario = widget.usuario;
    String wcurso = widget.curso;
    String wcursoTempo = widget.cursoTempo;
    String wgraduacao = widget.graduacao;
    String wgraduacaoTempo = widget.graduacaoTempo;
    String wespecializaocao = widget.especializaocao;
    String wespecializacaoTempo = widget.especializacaoTempo;
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Text("Usuario: $wusuario"),
            const SizedBox(
              height: 50,
            ),
            const Text("Informações"),
            const SizedBox(height: 50,),
            Text("Tecnico: $wcurso Tempo $wcursoTempo"),
            Text("Graduacao: $wgraduacao Tempo $wgraduacaoTempo"),
            Text("Especialização: $wespecializaocao Tempo $wespecializacaoTempo"),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Home(
                                title: "Bicho Corps",
                              )));
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                ),
                child: const Text(
                  "Voltar",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ]),
    ));
  }
}

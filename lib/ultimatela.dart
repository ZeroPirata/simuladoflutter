import 'package:flutter/material.dart';
import 'package:simulado/home.dart';

class TelaFinal extends StatefulWidget {
  const TelaFinal({
    super.key,
  });

  @override
  State<TelaFinal> createState() => _TelaFinal();
}

class _TelaFinal extends State<TelaFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const ClipOval(
                  child: Image(
                      image: AssetImage("assets/empresa.png"),
                      fit: BoxFit.contain),
                )),
            const SizedBox(
              height: 50,
            ),
            const Text("Dados enviados!\nObrigado"),
            const SizedBox(
              height: 50,
            ),
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

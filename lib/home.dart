import 'package:flutter/material.dart';
import 'package:simulado/listfunc.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();

  void handleEmail(TextEditingController value) {
    setState(() {
      _email = value;
    });
  }

  void handleSenha(TextEditingController value) {
    setState(() {
      _senha = value;
    });
  }

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
            Text(widget.title,
                style: const TextStyle(
                    fontSize: 25.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 0,
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 250,
              child: Column(children: [
                const Text("Usuario"),
                TextField(
                  controller: _email,
                ),
                const Text("Senha"),
                TextField(
                  controller: _senha,
                  obscureText: true,
                )
              ]),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Forms(email: _email,)));
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                ),
                child: const Text(
                  "Iniciar",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ]),
    ));
  }
}

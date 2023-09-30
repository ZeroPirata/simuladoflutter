import 'package:flutter/material.dart';
import 'package:simulado/listfunc.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Forms()));
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

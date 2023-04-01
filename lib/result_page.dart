import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.imc, required this.igc});

  final double imc;
  final double igc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Resultado',
        style: TextStyle(
          fontSize: 25
        ),),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 250),
        child: Center(
          child: Column(
            children: [
              Text('Seu IMC é ${imc.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              Text('Seu IGC é ${igc.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: const Text('Calcular novamente'))
            ],
          )
        ),
      )
    );
  }
}
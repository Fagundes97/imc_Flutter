import 'package:flutter/material.dart';
import 'package:imc/result_page.dart';




class FormData {
  final double altura;
  final double peso;
  final int sexo;
  final int idade;

  FormData({required this.altura, required this.peso, required this.sexo, required this.idade});
}

double calculaImc(double height, double weight) {
  return weight / (height * height);
}

 calculaIgc(double imc, int idade, int sexo){
    if (sexo == 1) {
      return (1.2 * imc) + (0.23 * idade) - (10.8 * 1) - 5.4;
    }
    else if (sexo == 2){
      return (1.2 * imc) + (0.23 * idade) - (10.8 * 0.8) - 5.4;
    }
 }

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPage();
}

class _CalcPage extends State<CalcPage> {

  final _formKey = GlobalKey<FormState>();
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();
  final idadeController = TextEditingController();
  int selectvalue = 0;


    void _submit() {
    if (_formKey.currentState!.validate()) {
      final formData = FormData(
        altura: double.parse(alturaController.text),
        peso: double.parse(pesoController.text),
        sexo: selectvalue,
        idade: int.parse(idadeController.text)
      );
      final imc = calculaImc(formData.altura, formData.peso);
      final igc = calculaIgc(imc, formData.idade, formData.sexo);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(imc: imc, igc: igc)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculadora de IMC e IGC',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black
        )),
      ),
      body: Container(
        margin: const  EdgeInsets.all(20),
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
          const Icon(Icons.man_outlined,
          size: 150,
          color: Colors.grey),
            Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: alturaController,
                decoration: const InputDecoration(labelText: 'Altura'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite sua altura';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: pesoController,
                decoration: const InputDecoration(labelText: 'Peso'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite seu peso';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: idadeController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite sua idade';
                  }
                  return null;
                },
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Masculino'),
                    value: 1,
                    groupValue: selectvalue, 
                    onChanged: (value) {
                      setState(() {
                        selectvalue = value!;
                      });
                    }),
                    RadioListTile(
                    title: const Text('Feminino'),
                    value: 2,
                    groupValue: selectvalue, 
                    onChanged: (value) {
                      setState(() {
                        selectvalue = value!;
                      });
                    })
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Calcular IMC e IGC'),
                ),
              ),
            ],
            )
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:app/widgets/input_text.dart';
import 'package:app/services/suma_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController? _primerNumeroController =
      TextEditingController();
  final TextEditingController? _segundoNumeroController =
      TextEditingController();
  late int _primerNumero;
  late int _segundoNumero;
  int? _suma;
  bool validate = false;

  void _validate() {
    setState(() {
      String primerText = _primerNumeroController!.text;
      String segundoText = _segundoNumeroController!.text;
      validate = primerText != '' && segundoText != '';
      _assignNumbers();
    });
  }

  void _assignNumbers() {
    if (validate) {
      _primerNumero = int.parse(_primerNumeroController!.text);
      _segundoNumero = int.parse(_segundoNumeroController!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Suma de dos números')),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputText(
              numeroController: _primerNumeroController,
              labelText: 'Introduzca el primer número.',
            ),
            const SizedBox(
              height: 30.0,
            ),
            InputText(
              numeroController: _segundoNumeroController,
              labelText: 'Introduzca el segundo número.',
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.0,
                child: const Text(
                  'SUMAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              onPressed: () async {
                _validate();
                if (validate) {
                  _suma = await suma(_primerNumero, _segundoNumero);
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            validate && _suma != null
                ? Text(
                    'La suma es: ${_suma!}',
                    style: const TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

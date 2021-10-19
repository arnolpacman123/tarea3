import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

const urlBase = 'https://api-suma.herokuapp.com/api/v1';
final logger = Logger();

Future<int> suma(int primerNumero, int segundoNumero) async {
  final body = jsonEncode(
    {
      'primerNumero': primerNumero,
      'segundoNumero': segundoNumero,
    },
  );
  final response = await http.post(
    Uri.parse('$urlBase/suma'),
    body: body,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  int suma = 0;
  if (response.statusCode == 200 || response.statusCode == 201) {
    logger.d(response.body);
    suma = jsonDecode(response.body)["suma"];
  }
  return suma;
}

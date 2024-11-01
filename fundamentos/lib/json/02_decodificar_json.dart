import 'dart:convert';

void main() {
  // String JSON
  String jsonString = '{"nome":"Alice","idade":30,"eEstudante":false}';

  // Converter a string JSON em um mapa
  Map<String, dynamic> usuario = jsonDecode(jsonString);
  
  print('Nome: ${usuario['nome']}');
  print('Idade: ${usuario['idade']}');
  print('É estudante: ${usuario['eEstudante']?"Sim":"Não"}');
}
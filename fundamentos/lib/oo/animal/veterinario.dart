import 'Animal.dart';
// Associação
// Relacionamento entre Animal e Veterinario

class Veterinario {
  String nome;

  Veterinario(this.nome);

  void atender(Animal animal) {
    print('$nome está atendendo o animal ${animal.nome}');
  }
}
import 'animal.dart';
import 'alimento.dart';

//Generalização
//Relacionamento entre Gato e Animal
class Gato extends Animal{
  int ronrom;
  Gato(String nome, double peso, this.ronrom, Alimento alimento) : 
       super(nome, peso, alimento);
  void fazerCarinho(){
    ronrom +=10;
    print('$nome está ronronando $ronrom vezes mais');
  }
  @override 
  void fazerSom(){
    print('$nome fez miau');
  }
  @override 
  String toString(){
    return 'Gato | Nome: $nome; Peso: $peso; Ronrom: $ronrom';
  }  
}
import 'enum.dart';

abstract class Forma{
  tpForma tipoForma;

  static int idFormaClasse = 0;
  int idFormaInstancia = 0;

  Forma( this.tipoForma );

  double calculaArea();

  void imprimeForma(){     
     print("${tipoForma.name} com área de ${calculaArea()} <-> ID da Forma: Classe ${idFormaClasse}  Instância ${idFormaInstancia}");
  } 

}
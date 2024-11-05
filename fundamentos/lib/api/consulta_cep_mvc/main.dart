import 'endereco.dart';
import 'endereco_controller.dart';

void main(List<String> args) async {
  final controller = EnderecoController();
  try {
    Endereco endereco = await controller.buscarEndereco("17500005");
    print("Logradouro: ${endereco.logradouro}");
    print("Bairro: ${endereco.bairro}");
    print("Cidade: ${endereco.localidade}");
    print("UF: ${endereco.uf}");
  } catch (e) {
    print(e);
  }
}

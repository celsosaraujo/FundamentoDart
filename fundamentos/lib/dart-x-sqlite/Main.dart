import 'dart:io';

import 'Usuario.dart';
import 'UsuarioController.dart';

void main() async {
  final usuarioController = UsuarioController();

  while (true) {
    print('Escolha uma opção:');
    print('1. Adicionar usuário');
    print('2. Atualizar usuário');
    print('3. Deletar usuário');
    print('4. Mostrar usuários');
    print('5. Sair');

    String? opcao = stdin.readLineSync();

    if (opcao == '1') {
      // Adicionar usuário
      print('Nome:');
      String? nome = stdin.readLineSync();
      print('Email:');
      String? email = stdin.readLineSync();
      print('Senha:');
      String? senha = stdin.readLineSync();

      if (nome != null && email != null && senha != null) {
        var usuario = Usuario(nome: nome, email: email, senha: senha);
        await usuarioController.adicionarUsuario(usuario);
        print('Usuário adicionado com sucesso!');
      }
    } else if (opcao == '2') {
      // Atualizar usuário
      print('ID do usuário a ser atualizado:');
      int id = int.parse(stdin.readLineSync()!);
      print('Novo nome:');
      String? nome = stdin.readLineSync();
      print('Novo email:');
      String? email = stdin.readLineSync();
      print('Nova senha:');
      String? senha = stdin.readLineSync();

      var usuario = Usuario(id: id, nome: nome!, email: email!, senha: senha!);
      await usuarioController.atualizarUsuario(usuario);
      print('Usuário atualizado com sucesso!');
    } else if (opcao == '3') {
      // Deletar usuário
      print('ID do usuário a ser deletado:');
      int id = int.parse(stdin.readLineSync()!);
      await usuarioController.deletarUsuario(id);
      print('Usuário deletado com sucesso!');
    } else if (opcao == '4') {
      // Mostrar usuários
      List<Usuario> usuarios = await usuarioController.obterUsuarios();
      if (usuarios.isEmpty) {
        print('Nenhum usuário cadastrado.');
      } else {
        for (var usuario in usuarios) {
          print(
              'ID: ${usuario.id}, Nome: ${usuario.nome}, Email: ${usuario.email}');
        }
      }
    } else if (opcao == '5') {
      break;
    } else {
      print('Opção inválida!');
    }
  }
}

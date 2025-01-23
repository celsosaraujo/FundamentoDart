import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Usuario.dart';

class UsuarioController {
  static Database? _bancoDeDados;

  // Criação do banco de dados e da tabela
  Future<Database> get bancoDeDados async {
    if (_bancoDeDados != null) {
      return _bancoDeDados!;
    } else {
      _bancoDeDados = await _iniciarBancoDeDados();
      return _bancoDeDados!;
    }
  }

  // Inicializa o banco de dados e cria a tabela
  Future<Database> _iniciarBancoDeDados() async {
    String caminho = join(await getDatabasesPath(), 'usuarios.db');
    return await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuarios(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            email TEXT,
            senha TEXT
          )
        ''');
      },
    );
  }

  // Adiciona um usuário
  Future<int> adicionarUsuario(Usuario usuario) async {
    final db = await bancoDeDados;
    return await db.insert('usuarios', usuario.toMap());
  }

  // Atualiza os dados de um usuário
  Future<int> atualizarUsuario(Usuario usuario) async {
    final db = await bancoDeDados;
    return await db.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  // Deleta um usuário
  Future<int> deletarUsuario(int id) async {
    final db = await bancoDeDados;
    return await db.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Busca todos os usuários
  Future<List<Usuario>> obterUsuarios() async {
    final db = await bancoDeDados;
    final List<Map<String, dynamic>> maps = await db.query('usuarios');

    return List.generate(maps.length, (i) {
      return Usuario.fromMap(maps[i]);
    });
  }

  // Busca um usuário pelo ID
  Future<Usuario?> obterUsuarioPorId(int id) async {
    final db = await bancoDeDados;
    final List<Map<String, dynamic>> maps = await db.query(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Usuario.fromMap(maps.first);
    }
    return null;
  }
}

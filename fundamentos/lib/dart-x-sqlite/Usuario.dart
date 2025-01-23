class Usuario {
  int? id;
  String nome;
  String email;
  String senha;

  Usuario(
      {this.id, required this.nome, required this.email, required this.senha});

  // Converte um objeto Usuario para um mapa (formato que o SQLite entende)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  // Converte um mapa para um objeto Usuario
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}

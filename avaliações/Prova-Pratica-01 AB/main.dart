// Nome: Leandro de Oliveira Cândido

import 'package:sqlite3/sqlite3.dart';

Future<void> inserirDadosNoBancoDeDados(Database db) async {
  final stmt = db.prepare('INSERT INTO TB_ALUNOS (name, idade) VALUES (?, ?)');

  stmt
    ..execute(["Kelwin", 18])
    ..execute(["Elbston", 18])
    ..execute(["Benete", 17])
    ..execute(["José Maia", 17]);

  stmt.dispose();
}

Future<void> procurarTodosOsDadosNoBancoDeDados(Database db) async {
  final resultSet = db.select('SELECT * FROM TB_ALUNOS');

  print("");
  for (final row in resultSet) {
    print('TB_ALUNOS[id: ${row['id']}, name: ${row['name']}, idade: ${row['idade']}]');
  }
  print("");
}

Future<void> atualizarOsDadosNoBancoDeDados(Database db) async {
  final stmt = db.prepare('UPDATE TB_ALUNOS SET idade = ? WHERE id = ?');

  stmt
    ..execute([20, 1])
    ..execute([20, 2])
    ..execute([19, 3])
    ..execute([19, 4]);

  stmt.dispose();
}

Future<void> deletarDadosNoBancoDeDados(Database db) async {
  final stmt = db.prepare('DELETE FROM TB_ALUNOS WHERE id = ?');
  stmt.execute([4]);
  stmt.dispose();
}

Future<void> main() async {
  final db = sqlite3.openInMemory();

  db.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNOS (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL,
      idade INTEGER NOT NULL
    );
  ''');

  await inserirDadosNoBancoDeDados(db);

  await procurarTodosOsDadosNoBancoDeDados(db);

  await atualizarOsDadosNoBancoDeDados(db);
  print('Após atualização:');
  await procurarTodosOsDadosNoBancoDeDados(db);

  await deletarDadosNoBancoDeDados(db);
  print('Após exclusão:');
  await procurarTodosOsDadosNoBancoDeDados(db);

  db.dispose();
}

import 'dart:io';
import 'dart:async';
import 'dart:isolate';
import 'package:path/path.dart' as path;

void main() async {
  // Criando um isolate para executar uma operação assíncrona
  final receivePort = ReceivePort();
  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  // Executando outras tarefas enquanto aguarda a conclusão da operação assíncrona
  print('Iniciando outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Continuando outras tarefas...');

  // Recebendo o resultado da operação assíncrona
  final result = await receivePort.first;
  print('Resultado: $result');
}

void doAsyncOperation(SendPort sendPort) async {
  // Obtendo o caminho absoluto do diretório onde o script Dart está localizado
  final scriptDirectory = path.dirname(Platform.script.toFilePath());

  // Caminho para o arquivo 'arquivo.txt' no mesmo diretório do script
  final filePath = path.join(scriptDirectory, 'arquivo.txt');

  // Verificando se o arquivo existe. Se não, cria o arquivo e escreve uma mensagem.
  final file = File(filePath);
  if (!await file.exists()) {
    // Criando o arquivo e escrevendo a mensagem "Hello World" no arquivo
    await file.writeAsString('Hello World');
    print('Arquivo criado com a mensagem "Hello World".');
  }

  // Lendo o conteúdo do arquivo
  try {
    final result = await file.readAsString();
    sendPort.send(result);
  } catch (e) {
    sendPort.send('Erro ao ler o arquivo: $e');
  }
}

void main() {
    List<String> frutas = ['maçã', 'banana', 'laranja'];
    frutas.add('uva');
    print(frutas);

    // Adiciona a palavra "uva" no fim da lista mesmo já existindo
    frutas.add('uva');
    print(frutas);
}
void main() {
    Set<int> numeros = {1, 2, 3, 4, 5};

    // Não adiciona o 3, pois já existe
    numeros.add(3);
    print(numeros);

    // Adiciona o 6, pois ele não existe
    numeros.add(6);
    print(numeros);
}
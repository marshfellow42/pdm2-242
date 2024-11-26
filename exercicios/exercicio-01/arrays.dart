void main() {
  List<List<int>> matriz = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  print("$matriz\n");

  for (List<int> row in matriz) {
    print(row);
  }
}

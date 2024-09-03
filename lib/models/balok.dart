class Balok {
  final double panjang;
  final double lebar;
  final double tinggi;

  Balok({
    required this.panjang,
    required this.lebar,
    required this.tinggi,
  });

  double volume() => panjang * lebar * tinggi;
}

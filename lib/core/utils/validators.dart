bool isValidCedula(String cedula) {
  if (cedula.length != 10) return false;
  if (!RegExp(r'^\d{10}$').hasMatch(cedula)) return false;

  final provincia = int.parse(cedula.substring(0, 2));
  if (provincia < 1 || provincia > 24) {
    if (provincia != 30) return false;
  }

  final tercerDigito = int.parse(cedula[2]);
  if (tercerDigito >= 6) return false;

  final coeficientes = [2, 1, 2, 1, 2, 1, 2, 1, 2];
  int suma = 0;
  for (int i = 0; i < 9; i++) {
    int valor = int.parse(cedula[i]) * coeficientes[i];
    if (valor >= 10) valor -= 9;
    suma += valor;
  }

  final decenaSuperior = ((suma / 10).ceil()) * 10;
  int digitoEsperado = decenaSuperior - suma;
  if (digitoEsperado == 10) digitoEsperado = 0;

  return digitoEsperado == int.parse(cedula[9]);
}

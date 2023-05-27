import 'package:intl/intl.dart'; 
// estamos usando el paquete intl de pub.dev. Nos permite formatear numeros (estilo instagram)
// en vez de 1000000, vemos 1M

class HumanFormats {
  static String toHumanReadableNumber(int number) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);
  }
}
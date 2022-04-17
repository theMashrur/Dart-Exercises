import 'dart:math';
import 'package:collection/collection.dart';

main() {
  Polynomial([1]) + Polynomial([1]);
  Polynomial([1]) + 1;
}

class Polynomial {
  var coefficients = [];

  Polynomial(coefficients) {
    this.coefficients = coefficients;
  }

  int degree() {
    return this.coefficients.length - 1;
  }

  operator +(other) {
    if (other is Polynomial) {
      var common = min(this.degree(), other.degree()) + 1;
      var inter = IterableZip([this.coefficients, other.coefficients]);
      var coefs = [];
      for (var item in inter) {
        coefs.add(item[0] + item[1]);
      }
      coefs = coefs +
          this.coefficients.sublist(common) +
          other.coefficients.sublist(common);
      return Polynomial(coefs);
    } else if (other is double) {
      return Polynomial(
          [(this.coefficients[0] + other)] + this.coefficients.sublist(1));
    }
  }
}

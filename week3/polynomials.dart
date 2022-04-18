import 'dart:math';
import 'package:collection/collection.dart';

main() {
  print(Polynomial([1, 2, 3]) * Polynomial([1, 2, 3]));
}

class Polynomial {
  var coefficients = [];

  Polynomial(coefficients) {
    this.coefficients = coefficients;
  }

  int degree() {
    return this.coefficients.length - 1;
  }

  String toString() {
    var str = '';
    var rcoefs = List.from(coefficients.reversed);
    rcoefs.forEachIndexed((index, element) {
      if (index == (rcoefs.length - 1)) {
        var current = rcoefs[index];
        str = str + "$current";
      } else {
        var current = rcoefs[index];
        var power = rcoefs.length - index - 1;
        str = str + "$current*x^$power + ";
      }
    });
    return str;
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

  operator *(other) {
    if (other is Polynomial) {
      var t = this.coefficients;
      var o = other.coefficients;
      var prod = List.filled(t.length + o.length - 1, 0);
      t.forEachIndexed((spower, sco) {
        o.forEachIndexed((opower, oco) {
          prod[spower + opower] = (sco * oco) + prod[spower + opower];
        });
      });
      return Polynomial(prod);
    }
  }
}

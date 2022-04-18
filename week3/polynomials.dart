import 'package:collection/collection.dart';
import 'dart:math';

void main() {
  var a = Polynomial([1, 2]);
  print(a * 2.5);
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
    } else if (other is num) {
      var prod = List<num>.filled(coefficients.length, 0);
      coefficients.forEachIndexed((index, element) {
        prod[index] = other * element;
      });
      return Polynomial(prod);
    }
  }

  operator -(other) {
    return this + (other * (-1));
  }

  bool operator ==(other) {
    if (other is Polynomial && other.coefficients is List<num>) {
      if (IterableEquality().equals(this.coefficients, other.coefficients)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

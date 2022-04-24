import 'package:collection/collection.dart';
import 'dart:math';

void main() {
  var a = Polynomial([1, 2, 3]);
  var b = Polynomial([1, 2, 3]);
  bool c = a == b;
  print(a == b);
}

class Polynomial {
  var coefficients = [];

  Polynomial(this.coefficients);

  int degree() {
    return coefficients.length - 1;
  }

  @override
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
      var common = min(degree(), other.degree()) + 1;
      var inter = IterableZip([coefficients, other.coefficients]);
      var coefs = [];
      for (var item in inter) {
        coefs.add(item[0] + item[1]);
      }
      coefs = coefs +
          coefficients.sublist(common) +
          other.coefficients.sublist(common);
      return Polynomial(coefs);
    } else if (other is num) {
      return Polynomial([(coefficients[0] + other)] + coefficients.sublist(1));
    }
  }

  operator *(other) {
    if (other is Polynomial) {
      var t = coefficients;
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
    if (other is Polynomial) {
      if (IterableEquality().equals(coefficients, other.coefficients)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Polynomial pow(int exp) {
    var prod = this;
    for (var i = 1; i <= exp - 1; i++) {
      prod *= this;
    }
    return prod;
  }

  Polynomial dx() {
    if (coefficients.length == 1) {
      return Polynomial([1]);
    }
    var deriv = List<num>.filled(coefficients.length - 1, 0);
    coefficients.forEachIndexed((index, element) {
      if (index != 0) {
        deriv[index - 1] = element * index;
      }
    });
    return Polynomial(deriv);
  }
}

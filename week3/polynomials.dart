import 'package:collection/collection.dart';
import 'dart:math';

void main() {
  var a = Polynomial([1, 2, 3]);
  print(a.dx());
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

  @override
  bool operator ==(other) {
    if (other is Polynomial && other.coefficients is List<num>) {
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

class Circle {
  var centre = [];
  num radius = 0;

  Circle(this.centre, this.radius);

  bool contains(point) {
    var x1 = point[0];
    var y1 = point[1];
    var x0 = centre[0];
    var y0 = centre[1];
    if (pow(x1 - x0, 1) + pow(y1 - y0, 2) < pow(radius, 2)) {
      return true;
    }
    return false;
  }
}

library week3_test;

import 'package:test/test.dart';
import '../week3/polynomials.dart';

main() {
  test('Test printing', () {
    var poly = Polynomial([1, 2]);
    expect(poly.toString(), equals('2*x^1 + 1'));
  });
  test('Test addition', () {
    var a = Polynomial([1, 1, 2]);
    var b = Polynomial([2, 3, 4]);
    var c = a + b;
    expect(c.toString(), equals('6*x^2 + 4*x^1 + 3'));
  });
  test('Test multiplication', () {
    var a = Polynomial([1, 2]);
    var b = Polynomial([1, 1]);
    var c = a * b;
    expect(c.toString(), equals('2*x^2 + 3*x^1 + 1'));
  });
  test('Test subtraction', () {
    var a = Polynomial([1, 2, 3]);
    var b = 5;
    var c = a - 5;
    expect(c.toString(), equals('3*x^2 + 2*x^1 + -4'));
  });
  test('Test equality operator', () {
    var a = Polynomial([1, 2, 3]);
    var b = Polynomial([1, 2, 3]);
    bool c = a == b;
    expect(c, equals(true));
  });
  test('Test power function', () {
    var a = Polynomial([1, 1]);
    expect(a.pow(2).toString(), equals('1*x^2 + 2*x^1 + 1'));
  });
  test('test differentiation', () {
    var a = Polynomial([1, 2, 3]);
    expect(a.dx().toString(), equals('6*x^1 + 2'));
  });
}

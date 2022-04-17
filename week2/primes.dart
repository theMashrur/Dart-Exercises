import 'dart:math';
import 'package:test/test.dart';

void main() {
  print(isPrime(23));
}

bool isPrime(n) {
  int sq = sqrt(n).ceil();
  if (sq == 1) {
    return false;
  }
  for (var i = 2; i <= sq; i++) {
    if (n % i == 0 && n != i) {
      return false;
    }
  }
  return true;
}

import '../week2/primes.dart';
import 'package:test/test.dart';

void main() {
  test('check if 23 returns true for prime', () {
    int num1 = 23;
    expect(isPrime(num1), equals(true));
  });
  test('check if 49 returns false for prime', () {
    int num2 = 49;
    expect(isPrime(num2), equals(false));
  });
}

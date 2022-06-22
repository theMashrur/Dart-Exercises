import 'package:test/test.dart';
import '../week5/rpcalc.dart';

void main() {
  test('stack addition', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push(2);
    calc.push("+");
    expect(calc.stack, [3]);
  });
  test('stack division', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push(2);
    calc.push("/");
    expect(calc.stack, [0.5]);
  });
  test('stack multiplication', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push(2);
    calc.push("*");
    expect(calc.stack, [2]);
  });
  test('stack cos', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push("cos");
    calc.push(2);
    calc.push("*");
    expect(calc.stack, [-0.4161468365471424]);
  });
  test('stack sin', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push("sin");
    calc.push(2);
    calc.push("*");
    expect(calc.stack, [0.9092974268256817]);
  });
  test('stack tan', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push("tan");
    calc.push(2);
    calc.push("*");
    expect(calc.stack, [0.28366218546322625]);
  });
  test('stack subtraction', () {
    RPCalc calc = new RPCalc();
    calc.push(1);
    calc.push(2);
    calc.push("-");
    expect(calc.stack, [-1]);
  });
}

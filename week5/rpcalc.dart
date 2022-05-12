import 'dart:math';

main() {}

class RPCalc {
  List stack = [];
  RPCalc();

  bool push(op) {
    if (op is num) {
      stack.add(op);
      return true;
    }
    num num1 = stack.removeLast();
    num num2 = stack.removeLast();
    switch (op) {
      case "+":
        stack.add(num1 + num2);
        break;
      case "-":
        stack.add(num1 - num2);
        break;
      case "*":
        stack.add(num1 * num2);
        break;
      case "/":
        stack.add(num1 / num2);
        break;
      case "^":
        stack.add(pow(num1, num2));
        break;
      case "sin":
        stack.add(num2);
        stack.add(sin(num1));
        break;
      case "cos":
        stack.add(num2);
        stack.add(cos(num1));
        break;
      default:
        break;
    }
    return false;
  }
}

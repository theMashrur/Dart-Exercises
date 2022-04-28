import 'dart:math';

void main() {
  var circ = Circle([0, 0], 1);
  print(circ.contains([0.5, 0.5]));
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
    if (pow(x1 - x0, 2) + pow(y1 - y0, 2) < pow(radius, 2)) {
      return true;
    }
    return false;
  }
}

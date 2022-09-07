import 'dart:math';

extension DoubleX on double {
  double toPrecision(int precision) {
    final factor = pow(10, precision);
    return (this * factor).round() / factor;
  }
}

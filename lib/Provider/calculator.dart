import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class Calc with ChangeNotifier {
  String _math = '';
  String _result = '0';

  String get getResult => _result;
  String get getmath => _math;

  void setMath(String syntax) {
    _math += syntax;
    notifyListeners();
  }

  void restart() {
    _math = '';
    _result = "0";
    notifyListeners();
  }

  void calculate() {
    try {
      final p = Parser();
      var expression = _math;
      expression = expression.replaceAll("x", "*");
      expression = expression.replaceAll("%", "/");

      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      // print(exp.toString() +'='+eval.toString());
      if (eval % 1 == 0) {
        int int_eval = eval.round();
        _result = int_eval.toString();
        notifyListeners();
        // print(int_eval);
      } else {
        // print(eval);
        _result = eval.toString();
        notifyListeners();
      }
    } catch (e) {
      _result = "Error!";
      notifyListeners();
    }
  }
}

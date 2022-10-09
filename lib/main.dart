import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String pr = '';
  String firstNum = '';
  String secondNum = '';
  String result = '';
  // ignore: non_constant_identifier_names
  String Equation = '';

  // ignore: non_constant_identifier_names
  void ButtonValue(String text) {
    setState(() {
      if (text == '+') {
        Equation = Equation + text;
        result = '';
      } else if (text == '-') {
        Equation = Equation + text;
        result = '';
      } else if (text == '*') {
        Equation = Equation + text;
        result = '';
      } else if (text == '/') {
        Equation = Equation + text;
        result = '';
      } else if (text == '=') {
        try {
          String finaluserinput = Equation;
          finaluserinput = Equation.replaceAll('x', '*');

          Parser p = Parser();
          Expression exp = p.parse(finaluserinput);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
        } catch (e) {
          Equation = 'Error';
        }
      } else if (text == 'C') {
        Equation = '';
        result = '';
      } else {
        firstNum = text;
        Equation = Equation + firstNum;
      }
    });
  }

  Widget button(String text, Color color) {
    return Expanded(
      child: FlatButton(
          onPressed: () {
            ButtonValue(text);
            print(text);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
          color: color,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Calculator",
              style: TextStyle(
                  letterSpacing: 1.75,
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.black,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    Equation,
                    style: const TextStyle(fontSize: 40.0, letterSpacing: 1.5),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.25),
                ),
              )),
              Row(
                children: [
                  button("%", Colors.orangeAccent),
                  button("/", Colors.orangeAccent),
                  button("C", Colors.blueGrey),
                ],
              ),
              Row(
                children: [
                  button("7", Colors.black45),
                  button("8", Colors.black45),
                  button("9", Colors.black45),
                  button("x", Colors.orangeAccent),
                ],
              ),
              Row(
                children: [
                  button("4", Colors.black45),
                  button("5", Colors.black45),
                  button("6", Colors.black45),
                  button("-", Colors.orangeAccent),
                ],
              ),
              Row(
                children: [
                  button("1", Colors.black45),
                  button("2", Colors.black45),
                  button("3", Colors.black45),
                  button("+", Colors.orangeAccent),
                ],
              ),
              Row(
                children: [
                  button('0', Colors.blueGrey),
                  button(".", Colors.black45),
                  button("=", Colors.orangeAccent),
                ],
              ),
            ],
          )),
    );
  }
}

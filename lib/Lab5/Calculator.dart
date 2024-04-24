// ignore: file_names
import 'package:flutter/material.dart';
import 'package:online_shop/Lab5/History.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  List<String> history = [];

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      String result = '';
      if (operand == "+") {
        result = (num1 + num2).toString();
      } else if (operand == "-") {
        result = (num1 - num2).toString();
      } else if (operand == "x") {
        result = (num1 * num2).toString();
      } else if (operand == "/") {
        result = (num1 / num2).toString();
      }
      _output = result;
      history.add("$num1 $operand $num2 = $result");
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(
                      history: history,
                    ),
                  ),
                );
              })
        ],
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 12.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  output,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("C"),
                buildButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

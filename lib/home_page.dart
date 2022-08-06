import 'package:calculator_app/widget/calculator_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String screenText = '0';
  num numberA = 0;
  num numberB = 0;
  String operator = '';
  bool isComa = false;
  bool isMinus = false;
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16),
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(operation,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      screenText,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            )),
            GridView.count(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorLight,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: 'C',
                    onTap: () {
                      setState(() {
                        screenText = '0';
                        operation = '';
                      });

                      numberA = 0;
                      numberB = 0;
                      operator = '';
                      isComa = false;
                      isMinus = false;
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorLight,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '+/-',
                    onTap: () {
                      setState(() {
                        screenText = addMinus(isMinus);
                      });
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorLight,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '%',
                    onTap: () {
                      var result = convertToPercen(num.parse(screenText));
                      setState(() {
                        screenText = result.toString();
                      });
                    }),
                CalculatorButton.icon(
                    backGroundColor: Theme.of(context).primaryColorDark,
                    foreGroundColor: Theme.of(context).primaryColorLight,
                    text: 'Backspace',
                    icon: Icons.backspace,
                    onTap: () {
                      setState(() {
                        if (screenText == '0' ||
                            screenText == '' ||
                            screenText.length == 1) {
                          screenText = '0';
                          isComa = false;
                          isMinus = false;
                        } else if (num.parse(screenText) < 0) {
                          screenText = '0';
                          isComa = false;
                          isMinus = false;
                        } else {
                          screenText =
                              screenText.substring(0, screenText.length - 1);
                        }
                      });
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '7',
                    onTap: () {
                      pressNumber(7);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '8',
                    onTap: () {
                      pressNumber(8);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '9',
                    onTap: () {
                      pressNumber(9);
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorDark,
                    foreGroundColor: Theme.of(context).primaryColorLight,
                    text: '/',
                    onTap: () {
                      setState(() {
                        operation = addOperator('/');
                        numberA = num.parse(screenText);
                        operator = '/';
                      });
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '4',
                    onTap: () {
                      pressNumber(4);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '5',
                    onTap: () {
                      pressNumber(5);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '6',
                    onTap: () {
                      pressNumber(6);
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorDark,
                    foreGroundColor: Theme.of(context).primaryColorLight,
                    text: 'X',
                    onTap: () {
                      setState(() {
                        operation = addOperator('x');
                        numberA = num.parse(screenText);
                        operator = 'x';
                      });
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '1',
                    onTap: () {
                      pressNumber(1);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '2',
                    onTap: () {
                      pressNumber(2);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '3',
                    onTap: () {
                      pressNumber(3);
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorDark,
                    foreGroundColor: Theme.of(context).primaryColorLight,
                    text: '-',
                    onTap: () {
                      setState(() {
                        operation = addOperator('-');
                        numberA = num.parse(screenText);
                        operator = '-';
                      });
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '0',
                    onTap: () {
                      pressNumber(0);
                    }),
                CalculatorButton(
                    backGroundColor: Colors.white,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '.',
                    onTap: () {
                      setState(() {
                        screenText = addComa(isComa);
                        isComa = true;
                      });
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorLight,
                    foreGroundColor: Theme.of(context).primaryColorDark,
                    text: '=',
                    onTap: () {
                      String result = sumNumber(operator).toString();
                      if (result.length < 9) {
                        result = result;
                      } else {
                        result = num.parse(result).toStringAsFixed(10);
                      }
                      setState(() {
                        operation = '$operation $numberB =';
                        screenText = result;
                      });

                      numberA = 0;
                      numberB = 0;
                      operator = '';
                      isComa = false;
                      isMinus = false;
                    }),
                CalculatorButton(
                    backGroundColor: Theme.of(context).primaryColorDark,
                    foreGroundColor: Theme.of(context).primaryColorLight,
                    text: '+',
                    onTap: () {
                      setState(() {
                        operation = addOperator('+');
                        numberA = num.parse(screenText);
                        operator = '+';
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void pressNumber(int number) {
    setState(() {
      print(isComa.toString());
      if (screenText == '0') {
        screenText = '$number';
      } else {
        if (operator.isNotEmpty) {
          if (isComa) {
          } else {
            screenText = '';
          }

          screenText = '$screenText$number';
          numberB = num.parse(screenText);
        } else {
          screenText = '$screenText$number';
        }
      }
    });
  }

  num convertToPercen(num number) {
    return number / 100;
  }

  String addComa(bool isComa) {
    return (!isComa ? '$screenText.' : screenText);
  }

  String addMinus(bool isMin) {
    if (!isMin) {
      isMinus = true;
      if (screenText == '0') {
        return screenText;
      } else {
        return '-$screenText';
      }
    } else {
      isMinus = false;
      return screenText.replaceFirst('-', '');
    }
  }

  String addOperator(String operator) {
    isComa = false;

    if (num.parse(screenText) < 0) {
      return '$screenText $operator';
    } else if (screenText.contains('+') ||
        screenText.contains('-') ||
        screenText.contains('x') ||
        screenText.contains('/')) {
      return '${screenText.substring(0, screenText.length - 1)}$operator';
    } else {
      return '$screenText $operator';
    }
  }

  num sumNumber(String operator) {
    if (operator == '+') {
      return numberA + numberB;
    } else if (operator == '-') {
      return numberA - numberB;
    } else if (operator == '/') {
      return numberA / numberB;
    } else if (operator == 'x') {
      return numberA * numberB;
    } else {
      return 0;
    }
  }
}

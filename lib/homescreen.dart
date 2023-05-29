import 'package:flutter/material.dart';
import 'common_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var lightgreyColor = Color.fromARGB(233, 155, 153, 153);
  var darkgreyColor = Color.fromARGB(255, 107, 105, 105);
  var backgroundColor = Color.fromARGB(244, 81, 79, 79);
  dynamic text = '0';
  int num1 = 0;
  int num2 = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Row(children: [
          CommonWidget(
              btnText: "AC",
              color: darkgreyColor,
              buttonTapped: () {
                Calculation('AC');
              }),
          CommonWidget(
              btnText: "+/-",
              color: darkgreyColor,
              buttonTapped: () {
                Calculation('+/-');
              }),
          CommonWidget(
              btnText: "%",
              color: darkgreyColor,
              buttonTapped: () {
                Calculation('%');
              }),
          CommonWidget(
              btnText: "÷",
              color: Colors.orangeAccent,
              buttonTapped: () {
                Calculation('÷');
              }),
        ]),
        Row(
          children: [
            CommonWidget(
                btnText: "7",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('7');
                }),
            CommonWidget(
                btnText: "8",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('8');
                }),
            CommonWidget(
                btnText: "9",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('9');
                }),
            CommonWidget(
                btnText: "×",
                color: Colors.orangeAccent,
                buttonTapped: () {
                  Calculation('×');
                }),
          ],
        ),
        Row(
          children: [
            CommonWidget(
                btnText: "4",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('4');
                }),
            CommonWidget(
                btnText: "5",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('5');
                }),
            CommonWidget(
                btnText: "6",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('6');
                }),
            CommonWidget(
                btnText: "-",
                color: Colors.orangeAccent,
                buttonTapped: () {
                  Calculation('-');
                }),
          ],
        ),
        Row(
          children: [
            CommonWidget(
                btnText: "1",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('1');
                }),
            CommonWidget(
                btnText: "2",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('2');
                }),
            CommonWidget(
                btnText: "3",
                color: lightgreyColor,
                buttonTapped: () {
                  Calculation('3');
                }),
            CommonWidget(
                btnText: "+",
                color: Colors.orangeAccent,
                buttonTapped: () {
                  Calculation('+');
                }),
          ],
        ),
        Row(children: [
          InkWell(
              child: Padding(
                padding: const EdgeInsets.all(0.5),
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 2.02,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: lightgreyColor,
                  ),
                  child: Center(
                      child: Text(
                    "0",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  )),
                ),
              ),
              onTap: () {
                Calculation('0');
              }),
          CommonWidget(
              btnText: ".",
              color: lightgreyColor,
              buttonTapped: () {
                Calculation('.');
              }),
          CommonWidget(
              btnText: "=",
              color: Colors.orangeAccent,
              buttonTapped: () {
                Calculation('=');
              }),
        ]),
      ]),
    );
  }

  void Calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      num1 = 0;
      num2 = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = subtract();
      } else if (preOpr == '×') {
        finalResult = mul();
      } else if (preOpr == '÷') {
        finalResult == div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '×' ||
        btnText == '÷' ||
        btnText == '=') {
      if (num1 == 0) {
        num1 = int.parse(result);
      }
      {
        num2 = int.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = subtract();
      } else if (opr == '×') {
        finalResult = mul();
      } else if (opr == '÷') {
        finalResult = div();
      }

      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = num1 / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (num1 + num2).toString();
    num1 = int.parse(result);
    return doesContainDecimal(result);
  }

  String subtract() {
    result = (num1 - num2).toString();
    num1 = int.parse(result);
    return result;
  }

  String mul() {
    result = (num1 * num2).toString();
    num1 = int.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (num1 / num2).toString();
    num1 = int.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) ;
      return result = splitDecimal[0].toString();
    }
    return result;
  }
}

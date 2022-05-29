import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SimpleCalculator());

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //USING THE MATERIALAPP THEME PROPS.
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          // primaryColor: Color(0xFF0A0E21),
          backgroundColor: Color(0xFF0A0E21),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //DECLARING VARIABLES
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String resultText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CENTERING AND STYLING THE APPBAR
      appBar: AppBar(
        title: Center(
          child: Text(
            'SIMPLE CALCULATOR',
            style: TextStyle(
              fontSize: 25.0,
              color: Color(0xFFA5672B),
            ),
          ),
        ),
      ),
      body:
          //PUTTING EVERTHING INSIDE A CONTAINING SO AS TO HAVE SOME MARGIN & PADDING PROPS.
          Container(
        margin: EdgeInsets.all(10.0),
        child:
            //EVERYTHING IS ARRANGED IN A COLUMN
            Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Number 1:',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFA5672B),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:
                      //TEXTFIED PROPS. & STYLING
                      TextField(
                    keyboardType: TextInputType.number,
                    controller: num1Controller,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    minLines: 1,
                    maxLines: 5,
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA5672B),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA5672B),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFA5672B),
                        ),
                        labelText: 'Number',
                        hintText: 'Enter Number'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Number 2:',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFA5672B),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:
                      //ANOTHER TEXTFIELD
                      TextField(
                    keyboardType: TextInputType.number,
                    controller: num2Controller,
                    style: TextStyle(fontSize: 20.0),
                    minLines: 1,
                    maxLines: 5,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA5672B),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA5672B),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFA5672B),
                        ),
                        labelText: 'Number',
                        hintText: 'Enter Number'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  //ELEVATEDBUTTON FOR  ADDITION
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA5672B),
                      //Color(0xFFE18B22),
                      //#A5672B
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 35.0),
                    ),
                    onPressed: () {
                      setState(() {
                        //ADDS AND GIVE RESULT THE TWO INPUT FIELDS
                        double result = double.parse(num1Controller.text) +
                            double.parse(num2Controller.text);
                        resultText = result.toStringAsFixed(1);
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  //height: 60.0,
                  //padding: EdgeInsets.only(right: 10.0),
                  child:
                      ////ELEVATEDBUTTON FOR  SUBTRACTION
                      ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA5672B),
                      //Color(0xFFE18B22),
                    ),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 35.0),
                    ),
                    onPressed: () {
                      setState(() {
                        //SUBTRACTS AND GIVE RESULT
                        double result = double.parse(num1Controller.text) -
                            double.parse(num2Controller.text);
                        resultText = result.toStringAsFixed(1);
                      });
                    },
                  ),
                ),

                //THE SIZEDBOX CREATE SPACE BETWEEN THE BUTTONS
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  //height: 60.0,
                  // padding: EdgeInsets.only(right: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA5672B),
                    ),
                    child: Text(
                      '*',
                      style: TextStyle(fontSize: 35.0),
                    ),
                    onPressed: () {
                      setState(() {
                        double result = double.parse(num1Controller.text) *
                            double.parse(num2Controller.text);
                        resultText = result.toStringAsFixed(1);
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  // height: 60.0,
                  //padding: EdgeInsets.only(right: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA5672B),
                    ),
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 35.0),
                    ),
                    onPressed: () {
                      setState(() {
                        double result = double.parse(num1Controller.text) /
                            double.parse(num2Controller.text);
                        resultText = result.toStringAsFixed(1);
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  //height: 60.0,
                  // padding: EdgeInsets.only(right: 10.0),
                  child:

                      //TO CLEAR THE TWO INPUT FIELDS AND RESULT
                      ElevatedButton(
                    child: Text(
                      'C',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA5672B),
                    ),
                    onPressed: () {
                      setState(() {
                        //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULT TO ZERO
                        num1Controller.text = '';
                        num2Controller.text = '';
                        resultText = '0';
                        // double result = double.parse(num1Controller.text) /
                        // double.parse(num2Controller.text);
                        //resultText = result.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result:',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Color(0xFFA5672B),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),

                //THE RESULT IS DISPLAYED HERE
                Text(
                  resultText,
                  style: TextStyle(fontSize: 35.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

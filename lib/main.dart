/**
 * Abdul Mahmoud
 * CIS*4030
 * Lab 3 Part A
 */

import 'package:flutter/material.dart';
import 'modules/CalcButton.dart';
import 'package:flutter/services.dart';


var isVisible = [false,false,false,false,false,false,false,false,false,false,false,false];

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print((MediaQuery.of(context).size.width));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Single Operation Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  bool isEnabled = false;
  String selectedOp = "";
  String equation = "";
  bool opAdded = false;
  bool calced = false;

  enableElevatedButton() {
    setState(() {
      isEnabled = true;
    });
  }
 
  disableElevatedButton(String op) {
    setState(() {
      isEnabled = false;
    });
    selectedOp = op;
    setTextOp(op);
  }

  setText(String data) {

    if(calced){
      calced = false;
      equation = "";
      clearText();
    }

    String tmp = equation + data;

    if(!opAdded){
      enableElevatedButton();
    }
    setState(() {
      equation = tmp;
    });
  }

  setTextOp(String data) {
    String tmp = equation + data;
    setState(() {
      equation = tmp;
    });

    opAdded = true;
  }

  clearText(){

    setState(() {
      equation = "";
    });

    opAdded = false;
  }

  calculateEquation(){
    print(equation);

    var test;

    if (equation.contains('+')){
      test = equation.split("+");
      var result = (int.parse(test[0]) + int.parse(test[1]));
      print(result);

      setState(() {
        equation = "$result";
      });

    }else if (equation.contains('-')){
      test = equation.split("-");
      var result = (int.parse(test[0]) - int.parse(test[1]));
      print(result);

      setState(() {
        equation = "$result";
      });

    }else if (equation.contains('*')){
      test = equation.split("*");
      var result = (int.parse(test[0]) * int.parse(test[1]));
      print(result);

      setState(() {
        equation = "$result";
      });

    }else if (equation.contains('/')){
      test = equation.split("/");
      var result = (int.parse(test[0]) / int.parse(test[1]));
      print(result);

      setState(() {
        equation = "$result";
      });

    }


    calced = true;

    // clearText();
    // enableElevatedButton();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      equation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 27),
                    ),
                  ),
                ),
            ),
            
            Row(
              children: <Widget>[
                Expanded(
                  flex: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: clearText,
                      child: const Text("Clear")
                    ),
                  ),
                ),

                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                        onPressed: isEnabled ? () => disableElevatedButton('/') : null,
                        child: const Text("/"),
                        
                      ),
                  ),
                ),
                  
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('7'),
                      child: const Text("7")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('8'),
                      child: const Text("8")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('9'),
                      child: const Text("9")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: isEnabled ? () => disableElevatedButton('*') : null,
                      child: const Text("*")
                    ),
                  ),
                ),
                  
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('4'),
                      child: const Text("4")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('5'),
                      child: const Text("5")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('6'),
                      child: const Text("6")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: isEnabled ? () => disableElevatedButton('-') : null,
                      child: const Text("-")
                    ),
                  ),
                ),
                  
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('1'),
                      child: const Text("1")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('2'),
                      child: const Text("2")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('3'),
                      child: const Text("3")
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: isEnabled ? () => disableElevatedButton('+') : null,
                      child: const Text("+")
                    ),
                  ),
                ),
                  
              ],
            ),
             Row(
              children: <Widget>[

                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => setText('0'),
                      child: const Text("0"),
                      
                    ),
                  ),
                ),
                
                Expanded(
                  flex: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => calculateEquation(),
                      child: const Text("=")
                    ),
                  ),
                ),
              ],
            ),
        ]
        ),
      ), //trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

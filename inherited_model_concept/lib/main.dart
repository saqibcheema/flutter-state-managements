import 'package:flutter/material.dart';
import 'package:inherited_model_concept/widgets/box1_widget.dart';
import 'package:inherited_model_concept/widgets/box2_widget.dart';
import 'model/color_inherited_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color primaryColor = Colors.red;
  Color secondaryColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ColorInheritedModel(
        color1: primaryColor,
        color2: secondaryColor,
        child: Scaffold(
          body: Center(
            child: buildBody()
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    primaryColor = primaryColor == Colors.red ? Colors.green : Colors.red;
                  });
                },
                child: Icon(Icons.arrow_upward),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    secondaryColor = secondaryColor == Colors.blue ? Colors.teal : Colors.blue;
                  });
                },
                child: Icon(Icons.arrow_downward),
              ),
            ],
          )
        ),
    );
  }
  Widget buildBody() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Box1(),
        const Box2()
      ]
  );
}
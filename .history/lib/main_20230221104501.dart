import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          MouseRegion(
            cursor: MouseCursor.uncontrolled,
            onHover: (event) {
              setState(() {
                x = event.localPosition.dx;
                y = event.localPosition.dy;
              });
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: x - 25,
            top: y - 25,
            child: Container(
              padding: EdgeInsets.all(12),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.green.withOpacity(0.5),
                    Colors.purple.withOpacity(0.1),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: const Icon(Icons.abc, size: 15)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

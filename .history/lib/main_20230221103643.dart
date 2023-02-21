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
              child: widget(
                child: Container(
                  // curve: Curves.easeInOut,
                  // duration: const Duration(milliseconds: 500),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                        right: Radius.circular(50),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.green,
                          Colors.purple,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 40,
                          spreadRadius: 20,
                        ),
                      ],
                      backgroundBlendMode: BlendMode.luminosity),
                ),
              )),
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

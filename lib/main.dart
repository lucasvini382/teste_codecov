import 'package:flutter/material.dart';
import 'package:test_codecov/second-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  bool showText = false;
  String text = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _changeText(bool show) {
    String strReturn;
    show ? strReturn = 'Ok' : strReturn = 'Não ok';
    return strReturn;
  }

  @override
  void initState() {
    // TODO: implement initState
    showText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
            SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    showText = !showText;
                  });
                  print(showText);
                },
                child: const Text('Exibir texto')),
            Row(
                key: Key('row_string'),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(_changeText(showText))]),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
                child: const Text('Próxima página')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/display_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _howMuchTime = '???';

  Future<void> cicloDePan(
    String label, [
    int limite = 500,
  ]) async {
    if (_counter == limite) {
      _counter = 0;
    }
    _howMuchTime = '?';
    final DateTime dateTime = DateTime.now();
    while (_counter < limite) {
      _counter++;
      await Future<void>.delayed(
        const Duration(milliseconds: 10),
      );
      setState(() {});
    }
    _howMuchTime =
        DateTime.now().difference(dateTime).inMilliseconds.toString();
    _howMuchTime = '🍞🌭🥯🥖 $_howMuchTime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const DisplayWidget(
              label: 'Tablero meta',
              counter: 200,
            ),
            DisplayWidget(
              label: _howMuchTime,
              counter: _counter,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter = 0;
          cicloDePan('En UI', 250);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

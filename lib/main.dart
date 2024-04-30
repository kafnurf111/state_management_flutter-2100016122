import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample - 2100016122',
      home: CounterApp(),
    );
  }
}

class Counter with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
        // ----- Context Watch ----//
        child: Text(
            'You have pressed the button ${context.watch<Counter>().number} times.'),
      ),

      // ----- Context Provider ----//
      //   child: Text(
      //       'You have pressed the button ${Provider.of<Counter>(context).number} times.'),
      // ),
      floatingActionButton: FloatingActionButton(
        // --- Context Read - Watch --- //
        onPressed: () => context.read<Counter>().decrement(),

        // --- Context Provider -> listen - Provider --- //
        // onPressed: () =>
        //     Provider.of<Counter>(context, listen: false).decrement(),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}

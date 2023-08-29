// int lenghtCounter = 0;
// int chainCounter = 0;
// while (pairs.length > lenghtCounter && lenghtCounter + 1 < pairs.length) {
//   if (pairs[lenghtCounter][1] < pairs[lenghtCounter + 1][0]) {
//     ++chainCounter;
//   }
//   ++lenghtCounter;
// }
// return chainCounter;
import 'dart:ffi';

import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
    _counter = findLongestChain([
      [-10, -8],
      [8, 9],
      [-5, 0],
      [6, 10],
      [-6, -4],
      [1, 7],
      [9, 10],
      [-4, 7]
    ]);
    setState(() {
      _counter = _counter + 0;
    });
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'You are given an array of n pairs pairs where pairs[i] = [lefti, righti] and lefti < righti. A pair p2 = [c, d] follows a pair p1 = [a, b] if b < c. A chain of pairs can be formed in this fashion. Return the length longest chain which can be formed. You do not need to use up all the given intervals. You can select pairs in any order.',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Sort',
        child: const Icon(Icons.add),
      ),
    );
  }

  int findLongestChain(List<List<int>> pairs) {
    pairs.sort((a, b) => a[0] - b[0]);
    pairs.forEach((element) => element.sort());
    int chainCounter = 1;
    int lastChainNumber = pairs[0][1];
    for (int i = 0; i < pairs.length - 1; i++) {
      if (pairs[i][1] < pairs[i + 1][0]) {
        ++chainCounter;
      } else if (lastChainNumber < pairs[i + 1][0]) {
        ++chainCounter;
      } else {
        lastChainNumber = pairs[i][1];
      }
    }
    return chainCounter;
  }
}

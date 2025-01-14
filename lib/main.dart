import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App-Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyPage(title: 'Testing Layout'),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Color _containerColor = Colors.purple;

  void _getRandomColor() {
    setState(() {
      _containerColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Top Layout
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: const Text('Top Layout'),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //First Column
                Expanded(
                  child: Container(),
                ),
                //Second Column
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(5, 5),
                        )
                      ],
                      color: _containerColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Text('My Aplication'),
                  ),
                ),
                //Third Column
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          //Bottom Layout
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              //color: const Color.fromARGB(255, 252, 141, 237),
              child: const Text('Bottom Layout'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomColor,
        tooltip: 'Change',
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}

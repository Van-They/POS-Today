import 'package:flutter/material.dart';

class AppFlavor extends StatelessWidget {
  final String flavorName;
  const AppFlavor({super.key,this.flavorName = 'Flavor Name'});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
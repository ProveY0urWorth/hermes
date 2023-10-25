import 'package:flutter/material.dart';
import 'package:hermes/src/core/tab_bar/tab_bar.dart';

class App extends StatelessWidget {
  @override
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: HermesTabBar(),
      ),
    );
  }
}

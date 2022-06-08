import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Animate extends StatefulWidget {
  const Animate({Key? key}) : super(key: key);

  @override
  State<Animate> createState() => _AnimateState();
}

class _AnimateState extends State<Animate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}

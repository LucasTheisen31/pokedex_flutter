import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.erro}) : super(key: key);

  final String erro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(erro),
      ),
    );
  }
}

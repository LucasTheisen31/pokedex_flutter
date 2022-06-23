import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key, required this.nome}) : super(key: key);

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

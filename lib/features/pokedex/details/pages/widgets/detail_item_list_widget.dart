import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {Key? key, required this.isDiff, required this.pokemon})
      : super(key: key);

  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,//alinha no centro da parte de baixo
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            tween: Tween<double>(
              end: isDiff ? 150 : 300,
              begin: isDiff ? 300 : 150,
            ),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
              );
            }),
      ),
    );
  }
}

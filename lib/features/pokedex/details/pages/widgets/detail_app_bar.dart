
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    Key? key,
    required this.pokemon,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);

  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(//barra de aplicativos rolável
      pinned: true,//fixado, quando rolar a SliverAppBar nao vai rolar para cima, ela esta fixada
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.chevron_left),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          pokemon.nome,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
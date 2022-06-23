import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({Key? key, required this.pokemon, required this.onTap, required this.index}) : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon, index: index)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                //cor do widget de cada pokemon
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //alinhamento da horizontal
                mainAxisAlignment: MainAxisAlignment.center,
                //alinhamento na vertital
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //alinhamento na vertital, spaceBetween = um para cada lado
                    children: [
                      Flexible(
                        //para ajustar a quebra de linha do texto automaticamente
                        child: Text(
                          pokemon.nome,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //alinhamento da horizontal
                    mainAxisAlignment: MainAxisAlignment.start,
                    //alinhamento na vertital
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            pokemon.type.map((e) => TypeWidget(nome: e)).toList(),
                      ),
                      Flexible(
                        child: Container(
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 2,
            child: Image.network(
              pokemon.image,
              height: 110,
            ),
          )
        ],
      ),
    );
  }
}

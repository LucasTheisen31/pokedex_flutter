import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);

  final List<Pokemon> list;
  final Function(String, DetailArguments)
      onItemTap; //funcao que recebe uma string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              child: CircleAvatar(
                foregroundColor: Colors.transparent,
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/f4/59/98/f459980b6a50cbfb897a7299ca86dab0.gif'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 80,
              width: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://imagensemoldes.com.br/wp-content/uploads/2020/04/Pok%C3%A9mon-Com-Fundo-Transparente.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Pokedex',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Teste',
                    textAlign: TextAlign.center,
                  ),
                ));
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              tooltip: 'Menu',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          physics: BouncingScrollPhysics(),
          //Física de rolagem para ambientes que permitem que o deslocamento de rolagem vá além dos limites do conteúdo
          mainAxisSpacing: 12,
          //Espaçamento do eixo principal dos grid-
          crossAxisSpacing: 12,
          //Espaçamento entre eixos dos grid |
          crossAxisCount: 2,
          // Cria um grid com duas colunas
          children: list
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemTap,
                    index: list.indexOf(e), //indice do objeto (e) na lista
                  ))
              .toList(),
        ),
      ),
    );
  }
}

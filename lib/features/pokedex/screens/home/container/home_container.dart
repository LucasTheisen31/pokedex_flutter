
import 'package:flutter/cupertino.dart';
import 'package:pokedex_flutter/common/errors/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/common/widgets/po_error.dart';
import 'package:pokedex_flutter/common/widgets/po_loading.dart';
import 'package:pokedex_flutter/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository, required this.onItemTap}) : super(key: key);

  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;//funcao que recebe uma string

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(future: repository.getAllPokemons(), builder: (context, snapshot) {

      if(snapshot.connectionState == ConnectionState.waiting){
        return PoLoading();
      }

      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){//ConnectionState.done'se conectou com sucesso' e cosnapshot.hasdata para verificar se o FutureBuilder recebeu os dados.
        return HomePage(list: snapshot.data!, onItemTap: onItemTap,);//retorna a HomePage com a lista de dados e o onItemTap
      }

      if(snapshot.hasError){//se ouve erro
        return PoError(error: (snapshot.error as Failure).message!);//cast converte snapshot.error em Failure.message
      }

      return Container();

    },);
  }
}


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/common/consts/api_consts.dart';
import 'package:pokedex_flutter/common/errors/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

abstract class IPokemonRepository{//classe abstrata
  Future<List<Pokemon>> getAllPokemons();//metodo abstrato que deve ser implementado
}

class PokemonRepository implements IPokemonRepository{//classe que implementa a classe abstrata
  //atributos
  final Dio dio;

  //metodos
  PokemonRepository({required this.dio});//construtor com paramentro obrigatorio que é o dio

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);//dio.get pega os dados json da url contida na classe ApiConsts no atributo allPokemonsURL, duvida so olhar a classe Api...
      final json = jsonDecode(response.data) as Map<String, dynamic>;//jsonDecode analisa a string e retorna o objeto Json resultante e converte em um Map onde o 1 paramentro é uma string e o segundo um dynamic ex: "id": 1
      final list = json['pokemon'] as List<dynamic>; //pokemon é a chave
      return list.map((e) => Pokemon.fromMap(e)).toList();//para cada pokemos da lista vai chamar o metodo fromMap da classe pokemon(esse metodo retorna alguns dados, olhar na classe Pokemon), .toList() cria uma lista com todos os pokemons
    } catch (e) {
      throw Failure(message: 'Não foi possivel carregar os dados');
    }
  }
}
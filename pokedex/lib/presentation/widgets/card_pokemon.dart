import 'package:flutter/material.dart';
import 'package:pokedex/application/constants/string_constants.dart';
import 'package:pokedex/application/constants/url_constants.dart';
import 'package:pokedex/application/route/router.dart';
import 'package:pokedex/domain/model/pokemons.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => context.pushDetail(pokemon.url, pokemon.detail),
      child: SizedBox(
        width: size.width / 3 - 11,
        height: 112,
        child: Card(
          child: Stack(
            children: [
              Positioned(
                top: 8,
                right: 8,
                child: Text(
                  '#${pokemon.detail?.order.toString().padLeft(3, '0') ?? ""}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.19,
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width / 3 - 11,
                  height: 44,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      pokemon.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1C1C1C),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.16,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                  child: Image.network(
                    pokemon.detail?.image ?? "",
                    width: 85,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

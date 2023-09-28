import 'package:flutter/material.dart';
import 'package:pokedex/application/utils/mapper_colors.dart';
import 'package:pokedex/application/utils/stats_extension.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/presentation/widgets/strength_bar.dart';
import 'package:pokedex/presentation/widgets/types_pokemon.dart';

class CardPokemonDetail extends StatelessWidget {
  final PokemonDetail pokemon;
  const CardPokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 412,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.types
                  .map((e) => TypesPokemon(
                        type: e,
                        color: getColorByString(e),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'About',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: pokemon.color,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 32,
                      child: Text(
                        '${pokemon.weight} kg',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'Weight',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 48, child: VerticalDivider(color: Colors.black)),
                Column(
                  children: [
                    SizedBox(
                      height: 32,
                      child: Text(
                        '${pokemon.height} m',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'Height',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 48, child: VerticalDivider(color: Colors.black)),
                Column(
                  children: [
                    SizedBox(
                      height: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.moves
                            .take(2)
                            .map((e) => Text(
                                  e,
                                  style: const TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const Text(
                      'Moves',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Base Stats',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: pokemon.color,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Column(
                  children: pokemon.baseStats
                      .map((e) => Text(
                            e.name.getAbbreviation(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: pokemon.color,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ))
                      .toList(),
                ),
                const VerticalDivider(),
                Column(
                  children: pokemon.baseStats
                      .map((e) => Row(
                            children: [
                              Text(
                                e.baseStat.toString().padLeft(3, '0'),
                                style: const TextStyle(
                                  color: Color(0xFF1C1C1C),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                child: StrengthBar(
                                  width: size.width * 0.7,
                                  currentValue: e.baseStat,
                                  color: pokemon.color,
                                ),
                              )
                            ],
                          ))
                      .toList(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

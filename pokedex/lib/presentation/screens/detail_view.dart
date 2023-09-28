import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/application/utils/mapper_colors.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/presentation/screens/detail_viewmodel.dart';

import '../widgets/types_pokemon.dart';

class DetailView extends StatefulWidget {
  final String url;
  final Object? pokemon;

  const DetailView({Key? key, required this.url, required this.pokemon})
      : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _detailViewModel = getIt<DetailViewModel>();
  Color bgColor = Colors.white;

  @override
  void initState() {
    _detailViewModel.start();
    final pokemon = widget.pokemon;
    if (pokemon != null) {
      _detailViewModel.setPokemonDetail(pokemon as PokemonDetail);
    } else {
      _detailViewModel.fetchPokemonDetails(widget.url);
    }
    super.initState();
  }

  @override
  void dispose() {
    _detailViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<PokemonDetail?>(
        stream: _detailViewModel.pokemonDetailOutput,
        builder: (context, snapshot) {
          final pokemon = snapshot.data;
          return pokemon != null
              ? Scaffold(
                  backgroundColor: pokemon.color,
                  body: SafeArea(
                    minimum: EdgeInsets.all(4),
                    child: Stack(
                      children: [
                        Positioned(
                            child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                iconSize: 32,
                                color: Colors.white,
                                icon: Icon(
                                  Icons.arrow_back_sharp,
                                )),
                            Text(
                              'Bulbasaur',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '#${pokemon.order.toString().padLeft(3, '0') ?? ""}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        )),
                        SizedBox(
                          height: 600,
                          width: 600,
                          child: Image.network(
                            pokemon.image ?? "",
                            width: 30,
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          width: size.width,
                          child: Column(
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
                              SizedBox(
                                height: 10,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '6,9 kg',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xFF1C1C1C),
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
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
                                  VerticalDivider(),
                                  Column(
                                    children: [
                                      Text(
                                        '6,9 kg',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xFF1C1C1C),
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
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
                                  VerticalDivider(),
                                  Column(
                                    children: [
                                      Column(
                                        children: pokemon.moves
                                            .map((e) => Text(
                                                  e,
                                                  style: TextStyle(
                                                    color: Color(0xFF1C1C1C),
                                                    fontSize: 10,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ))
                                            .toList(),
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
                                ],
                              ),
                              Text(
                                'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFF1C1C1C),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Base Stats',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF74CB48),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: pokemon.baseStats.map((e) => Text(
                                      e.name,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF74CB48),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )).toList(),
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    children: pokemon.baseStats.map((e) => Row(
                                      children: [
                                        Text(
                                          e.baseStat.toString().padLeft(3, '0'),
                                          style: TextStyle(
                                            color: Color(0xFF1C1C1C),
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        LinearProgressIndicator(
                                          value: e.baseStat/255,
                                          backgroundColor: Colors.grey,
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                        ),
                                      ],
                                    )).toList(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
        });
  }
}

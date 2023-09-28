import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/presentation/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/presentation/widgets/card_pokemon_detail.dart';

class DetailView extends StatefulWidget {
  final String url;
  final Object? pokemon;

  const DetailView({Key? key, required this.url, required this.pokemon})
      : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _pokemonDetailBloc = getIt<PokemonDetailBloc>();
  Color bgColor = Colors.white;

  @override
  void initState() {
    final pokemon = widget.pokemon;
    if (pokemon != null) {
      _pokemonDetailBloc.add(SetPokemonDetailEvent(pokemon as PokemonDetail));
    } else {
      _pokemonDetailBloc.add(FetchPokemonDetailEvent(widget.url));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (context, state) {
      if (state is PokemonDetailLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is PokemonDetailLoaded) {
        final pokemon = state.pokemons;
        return Scaffold(
          backgroundColor: pokemon.color,
          body: SafeArea(
            minimum: const EdgeInsets.all(4),
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0, child: CardPokemonDetail(pokemon: pokemon)),
                  Positioned(
                      top: 0,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    iconSize: 32,
                                    color: Colors.white,
                                    icon: const Icon(
                                      Icons.arrow_back_sharp,
                                    )),
                                Text(
                                  pokemon.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                '#${pokemon.order.toString().padLeft(3, '0')}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    top: 60,
                    left: (size.width - 300) / 2,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.image,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (state is PokemonDetailError) {
        return const Scaffold(
          body: Center(child: Text("There was an error loading the Pokémon.")),
        );
      } else {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
    });
  }
}

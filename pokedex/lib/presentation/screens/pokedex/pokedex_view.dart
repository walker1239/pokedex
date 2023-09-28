import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/application/constants/color_constants.dart';
import 'package:pokedex/application/constants/double_constants.dart';
import 'package:pokedex/application/constants/icons.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/presentation/screens/pokedex/bloc/pokemons_bloc.dart';
import 'package:pokedex/presentation/widgets/card_pokemon.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  final _pokemonBloc = getIt<PokemonsBloc>();
  final _searchTextEditCtrl = TextEditingController();

  @override
  void initState() {
    _pokemonBloc.add(FetchPokemonsEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.c01,
      body: SafeArea(
        minimum: const EdgeInsets.all(DoubleConstants.d4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 12, right: 12, bottom: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      AppIcons.pokeballIcon,
                      const SizedBox(
                        width: DoubleConstants.d16,
                      ),
                      const Text(
                        'Pokédex',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: DoubleConstants.d8,
                  ),
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchTextEditCtrl,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8),
                                hintText: "Search",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) {
                              _pokemonBloc.add(SearchPokemonEvent(value));
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        const InkWell(
                          child: SizedBox(
                            width: 32,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Center(
                                    child: Text(
                                  "A",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorConstants.c01,
                                    decoration: TextDecoration.underline,
                                  ),
                                ))),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DoubleConstants.d8),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: BlocBuilder<PokemonsBloc, PokemonsState>(
                    builder: (context, state) {
                      if (state is PokemonsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is PokemonsLoaded &&
                          state.pokemons != null) {
                        final data = state.pokemonsSearch ?? state.pokemons;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 8,
                            alignment: WrapAlignment.spaceEvenly,
                            children: data!.results
                                .map((i) => CardPokemon(pokemon: i))
                                .toList(),
                          ),
                        );
                      } else {
                        // Puedes manejar otros estados de error aquí si es necesario
                        return const Center(
                          child:
                              Text("There was an error loading the Pokémon."),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

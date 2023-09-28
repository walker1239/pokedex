import 'package:flutter/material.dart';
import 'package:pokedex/application/constants/color_constants.dart';
import 'package:pokedex/application/constants/double_constants.dart';
import 'package:pokedex/application/constants/icons.dart';
import 'package:pokedex/application/constants/int_constants.dart';
import 'package:pokedex/application/constants/string_constants.dart';
import 'package:pokedex/application/constants/url_constants.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/presentation/pokedex_viewmodel.dart';
import 'package:pokedex/presentation/widgets/card_pokemon.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  final _pokedexViewModel = getIt<PokedexViewModel>();
  final _searchTextEditCtrl = TextEditingController();

  @override
  void initState() {
    _pokedexViewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _pokedexViewModel.finish();
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
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 24),
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
                  const SizedBox(height: DoubleConstants.d8,),
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: size.width*0.75,
                            child: TextFormField(
                              controller: _searchTextEditCtrl,
                              decoration: InputDecoration(
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
                                //_registerViewModel.setMother(value.isEmpty ? null : value);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 32,
                          child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                          ), child: Text("A")),
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
                  child: StreamBuilder<Pokemons?>(
                      stream: _pokedexViewModel.pokemonsOutput,
                      builder: (context, snapshot) {
                        final data = snapshot.data;
                        return data != null
                            ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: data.results
                                      .map((i) => CardPokemon(pokemon: i))
                                      .toList(),
                                ),
                            )
                            : const CircularProgressIndicator();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

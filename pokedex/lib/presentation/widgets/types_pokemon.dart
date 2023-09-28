import 'package:flutter/material.dart';

class TypesPokemon extends StatelessWidget {
  final Color color;
  final String type;
  const TypesPokemon({Key? key, required this.color, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

  }
}

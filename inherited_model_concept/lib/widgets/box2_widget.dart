import 'package:flutter/material.dart';
import '../model/color_inherited_model.dart';

class Box2 extends StatelessWidget {
  const Box2({super.key});

  @override
  Widget build(BuildContext context) {
    final color = ColorInheritedModel.of(context,'color2');
    print('Build box 2');
    return Container(
      color: color!.color2,
      height: 100,
      width: 200,
    );
  }
}

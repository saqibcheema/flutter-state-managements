import 'package:flutter/material.dart';
import '../model/color_inherited_model.dart';

class Box1 extends StatelessWidget {
  const Box1({super.key});

  @override
  Widget build(BuildContext context) {
    final color = ColorInheritedModel.of(context,'color1');
    print('Build box 1');
    return Container(
      color: color!.color1,
      height: 100,
      width: 200,
    );
  }
}
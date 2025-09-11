import 'package:flutter/material.dart';

/// A custom InheritedModel to provide two colors down the widget tree.
/// It allows widgets to rebuild only when the color they depend on changes.

class ColorInheritedModel extends InheritedModel<String> {
  final Color color1;
  final Color color2;

  const ColorInheritedModel({
    required this.color1,
    required this.color2,
    required super.child,
    super.key,
  });

  /// Used by children to get the nearest ColorInheritedModel
  /// and listen only for specific color aspect changes.
  static ColorInheritedModel? of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<ColorInheritedModel>(
      context,
      aspect: aspect,
    );
  }

  /// Called when any color changes.
  /// If either color changed, all dependents may rebuild.
  @override
  bool updateShouldNotify(ColorInheritedModel oldWidget) {
    return oldWidget.color1 != color1 || oldWidget.color2 != color2;
  }

  @override
  bool updateShouldNotifyDependent(
    ColorInheritedModel oldWidget,
    Set<String> aspects,
  ) {
    if (aspects.contains('color1') && oldWidget.color1 != color1) {
      return true;
    }
    if (aspects.contains('color2') && oldWidget.color2 != color2) {
      return true;
    }
    return false;
  }
}

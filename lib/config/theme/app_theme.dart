import 'package:flutter/material.dart';

  Color _customColor = const Color(0xFF5C11D4);
   
   List<Color> _colorThemes = [
    _customColor,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink.shade50,
   ];
class Apptheme {
   final int selectedColor;

  Apptheme({
    this.selectedColor = 0 
    }): assert (selectedColor >=0 && selectedColor <= _colorThemes.length -1, 
              'Colors must be beteween 0 and ${_colorThemes.length}');

  ThemeData theme (){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes [selectedColor]
    );

  }
}
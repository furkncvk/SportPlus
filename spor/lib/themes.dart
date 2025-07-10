import 'package:flutter/material.dart';

//Koyu-açık tema ayarları

class Themes {

static final ThemeData lightTheme = ThemeData(  
brightness: Brightness.light, // Açık tema için
useMaterial3: true,
colorSchemeSeed: Colors.blue,
);

static final ThemeData darkTheme = ThemeData(
brightness: Brightness.dark, // Koyu tema için
useMaterial3: true,
colorSchemeSeed: Colors.blue,
);
}
import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  bool get isGlutenFree => _isGlutenFree;
  bool get isLactoseFree => _isLactoseFree;
  bool get isVegetarian => _isVegetarian;
  bool get isVegan => _isVegan;

  void setGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  void setLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  void setVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  void setVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}

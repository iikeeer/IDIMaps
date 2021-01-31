import 'package:flutter/material.dart';

class MapRoutes extends ChangeNotifier {
  var cont = 0;
  void sumar() {
    cont++;
    notifyListeners();
  }

   void restar() {
    cont--;
    notifyListeners();
  }

  void cero() {
    cont = 0;
    notifyListeners();
  }
}
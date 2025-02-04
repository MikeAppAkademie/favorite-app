import 'package:favorites_app/models/product.dart';
import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', name: 'Banane'),
    Product(id: '2', name: 'Apfel'),
    Product(id: '3', name: 'Erdbeere'),
    Product(id: '4', name: 'Birne'),
  ];

  List<Product> get products => _products;

  List<Product> get favoriteProducts =>
      _products.where((product) => product.isFavorite).toList();

  void toggleFavorite({required String id}) {
    final product = _products.firstWhere((product) => product.id == id);
    product.isFavorite = !product.isFavorite;
    notifyListeners(); // UI aktualisieren
  }
}

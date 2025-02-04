import 'package:favorites_app/provider/favorites.dart';
import 'package:favorites_app/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Badge.count(
            count: context.watch<FavoritesProvider>().favoriteProducts.length,
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      favoriteProducts: favoritesProvider.favoriteProducts,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: favoritesProvider.products.length,
        itemBuilder: (context, index) {
          final product = favoritesProvider.products[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color.fromARGB(255, 150, 202, 228),
            child: ListTile(
              title: Text(product.name),
              trailing: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.red : null,
                ),
                onPressed: () =>
                    favoritesProvider.toggleFavorite(id: product.id),
              ),
            ),
          );
        },
      ),
    );
  }
}

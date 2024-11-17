import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:state_test/constants/products.dart';
import 'package:state_test/main.dart';
import 'package:state_test/models/cart.dart';
import 'package:state_test/providers/cart_provider.dart';
import 'package:state_test/providers/theme_provider.dart';
import 'package:state_test/widgets/new_product_form.dart';
import 'package:state_test/widgets/shopping_cart.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.read(itemProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Market"), actions: [
        const ShoppingCart(),
        IconButton(
            onPressed: () {
              final themeController = ref.read(themeProvider.notifier);
              themeController.toggleTheme();
            },
            icon: const Icon(
                ThemeMode == ThemeMode.light ? Icons.light : Icons.dark_mode))
      ]),
      body: ListView(children: [
        for (var item in itemList.state)
          ListTile(
            leading: Text(
              item['id'].toString(),
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue),
            ),
            title: Text(
              item['name'].toString(),
              maxLines: 1,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
              item['category'].toString(),
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () {
                    final cart = ref.read(cartProvier.notifier);
                    final newItem = Item(
                      id: item['id'] as int,
                      name: item['name'].toString(),
                      category: item['category'].toString(),
                      price: item['price'] as int,
                    );
                    cart.addToCart(newItem);
                    // Show SnackBar with updated cart length
                  },
                  style: IconButton.styleFrom(backgroundColor: Colors.green),
                  icon: const Icon(Icons.add_shopping_cart),
                  iconSize: 24,
                  color: Colors.white, // Foreground color
                  padding: const EdgeInsets.all(8), // Adjust padding
                  splashRadius: 20, // Set splash effect radius
                ),
              ],
            ),
          ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  return const NewProductForm();
                },
              );
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}

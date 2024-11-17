import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_test/providers/cart_provider.dart';
import 'package:state_test/providers/theme_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartProvier);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final themeController = ref.read(themeProvider.notifier);
                  themeController.toggleTheme();
                },
                icon: const Icon(ThemeMode == ThemeMode.light
                    ? Icons.light
                    : Icons.dark_mode))
          ]),
      body: ListView(children: [
        for (var item = 0; item < cart.length; item++)
          ListTile(
              leading: Text(
                (item + 1).toString(),
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue),
              ),
              title: Text(
                cart[item].name.toString(),
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                cart[item].category.toString(),
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    cart[item].price.toString(),
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),
                  IconButton(
                      icon: const Icon(Icons.remove),
                      style: IconButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () {
                        ref.watch(cartProvier);
                        ref
                            .read(cartProvier.notifier)
                            .removeFromCart(cart[item].id);
                      }),
                ],
              )),
      ]),
    );
  }
}

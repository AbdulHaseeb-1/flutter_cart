import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_test/models/cart.dart';
import 'package:state_test/providers/shared_prefs_provider.dart';

class CartNotifier extends StateNotifier<List<Item>> {
  SharedPreferences prefs;
  String cartKey = "_cart";
  CartNotifier(this.prefs) : super([]) {
    initCart();
  }

  void initCart() {
    _loadCartFromPrefs();
  }

  // Load cart from SharedPreferences
  void _saveCartToPrefs() {
    try {
      prefs.setStringList(
        cartKey,
        state.map((item) => jsonEncode(item)).toList(),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to save cart data.");
    }
  }

  void _loadCartFromPrefs() {
    try {
      final savedCart = prefs.getStringList(cartKey);
      if (savedCart != null) {
        state =
            savedCart.map((item) => Item.fromJson(jsonDecode(item))).toList();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to load cart data.");
    }
  }

  void addToCart(Item item) {
    bool isPresent = state.any((element) => element.id == item.id);
    if (isPresent) {
      _showToast("Already in the cart!", Colors.red);
    } else {
      state = [...state, item];
      _saveCartToPrefs();
      _showToast("Item added to the cart!", Colors.green);
    }
  }

  // Save current state to SharedPreferences

  void removeFromCart(int id) {
    state = state.where((element) => element.id != id).toList();
    _saveCartToPrefs();
  }

  void emptyCart() {
    state = [];
    _saveCartToPrefs();
  }

  int getlength() {
    return state.length;
  }

  void _showToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

final cartProvier = StateNotifierProvider<CartNotifier, List<Item>>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return CartNotifier(prefs);
});

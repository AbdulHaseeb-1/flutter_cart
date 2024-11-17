import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  SharedPreferences prefs;
  ThemeNotifier(this.prefs) : super(ThemeMode.light);
  Future<void> initTheme(String initTheme) async {
    state = initTheme == "light" ? ThemeMode.light : ThemeMode.dark;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    try {
      prefs.setString(
          "_themeMode", state == ThemeMode.light ? "light" : "dark");
    } catch (e) {
      // Handle potential error (e.g., logging)
      Fluttertoast.showToast(msg: "Error while saving theme ...");
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
    (ref) => throw UnimplementedError());

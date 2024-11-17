import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_test/constants/theme_data.dart';
import 'package:state_test/pages/cart_page.dart';
import 'package:state_test/pages/home_page.dart';
import 'package:state_test/providers/shared_prefs_provider.dart';
import 'package:state_test/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final initTheme = prefs.getString("_themeMode") ?? "light";

  runApp(ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => prefs),
        themeProvider.overrideWith((ref) {
          final themeNotifier = ThemeNotifier(prefs);
          themeNotifier.initTheme(initTheme); // Initialize the theme
          return themeNotifier;
        }),
      ],
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MyApp(initTheme),
      )));
}

class MyApp extends ConsumerWidget {
  final String initTheme;
  const MyApp(this.initTheme, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(themeProvider);
    ref.watch(themeProvider);
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo ',
      routes: {
        "/": (c) => const HomePage(),
        "/cart": (c) => const CartPage(),
      },
    );
  }
}

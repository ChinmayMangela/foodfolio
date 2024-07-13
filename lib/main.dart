import 'package:flutter/material.dart';
import 'package:foodfolio/presentation/providers/favorite_meal_provider.dart';
import 'package:foodfolio/presentation/providers/filter_provider.dart';
import 'package:foodfolio/presentation/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF151e0b),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);


void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<FilterProvider>(create: (context) => FilterProvider(),),
      ChangeNotifierProvider<FavoriteMealProvider>(create: (context) => FavoriteMealProvider(),),
    ],
    builder: (context, _) {
      return const MyApp();
    },)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}

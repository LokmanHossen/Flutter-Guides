import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealsApp',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: theme.colorScheme.copyWith(
          secondary: const Color.fromRGBO(245, 188, 18, 1),
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(129, 149, 149, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(129, 149, 149, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // theme.copyWith(
      //   colorScheme: theme.colorScheme.copyWith(
      //     primary: Colors.pink,
      //     secondary: Colors.amber,
      //     // secondary: const Color.fromRGBO(225, 254, 229, 1),
      //   ),
      // ),
      // home: const CategoriesScreen(),
      initialRoute: './',
      routes: {
        './': (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealsDetailsScreen.routeName: (ctx) => const MealsDetailsScreen(),
      },
    );
  }
}

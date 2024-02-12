import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import './screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_sceen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluter': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingindex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingindex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          dummyMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealfavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

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
        './': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealsDetailsScreen.routeName: (ctx) =>
            MealsDetailsScreen(_toggleFavourite,_isMealfavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   // print(settings.arguments);
      //   // return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}

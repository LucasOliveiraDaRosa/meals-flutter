import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(
    this.favoriteMeals,
  );

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectScreenIndex = 0;
  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectScreenIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

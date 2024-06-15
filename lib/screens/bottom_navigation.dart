import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:zen/screens/home_screen.dart';
import 'package:zen/screens/notes_screen.dart';
import 'package:zen/screens/settings_screen.dart';
import 'package:zen/screens/stats_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  Widget body(index, scrollController) {
    switch (index) {
      case 0:
        return HomeScreen(scrollController:scrollController);
      case 1:
        return const StatsScreen();
      case 2:
        return const NotesScreen();
      case 3:
        return const SettingScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: body(_currentPage,_scrollController),
      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: _scrollController,
        hideOnScroll: true,
        indicatorColor: Theme.of(context).primaryColor,
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        margin: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
        selectedIndex: _currentPage,
        indicatorSize: 6,
        borderRadius: 20,
        height: 70,
        onTap: (index) {
          setState(() => _currentPage = index);
        },
        items: [
          Icon(
            Icons.home,
            color: _currentPage == 0
                ? Theme.of(context).primaryColor
                : Colors.black,
          ),
          Icon(
            Icons.trending_up,
            color: _currentPage == 1
                ? Theme.of(context).primaryColor
                : Colors.black,
          ),
          Icon(
            Icons.note_add,
            color: _currentPage == 2
                ? Theme.of(context).primaryColor
                : Colors.black,
          ),
          Icon(
            Icons.settings,
            color: _currentPage == 3
                ? Theme.of(context).primaryColor
                : Colors.black,
          ),
        ],
      ),
    );
  }
}

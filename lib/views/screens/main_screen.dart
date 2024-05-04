import 'package:equinetherapy_app/views/screens/articles_screen.dart';
import 'package:equinetherapy_app/views/screens/home_screen.dart';
import 'package:equinetherapy_app/views/screens/treatment_screen.dart';
import 'package:equinetherapy_app/views/screens/video_lectures_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of widgets to call on a tap
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    const VideoLecturesScreen(),
    const ArticlesScreen(),
    const TreatmentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equine Therapy'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Видео лекции',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Статьи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Лечение',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}

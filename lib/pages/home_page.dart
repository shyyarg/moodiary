import 'package:flutter/material.dart';
import 'package:journal_app/pages/emotion_selection_screen.dart';
import 'package:journal_app/pages/settings_page.dart';
import 'calendar_page.dart';
import 'journals_page.dart';
import 'monthly_feedback_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    JournalsPage(), // shows journals of the current day
    CalendarPage(), // full calendar view
    MonthlyFeedbackPage(), //shows feedback of months mood
    SettingsPage(),
  ];

  // text controller
  final _controller = TextEditingController();

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmotionSelectionScreen()),
      );
      return;
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Color(0xFFFFF9F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD3B6),
        centerTitle: true,
        title: Text(
            'MOODIARY',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'MochiyPopOne',
          color: Color(0xFF3E3E3E),
        ),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3E3E3E),
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFFFFF9F4),
        onTap: _onItemTapped,
        items: [BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Monthly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),],
      ),
    );
  }
}
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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Color(0xFFFFF9F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD3B6),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
            'MOODIARY',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'MochiyPopOne',
          color: Color(0xFF3E3E3E),
        ),
        ),
      ),

      //floating action button to add new journal entries
      floatingActionButton: Material(
        color: Color(0xFFFFD3B6),
        shape: CircleBorder(),
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmotionSelectionScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.add, color: Color(0xFF3E3E3E)),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3E3E3E),
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFFFFF9F4),
        onTap: _onItemTapped,
        items: [BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Journals',
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
          ),
        ],
      ),
    );
  }
}
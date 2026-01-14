import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      // bottomNavigationBar: BottomNavigationBar(
      //     items: items
      // ),
    );
  }
}
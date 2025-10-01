import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9F4),
      appBar: AppBar(
        title: Text(
            'Dashboard',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'MochiyPopOne,',
          color: Color(0xFF3E3E3E)
        ),),
      ),
    );
  }
}
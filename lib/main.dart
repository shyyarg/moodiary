import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:journal_app/model/journal_entry.dart';
import 'package:journal_app/pages/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JournalEntryAdapter());
  await Hive.openBox<JournalEntry>('entries');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Moodiary',
      theme: ThemeData(fontFamily: 'MochiyPopOne'),
      home: LoadingPage(),
      //TODO: LoadingPage() is home, need to change from the one i am testing
    );
  }
}


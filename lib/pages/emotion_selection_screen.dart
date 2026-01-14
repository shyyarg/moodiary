import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:journal_app/pages/journal_entry_screen.dart';


class EmotionSelectionScreen extends StatefulWidget {

  const EmotionSelectionScreen({super.key});

  @override
  State<EmotionSelectionScreen> createState() => _EmotionSelectionScreen();

}

class _EmotionSelectionScreen extends State<EmotionSelectionScreen> {
  late String emotion;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF9F4),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //goes back to previous screen
            },
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFD3B6)
              ),
              child: SvgPicture.asset('assets/icons/arrow.svg', // path to your SVG file
                height: 26,
                width: 26,),
            )
      ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 0),
        child: Column(
          children: [
            Text(
              'How are you feeling today?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 34,
                  color: Color(0xFF3E3E3E),
                  fontFamily: 'MochiyPopOne'
              ),
            ),
            SizedBox(width: 20, height: 30,),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      emotion = 'happy';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                      );
                    },
                  icon: Image.asset(
                  'assets/icons/happyt.png',
                  height: 80,
                  width: 80,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    emotion = 'sad';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/sadt.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    emotion = 'nervous';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/nervoust.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    emotion = 'frustrated';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                    emotion = 'frustrated';
                  },
                  icon: Image.asset(
                    'assets/icons/frustratedt.png',
                    height: 80,
                    width: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    emotion = 'suprised';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/suprisedt.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    emotion = 'mad';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/madt.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    emotion = 'proud';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/proudt.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    emotion = 'scared';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalEntryScreen(emotion: emotion,)),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/scaredt.png',
                    height: 80,
                    width: 80,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }


}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:journal_app/pages/dashboard.dart';


class WritePage extends StatefulWidget {
  final String emotion;

  const WritePage({super.key, required this.emotion});

  @override
  State<WritePage> createState() => _WritePageState();

}

class _WritePageState extends State<WritePage> {


  final TextEditingController _nameController = TextEditingController();

  void _saveNameAndGoNext(){
    String name = _nameController.text.trim();

    if (name.isNotEmpty) {
      //TODO: might have to save name somewhere for settings if they want to change later
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      //show a simple alert if the user does not enter name
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text('Please enter your name.')));
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Why do you feel that way?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 34,
                  color: Color(0xFF3E3E3E),
                  fontFamily: 'MochiyPopOne'
              ),
            ),
            SizedBox(height: 30, width: 20,),
            SizedBox(
              width: 400,
              height: 300,
              child: TextField(
                minLines: null,
                maxLines: null, // write a lot
                expands: true, //expands text field as someone writes
                textAlignVertical: TextAlignVertical.top, // This is the key!
                style: TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontFamily: 'PatrickHand',
                  fontSize: 17,
                ),
                decoration:
                InputDecoration(
                    hintText: 'I feel ${widget.emotion} because...',
                    hintStyle: TextStyle(
                      fontFamily: 'PatrickHand',
                      fontSize: 17,
                      color: Color(0xFF3E3E3E),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFB6B9),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0),

                    //border style when the field is enabled but not focused.
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFFFD3B6),
                        width: 4.0, // change width here
                      ),
                    ),

                    //border style when the user taps and focuses on the field.
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFFFD3B6),
                        width: 4.0, // and here
                      ),
                    )

                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _saveNameAndGoNext,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC9E4DE),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
                child: Text(
                  'SAVE',
                  style: TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 15,
                      color: Color(0xFF3E3E3E)
                  ),
                ))
          ],
        ),
      ),
    );
  }

}
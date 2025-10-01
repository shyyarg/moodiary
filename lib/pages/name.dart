import 'package:flutter/material.dart';
import 'package:journal_app/pages/feeling.dart';

class NamePage extends StatefulWidget {

  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState(); //need this for stateful widgets, changing the state would just but the build function
}

//TODO: need to make the name page only show up for first time users

  class _NamePageState extends State<NamePage> {

    final TextEditingController _nameController = TextEditingController();

    void _saveNameAndGoNext(){
      String name = _nameController.text.trim();

      if (name.isNotEmpty) {
        //TODO: might have to save name somewhere for settings if they want to change later
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeelingPage()),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'What is your name?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 34,
                    color: Color(0xFF3E3E3E),
                    fontFamily: 'MochiyPopOne'
                ),
              ),
              SizedBox(height: 24), // spacing between text and input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(
                      fontFamily: 'PatrickHand',
                      color: Color(0xFF3E3E3E),
                      fontSize: 17
                  ),
                  decoration: InputDecoration(
                      hintText: "Enter your name...",
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
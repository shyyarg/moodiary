import 'package:flutter/material.dart';

import 'name.dart';

class LoadingPage extends StatefulWidget {

  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState(); //need this for stateful widgets, changing the state would just but the build function
}

  class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {

    late AnimationController _controller; // controller to manage tne animation
    late Animation<double> _fadeIn; //defines the fade-in animation

    @override
    void initState(){
      super .initState();
      _controller = AnimationController( //initializes the animation controller
        vsync: this, //vsync ensures the animation is synced with the screen refresh rate
        duration: Duration(seconds: 2), //duration of the fade-in animation
      );

      _fadeIn = CurvedAnimation //defines the animation curve and links the controller
        (parent: _controller, //parent animation controller
        curve: Curves.easeIn, //smooth curve for the animation
      );

      _controller.addStatusListener((status) { //goes to next page after loading
        if (status == AnimationStatus.completed) { //if condition
          Navigator.of(context).pushReplacement( //pushes next page, cant go back
            MaterialPageRoute(
                builder: (context) => NamePage()),
          );
        }

      });



      _controller.forward(); //starts the animation when the page loads
    }


    @override
    void dispose(){
      //cleans up the controller when the widget is disposed
      _controller.dispose();
      super.dispose();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFFFFF9F4),
        body: Center(
          child: FadeTransition(
              opacity: _fadeIn, //fade in effect added to text
            child: Text(
              'MOODIARY',
              style: TextStyle(
                  fontSize: 54,
                  color: Color(0xFFFFB6B9),
                  shadows: [
                    Shadow(
                        offset: Offset(-5.0, -5.0),
                        blurRadius: 15.0,
                        color: Colors.black
                    ),
                    Shadow(
                        offset: Offset(5.0, -5.0),
                        blurRadius: 15.0,
                        color: Colors.black
                    ),
                    Shadow(
                        offset: Offset(-5.0, 5.0),
                        blurRadius: 15.0,
                        color: Colors.black
                    ),
                  ]
              ),
              textAlign: TextAlign.center,
            )
          )
        ),
      );
    }
  }

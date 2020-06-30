import 'package:flutter/material.dart';
import 'package:twiine/screens/post_login/home/home.dart';
import 'package:twiine/screens/profile/profile.dart';
import 'package:twiine/screens/requests/requests.dart';
import 'package:twiine/screens/scheduled/scheduled.dart';


class Navbar extends StatefulWidget{
  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar>{
  int _currentIndex = 1;
  final List<Widget> _children = [
    Scheduled(),
    Profile(),
    Requests(),
    Home(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.event, color: Colors.black),
                title: Text("Scheduled", style: TextStyle(color: Colors.black))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black),
                title: Text("Profile", style: TextStyle(color: Colors.black))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.black),
                title: Text("Requests", style: TextStyle(color: Colors.black))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today, color: Colors.black),
                title: Text("Plan", style: TextStyle(color: Colors.black))
            )
          ],
      ),
    );
  }
}


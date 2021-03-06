import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twiine/colors.dart';
import 'package:twiine/screens/post_login/plans/plans.dart';
import 'package:twiine/screens/post_login/profile/profile.dart';
import 'package:twiine/screens/post_login/requests/requests.dart';
import 'package:twiine/screens/post_login/scheduled/search.dart';
import 'package:twiine/screens/post_login/favorites/favorites.dart';

class Navbar extends StatefulWidget {
  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  int _currentIndex = 3;

  final String searchIcon = "assets/icons/search_icon.svg";
  final String mapIcon = "assets/icons/map_icon.svg";
  final String addIcon = "assets/icons/add_icon.svg";
  final String calendarIcon = "assets/icons/calendar_icon.svg";
  final String personIcon = "assets/icons/person_icon.svg";

  final List<Widget> _children = [
    Search(),
    Favorites(),
    Requests(),
    PlansPage(),
    Profile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Do you really wish to quit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("No"),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                  SystemNavigator.pop();
                },
              )
            ],
          ),
        );
      },
      child: new Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: TwiineColors.red,
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset(searchIcon, color: TwiineColors.red)
                  : SvgPicture.asset(searchIcon),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset(mapIcon, color: TwiineColors.red)
                  : SvgPicture.asset(mapIcon),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset(addIcon, color: TwiineColors.red)
                  : SvgPicture.asset(addIcon),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset(calendarIcon, color: TwiineColors.red)
                  : SvgPicture.asset(calendarIcon),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? SvgPicture.asset(personIcon, color: TwiineColors.red)
                  : SvgPicture.asset(personIcon),
              title: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}

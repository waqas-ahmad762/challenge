import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:challenge/main.dart';

class UserTabScreen extends StatefulWidget {
  @override
  UserTabScreenState createState() => UserTabScreenState();
}

class UserTabScreenState extends State<UserTabScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void didChangeDependencies() {
    _pageController = PageController();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(
          () {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.add_to_queue),
            title: Text(
              'Appointments',
            ),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.history),
            title: Text(
              'Tab 2',
            ),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'Tab 3',
            ),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'Tab 4',
            ),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}

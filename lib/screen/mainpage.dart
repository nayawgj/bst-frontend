import 'package:flutter/material.dart';

import '../sidebar/side_bar.dart';
import 'book_screen.dart';
import 'home_screen.dart';
import 'mydebate_screen.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  //Color? upbarcolor = const Color.fromRGBO(32, 96, 79, 0.5);

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color? upbarcolor = const Color.fromRGBO(32, 96, 79, 0.5);

  // Navigator items
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(label: 'home', icon: Icon(Icons.group)),
    const BottomNavigationBarItem(label: 'mydebate', icon: Icon(Icons.chat)),
    const BottomNavigationBarItem(label: 'mypage', icon: Icon(Icons.book)),
  ];

  List pages = [const HomeScreen(), const MyDebateScreen(), const BookScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: upbarcolor,
          elevation: 0.0,
          title: Image.asset('assets/mainlogo.png'),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/profile_user.png'))),
                ),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            )
          ],
        ),
        endDrawer: const SideBar(),
        body: pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color.fromRGBO(32, 96, 79, 1), width: 3))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromRGBO(32, 96, 79, 1),
            unselectedItemColor: const Color.fromRGBO(32, 96, 79, 0.6),
            selectedFontSize: 10,
            unselectedFontSize: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;

                if (_selectedIndex == 0) {
                  upbarcolor = const Color.fromRGBO(32, 96, 79, 0.5);
                }

                if (_selectedIndex == 1 || _selectedIndex == 2) {
                  upbarcolor = Colors.white;
                }
              });
            },
            items: bottomItems,
          ),
        ),
      ),
    );
  }
}

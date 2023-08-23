import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../screen/book_screen.dart';
import '../screen/mydebate_screen.dart';
import '../sidebar/side_bar.dart';

class PopularRoom extends StatefulWidget {
  const PopularRoom({super.key});

  @override
  State<PopularRoom> createState() => _PopularRoomState();
}

class _PopularRoomState extends State<PopularRoom> {
  //Color? upbarcolor = const Color.fromRGBO(32, 96, 79, 0.5);

  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(label: 'home', icon: Icon(Icons.group)),
    const BottomNavigationBarItem(label: 'mydebate', icon: Icon(Icons.chat)),
    const BottomNavigationBarItem(label: 'mypage', icon: Icon(Icons.book)),
  ];

  List pages = [
    const PopularRoom(),
    const MyDebateScreen(),
    const BookScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // app bar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Image.asset('assets/mainlogo.png'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(32, 96, 79, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
        // body
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '인기 토론방',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                //onTap: Navigator.push(context, route),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(32, 96, 79, 1),
                                Color.fromRGBO(245, 245, 245, 1)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          width: 2.5),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.3),
                          //spreadRadius: 5
                        ),
                      ]),
                  child: const Column(
                    children: [
                      Row(
                        children: [Text('책 제목'), Text('저자')],
                      ),
                      Text('토론 주제'),
                      Text('#토론 방식')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
              });
            },
            items: bottomItems,
          ),
        ),
      ),
    );
  }
}

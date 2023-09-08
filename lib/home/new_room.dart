import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../books/book_screen.dart';
import '../mydebate/mydebate_screen.dart';
import '../sidebar/side_bar.dart';

class NewRoom extends StatefulWidget {
  const NewRoom({super.key});

  @override
  State<NewRoom> createState() => _NewRoomState();
}

class _NewRoomState extends State<NewRoom> {
  Color upbarcolor = const Color.fromRGBO(32, 96, 79, 1);

  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(label: 'home', icon: Icon(Icons.group)),
    const BottomNavigationBarItem(label: 'mydebate', icon: Icon(Icons.chat)),
    const BottomNavigationBarItem(label: 'mypage', icon: Icon(Icons.book)),
  ];

  List pages = [const NewRoom(), const MyDebateScreen(), const BookScreen()];

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
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '최신 토론방',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('책 제목'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('저자')
                          ],
                        ),
                        Text(
                          '토론 주제',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text('#토론방식'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('#카테고리')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
    ));
  }
}

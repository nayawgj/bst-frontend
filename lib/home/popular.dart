import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../books/book_screen.dart';
import '../mydebate/mydebate_screen.dart';
import '../mydebate/outline_debate.dart';
import '../sidebar/side_bar.dart';
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;

const jwtToken = jwt.jwtToken;

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  //Color? upbarcolor = const Color.fromRGBO(32, 96, 79, 0.5);

  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(label: 'home', icon: Icon(Icons.group)),
    const BottomNavigationBarItem(label: 'mydebate', icon: Icon(Icons.chat)),
    const BottomNavigationBarItem(label: 'mypage', icon: Icon(Icons.book)),
  ];

  List pages = [const Popular(), const MyDebateScreen(), const BookScreen()];

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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '인기 토론방',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //토론방 목록
                  Column(
                    children: [
                      /* 토론방 1번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('역행자(확장판)'),
                                Text(', '),
                                Text('자청')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '운명을 거스르는 게 가능할까?',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('#자유'),
                                Text('  '),
                                Text('#자기계발')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 2번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('나는 죽을 때까지 지적이고 싶다'),
                                Text(', '),
                                Text('양원근')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '배움이 불행을 불러오는가',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('#자유'),
                                Text('  '),
                                Text('#시/에세이')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 3번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('문과 남자의 과학 공부'),
                                Text(', '),
                                Text('유시민')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '본인의 분야만 공부하는 것이 옳은가',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [Text('#찬반'), Text('  '), Text('#인문')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 4번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('모든 삶은 흐른다'),
                                Text(', '),
                                Text('로랑스 드빌레르')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '흐르는 삶에서 내가 꼭 지키고 싶은 것은?',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [Text('#자유'), Text('  '), Text('#인문')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 5번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('유연함의 힘'),
                                Text(', '),
                                Text('수잔 애쉬포드')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '성공을 위해 필요한 덕목은?',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('#자유'),
                                Text('  '),
                                Text('#자기계발')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      GestureDetector(
                        onTap: () {
                          print("detector");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const OutlineDebate()),
                            ),
                          );
                        },
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Text('도파민네이션'),
                                    Text(', '),
                                    Text('애나 렘키')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '지금 무엇에 중독돼있나요?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('#자유'),
                                    Text('  '),
                                    Text('#인문')
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 7번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('도둑맞은 집중력'),
                                Text(', '),
                                Text('요한 하리')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '지친 현대인의 집중력을 높일 방법',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [Text('#자유'), Text('  '), Text('#인문')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 8번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('꿀벌의 예언 1'),
                                Text(', '),
                                Text('베르나르 베르베르')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '미래는 어떤 모습일까?',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [Text('#자유'), Text('  '), Text('#소설')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 9번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('메리골드 마음 세탁소'),
                                Text(', '),
                                Text('윤정은')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '하나의 기억을 지울 수 있다면?',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [Text('#자유'), Text('  '), Text('#소설')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      /* 토론방 10번 */
                      Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('세이노의 가르침'),
                                Text(', '),
                                Text('세이노(SayNo)')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '충분한 노력이란 어느정도인가',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('#찬반'),
                                Text('  '),
                                Text('#자기계발')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
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

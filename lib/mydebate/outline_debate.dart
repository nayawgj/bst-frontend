import 'package:flutter/material.dart';

class OutlineDebate extends StatefulWidget {
  const OutlineDebate({super.key});

  @override
  State<OutlineDebate> createState() => _OutlineDebateState();
}

class _OutlineDebateState extends State<OutlineDebate> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
      body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // debate & title & writer
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // debate title
                      Text(
                        '내 가족이 바퀴벌레가 된다면?',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // book title & writer & category
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '책',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                '저자',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                '카테고리',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('변신'),
                              Text('프란츠 카프카'),
                              Text('청소년 문학'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // line
                SizedBox(
                  width: screenSize.width,
                  child: const Divider(
                    color: Colors.black26,
                    thickness: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // 토론방 소개
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '토론방 소개',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "프란츠 카프카의 대표작 '변신'을 읽고 내 가족이 바퀴벌레가 된다면 나는 어떻게 했을 것 같은지 자유롭게 얘기하는 토론입니다!"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '참여인원',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                '토론방식',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('20명'),
                              Text('Toggle Button'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // line
                SizedBox(
                  width: screenSize.width,
                  child: const Divider(
                    color: Colors.black26,
                    thickness: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // 책 정보
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [],
                  ),
                ),
                // 입장조건
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '책 정보',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '책',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                '저자',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                '카테고리',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('변신'),
                              Text('프란츠 카프카'),
                              Text('청소년 문학'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // line
                SizedBox(
                  width: screenSize.width,
                  child: const Divider(
                    color: Colors.black26,
                    thickness: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '입장조건',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '비밀번호',
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            // Added this Expanded widget
                            child: SizedBox(
                              width: 50,
                              height: 25,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black54,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}

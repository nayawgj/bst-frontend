import 'package:booksaeteum/mydebate/in_debate.dart';
import 'package:booksaeteum/mydebate/debate_feed.dart';
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
                        '지금 무엇에 중독돼있나요?',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // book title & writer & category
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
                          "디지털 세상의 등장은 이런 자극들에 날개를 달아주었다. 스마트폰은 컴퓨터 세대에게 쉴 새 없이 디지털 도파민을 전달하는 현대판 피하주사침이 됐다. 우리는 도파민, 자본주의, 디지털이 결합된 탐닉의 사회, 도파민네이션에 살고 있다. 이제 누구도 중독에서 자유로울 수 없다."),
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
                              Text('도파민네이션'),
                              Text('애나 렘키'),
                              Text('인문'),
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
                          Text('누구나 입장 가능',
                              style: TextStyle(color: Colors.black54))
                          // Text(
                          //   '비밀번호',
                          //   style: TextStyle(color: Colors.black54),
                          // ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          // Expanded(
                          //   // Added this Expanded widget
                          //   child: SizedBox(
                          //     width: 50,
                          //     height: 25,
                          //     child: TextField(
                          //       decoration: InputDecoration(
                          //         contentPadding: EdgeInsets.symmetric(
                          //             vertical: 5.0, horizontal: 10.0),
                          //         border: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Colors.black54,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DebateFeedScreen(
                                    debateId: 110,
                                    debateTopic: '지금 무엇에 중독돼있나요?',
                                    bookTitle: '도파민네이션',
                                    bookAuthor: '애나 렘키',
                                  )),
                        );
                      },
                      label: const Text('  토론 참여하기  '),
                      backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.white), // 원하는 테두리 색상
                        borderRadius: BorderRadius.circular(18), // 원하는 모서리 반경
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

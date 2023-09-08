import 'package:flutter/material.dart';

import 'create_debate.dart';

class Outline extends StatefulWidget {
  const Outline({super.key});

  @override
  State<Outline> createState() => _OutlineState();
}

class _OutlineState extends State<Outline> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              )
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                // title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '내 가족이 바퀴벌레가 된다면?',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('책'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('변신')
                          ],
                        ),
                        Row(
                          children: [
                            Text('저자'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('프란츠 카프카')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                line(),
                // introduction
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '토론방 소개',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('어쩌고 저쩌고'),
                        const Row(
                          children: [
                            Text('참여인원'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('20명')
                          ],
                        ),
                        Row(
                          children: [
                            const Text('토론방식'),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 70,
                              decoration: ShapeDecoration(
                                  color: const Color(0xFF20604F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                '자유토론',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                line(),
                // information
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '책 정보',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('제목'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('변신')
                          ],
                        ),
                        Row(
                          children: [
                            Text('저자'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('프란츠 카프카')
                          ],
                        ),
                        Row(
                          children: [
                            Text('카테고리'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('청소년 문학')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                line(),
                // condition
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '입장 조건',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text('비밀번호'),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 150,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateDebate()),
                      );
                    },
                    label: const Text('  토론방 참여하기  '),
                    backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Container line() {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.5,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black26))),
    );
  }
}

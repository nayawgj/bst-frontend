import 'package:flutter/material.dart';

class DetailReport extends StatefulWidget {
  const DetailReport({super.key});

  @override
  State<DetailReport> createState() => _DetailReportState();
}

class _DetailReportState extends State<DetailReport> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: const Text(
        //     '독후감 상세보기',
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Color.fromRGBO(32, 96, 79, 1),
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              '독후감 제목',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/profile_user.png',
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text('닉네임')
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border,
                                  color: Color.fromRGBO(32, 96, 79, 1),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          '독후감 내용의 전체가 보인다. 젊은 베르테르의 사랑이 너무 깊고도 순수한 것 같습니다. 사랑을 위해선 모든걸 바칠수 있으니까요. 하지만 요즘시대에 비추어보면 너무 심한 집착이 아니였을까 하는 생각도 드네요. 분명한건 책을 읽는동안 지루하지 않고, 여운이 깊게 남는 책인거같습니다. 진정한 사랑에 대해서도 다시 생각하게 되는것 같습니다.',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/testImage.png'),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width,
                    child: const Divider(
                      color: Colors.black12,
                      thickness: 5.0,
                    ),
                  ),
                  // 댓글
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '댓글',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/profile_user.png',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('닉네임')
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text('동감해요'),
                        SizedBox(
                          width: screenSize.width,
                          child: const Divider(
                            color: Colors.black12,
                            thickness: 2.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/profile_user.png',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('닉네임')
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text('동감해요'),
                        SizedBox(
                          width: screenSize.width,
                          child: const Divider(
                            color: Colors.black12,
                            thickness: 2.0,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          'assets/dotted_line.png',
                          fit: BoxFit.fitWidth,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              hintText: '댓글 작성',
                              prefix: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/user_profile.png',
                                    width: 10,
                                  )),
                              suffix: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/pencil.png',
                                        width: 20,
                                      )),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

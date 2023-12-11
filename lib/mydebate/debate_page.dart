import 'package:flutter/material.dart';

class DetailedWriting extends StatefulWidget {
  const DetailedWriting({super.key});

  @override
  State<DetailedWriting> createState() => _DetailedWritingState();
}

class _DetailedWritingState extends State<DetailedWriting> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(32, 96, 79, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '내 가족이 바퀴벌레가 된다면?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star),
                            color: Colors.black26,
                          )
                        ],
                      ),
                      const Row(
                        children: [Text('변신, '), Text('프란츠 카프카')],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width,
                  child: const Divider(
                    color: Color.fromRGBO(32, 96, 79, 0.8),
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/profile_user.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '닉네임',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '05/30/23',
                                style: TextStyle(color: Colors.black45),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark_border,
                                color: Color.fromRGBO(32, 96, 79, 0.8),
                              ))
                        ],
                      ),
                      const Text(
                          '변신은 바로 그의 억압된 소망들을 표현한다. 그는 자신을 멋대로 다루는 고용주와 아버지에게 반항하며 그의 반항은 무의식 속에서 공포의 형상을 만들어낸다. 퇴행을 통해 그레고르는 노예 상태에서 벗어나고 식객의 역할이 바뀐다. 그러나 가족들은 그를 제거해야할 기생충으로 여기며 누이동생이 내린 결정에 의하여 그레고르는 최후를 맞는다. 그레고르의 불행한 실존에 대해 가족이 책임이 없는 것은 아니다. 비인간적인 공포의 형상 속에서 가족 자체의 비인간성이 드러난다.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Colors.red.withOpacity(0.8),
                                    size: 20,
                                  )),
                              const Text('5'),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.thumb_down_alt_outlined,
                                    color: Colors.black54,
                                    size: 20,
                                  )),
                              const Text('2')
                            ],
                          ),
                          // 신고 버튼
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.chat_bubble_outline_rounded,
                                    color: Colors.black54,
                                  )),
                              const Text(
                                '신고',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.chat_bubble_outline),
                          SizedBox(
                            width: 3,
                          ),
                          Text('인용한 글'),
                          SizedBox(
                            width: 3,
                          ),
                          Text('(1)')
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // 인용 글 list
                      GestureDetector(
                        child: Column(
                          children: [
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
                                const Text('닉네임'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '05/30/23',
                                  style: TextStyle(color: Colors.black45),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                '변신은 바로 그의 억압된 소망들을 표현한다. 그는 자신을 멋대로 다루는 고용주와 아버지에게 반항하며 그의 반항은 무의식 속에서 공포의 형상을 만들어낸다....')
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

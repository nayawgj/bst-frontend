import 'package:flutter/material.dart';

import 'debate_page.dart';

class InDebate extends StatefulWidget {
  const InDebate({super.key});

  @override
  State<InDebate> createState() => _InDebateState();
}

class _InDebateState extends State<InDebate> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(32, 96, 79, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              // debate title
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star,
                          ),
                          color: Colors.black26,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text('변신'),
                        Text(','),
                        SizedBox(
                          width: 5,
                        ),
                        Text('프란츠 카프카'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width,
                child: const Divider(
                  color: Color.fromRGBO(32, 96, 79, 1),
                  thickness: 1.0,
                ),
              ),
              // the number of posts, mypost, sorting
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [Text('100'), Text('개의 글')],
                    ),
                    Row(
                      children: [
                        const Text('내가 쓴 글'),
                        const Icon(
                          Icons.rectangle,
                          color: Colors.black26,
                        ),
                        const Text(' | '),
                        const Text('최신순'),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width,
                child: const Divider(
                  color: Colors.black26,
                  thickness: 1.0,
                ),
              ),
              // posts
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailedWriting()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      // writer info
                      Row(
                        children: [
                          SizedBox(
                              width: 20,
                              child: Image.asset('assets/profile_user.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('닉네임'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '05/30-23',
                            style: TextStyle(color: Colors.black45),
                          )
                        ],
                      ),
                      // post content
                      const Text(
                          '변신은 바로 그의 억압된 소망들을 표현한다. 그는 자신을 멋대로 다루는 고용주와 아버지에게 반항하며 그의 반항은 무의식 속에서 공포의 형상을 만들어낸다. 퇴행을 통해 그레고르는 노예 상태에서 벗어나고 식객의 역할이 바뀐다. 그러나 가족들은 그를 제거해야할 기생충으로 여기며 누이동생이 내린 결정에 의하여 그레고르는 최후를 맞는다. 그레고르의 불행한 실존에 대해 가족이 책임이 없는 것은 아니다. 비인간적인 공포의 형상 속에서 가족 자체의 비인간성이 드러난다. ')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

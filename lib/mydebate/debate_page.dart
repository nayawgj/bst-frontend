import 'package:booksaeteum/mydebate/writing_debate_quote.dart';
import 'package:flutter/material.dart';
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;

const jwtToken = jwt.jwtToken;

class DetailedWriting extends StatefulWidget {
  final int postId;
  final int debateId;
  final String debateTopic;
  final String bookTitle;
  final String bookAuthor;
  final String nickname;
  final String date;
  final String content;
  final int like;
  final int dislike;

  const DetailedWriting(
      {super.key,
      required this.postId,
      required this.debateId,
      required this.debateTopic,
      required this.bookTitle,
      required this.bookAuthor,
      required this.nickname,
      required this.date,
      required this.content,
      required this.like,
      required this.dislike});

  @override
  State<DetailedWriting> createState() => _DetailedWritingState();
}

class _DetailedWritingState extends State<DetailedWriting> {
  @override
  void initState() {
    super.initState();
  }

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
                          Text(
                            widget.debateTopic,
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
                      Row(
                        children: [
                          Text(widget.bookTitle),
                          Text(widget.bookAuthor)
                        ],
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
                              Text(
                                widget.nickname,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.date,
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
                      Text(widget.content),
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
                              Text(widget.like.toString()),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.thumb_down_alt_outlined,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                              Text(widget.dislike.toString()),
                              const SizedBox(width: 5),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WriteDebateWithQuote(
                                                  debateId: widget.debateId,
                                                  debateTopic:
                                                      widget.debateTopic,
                                                  bookTitle: widget.bookTitle,
                                                  bookAuthor: widget.bookAuthor,
                                                  quoteId: widget.postId,
                                                  quoteNickname:
                                                      widget.nickname,
                                                  quoteDate: widget.date,
                                                  quoteContent: widget.content,
                                                )));
                                  },
                                  icon: const Icon(
                                    Icons.repeat,
                                    color: Colors.black54,
                                    size: 20,
                                  )),
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

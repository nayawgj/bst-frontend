import 'dart:convert';
import 'package:booksaeteum/mydebate/debate_page.dart';
import 'package:booksaeteum/mydebate/writing_debate.dart';
import 'detailed_quoted_post.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;

const jwtToken = jwt.jwtToken;

class DebateFeedScreen extends StatefulWidget {
  final int debateId;
  final String debateTopic;
  final String bookTitle;
  final String bookAuthor;

  const DebateFeedScreen(
      {super.key,
      required this.debateId,
      required this.debateTopic,
      required this.bookTitle,
      required this.bookAuthor});

  @override
  State<DebateFeedScreen> createState() => _DebateFeedScreenState();
}

class _DebateFeedScreenState extends State<DebateFeedScreen> {
  List<Map<String, dynamic>> postList = [];

  @override
  void initState() {
    super.initState();
    fetchData(widget.debateId);
  }

  Future<void> fetchData(int debateId) async {
    final url = Uri.parse('http://10.0.2.2:8080/debate/feed/$debateId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final postData = data['data'];

      setState(() {
        postList = [];
        for (int i = 0; i < postData.length; i++) {
          final postItem = postData[i];

          final post = {
            'postId': postItem['postId'],
            'date': postItem['date'],
            'nickname': postItem['userNickname'],
            'userPhoto': postItem['userPhoto'],
            'content': postItem['content'],
            'quotedPostContent': postItem['quotedPostContent'],
            'like': postItem['like'],
            'dislike': postItem['dislike'],
            'isPro': postItem['isPro']
          };
          postList.add(post);
        }
      });
    }
  }

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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star),
                            color: Colors.black26)
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.bookTitle),
                        SizedBox(width: 5),
                        Text(widget.bookAuthor),
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
              Flexible(
                child: ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    final post = postList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListBox(
                          post: post,
                          debateId: widget.debateId,
                          debateTopic: widget.debateTopic,
                          bookTitle: widget.bookTitle,
                          bookAuthor: widget.bookAuthor),
                    );
                  },
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool isBack = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WriteDebate(
                      debateId: widget.debateId,
                      debateTopic: widget.debateTopic,
                      bookTitle: widget.bookTitle,
                      bookAuthor: widget.bookAuthor)));
          if (isBack) {
            setState(() {
              fetchData(widget.debateId);
            });
          }
        },
        backgroundColor: Color.fromRGBO(32, 96, 79, 1),
        child: const Icon(Icons.add),
      ),
    ));
  }
}

class ListBox extends StatelessWidget {
  late Map<String, dynamic> post;
  int debateId;
  String debateTopic;
  String bookTitle;
  String bookAuthor;

  ListBox(
      {super.key,
      required this.debateId,
      required this.post,
      required this.debateTopic,
      required this.bookTitle,
      required this.bookAuthor});

  @override
  Widget build(BuildContext context) {
    // final userPhoto = post['userPhoto'] as String;
    final postId = post['postId'] as int;
    final nickname = post['nickname'] as String;
    final date = post['date'] as String;
    final content = post['content'] as String;
    final quotedPostContent = post['quotedPostContent'] as String? ?? " ";
    final like = post['like'] as int;
    final dislike = post['dislike'] as int;

    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yy/MM/dd').format(dateTime);

    return GestureDetector(
      onTap: () {
        if (quotedPostContent == " ") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedWriting(
                        postId: postId,
                        debateId: debateId,
                        debateTopic: debateTopic,
                        bookTitle: bookTitle,
                        bookAuthor: bookAuthor,
                        nickname: nickname,
                        date: formattedDate,
                        content: content,
                        like: like,
                        dislike: dislike,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedQuotedWriting(
                        postId: postId,
                        debateId: debateId,
                        debateTopic: debateTopic,
                        bookTitle: bookTitle,
                        bookAuthor: bookAuthor,
                        nickname: nickname,
                        date: formattedDate,
                        content: content,
                        quotedPostContent: quotedPostContent,
                        like: like,
                        dislike: dislike,
                      )));
        }
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Image.asset('assets/profile_user.png'),
                  ),
                  const SizedBox(width: 10),
                  Text(nickname),
                  const SizedBox(width: 10),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                        color: Color.fromARGB(115, 151, 140, 140)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(content),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up_outlined, size: 20),
                    onPressed: () {},
                  ),
                  Text(like.toString()),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.thumb_down_outlined, size: 20),
                    onPressed: () {},
                  ),
                  Text(dislike.toString()),
                ],
              ),
              const Divider(),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'debate_feed.dart';
import 'dart:convert';
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;

const jwtToken = jwt.jwtToken;

class WriteDebate extends StatefulWidget {
  final int debateId;
  final String debateTopic;
  final String bookTitle;
  final String bookAuthor;

  const WriteDebate(
      {super.key,
      required this.debateId,
      required this.debateTopic,
      required this.bookTitle,
      required this.bookAuthor});

  @override
  _WriteDebateState createState() => _WriteDebateState();
}

// 토론글 작성 페이지
class _WriteDebateState extends State<WriteDebate> {
  //TextEditingController _controller = TextEditingController();

  Map<String, dynamic> data = {
    "debateId": 'debateId',
    "postContent": 'postContent',
    "postPhoto": null,
    "postQuotationId": null,
    "postIsPro": 0
  };

  Future<void> postData() async {
    final url =
        Uri.parse('http://10.0.2.2:8080/debate/feed/${widget.debateId}/create');

    try {
      final response = await http.post(
        url,
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwtToken'
        },
      );

      if (response.statusCode == 200) {
        print("Success: ${response.body}");
        // Navigator.of(context).pop();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exeption: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    data['debateId'] = widget.debateId;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          //취소버튼
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(Size.zero), // 최소 크기를 0으로 지정
                padding: MaterialStateProperty.all(
                    EdgeInsets.zero), // 패딩을 없애서 버튼 내부의 공간을 최소화
                alignment: Alignment.center, // 버튼 내부의 텍스트를 가로 중앙으로 정렬
              ),
              child: Text('취소',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16,
                  ))),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.all(8),
              //업로드 버튼
              child: ElevatedButton(
                  onPressed: () {
                    postData();
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      minimumSize: const Size(25, 28),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    '업로드',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 프로필 사진
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_user.png'),
            ),
            const SizedBox(height: 10), // 간격 조절
            // 게시글 작성란
            TextField(
              maxLines: null,
              onChanged: (text) {
                setState(() {
                  data['postContent'] = text;
                });
              },
              decoration: const InputDecoration(
                hintText: '의견을 작성해주세요.',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.black), // 구분선
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Image.asset('assets/image.png'), // 아이콘
            ),
          ],
        ),
      ),
    );
  }
}

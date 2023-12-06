import 'package:booksaeteum/mydebate/debate_feed.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;

import 'create_debate.dart';

const jwtToken = jwt.jwtToken;

class MyDebateScreen extends StatefulWidget {
  const MyDebateScreen({super.key});

  @override
  State<MyDebateScreen> createState() => _MyDebateScreenState();
}

class _MyDebateScreenState extends State<MyDebateScreen> {
  List<Map<String, dynamic>> debateData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('http://10.0.2.2:8080/mydebate');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final debateList = data['data'];

      setState(() {
        debateData = [];
        for (int i = 0; i < debateList.length; i++) {
          final debateItem = debateList[i];
          String debateType;

          if (debateItem['debateType'] == 0) {
            debateType = "자유 토론";
          } else {
            debateType = "찬반 토론";
          }

          final debate = {
            'bookTitle': debateItem['bookTitle'],
            'bookAuthor': debateItem['bookAuthor'],
            'debateId': debateItem['debateId'],
            'debateTopic': debateItem['debateTopic'],
            'debateType': debateType,
            'categoryName': debateItem['categoryName']
          };
          debateData.add(debate);
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: debateData.length,
                itemBuilder: (context, index) {
                  final debate = debateData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DebateFeedScreen(
                              debateId: debate['debateId'],
                              debateTopic: debate['debateTopic'],
                              bookTitle: debate['bookTitle'],
                              bookAuthor: debate['bookAuthor'],
                            ),
                          ),
                        );
                      },
                      child: ListBox(
                        debate: debate,
                      ),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateDebate()),
                );
              },
              label: const Text('토론방 만들기'),
              icon: Icon(Icons.add),
              backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
            ),
          ],
        ),
      ),
    );
  }
}

class ListBox extends StatelessWidget {
  final Map<String, dynamic> debate;

  const ListBox({super.key, required this.debate});

  @override
  Widget build(BuildContext context) {
    final bookTitle = debate['bookTitle'] as String;
    final bookAuthor = debate['bookAuthor'] as String;
    final debateId = debate['bookId'] as int?;
    final debateTopic = debate['debateTopic'] as String;
    final debateType = debate['debateType'] as String;
    final categoryName = debate['categoryName'] as String;

    return Container(
      height: 90,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(32, 96, 79, 1),
                Color.fromRGBO(245, 245, 245, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(bookTitle),
                SizedBox(
                  width: 10,
                ),
                Text(bookAuthor)
              ],
            ),
            Text(
              debateTopic,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('#$debateType'),
          ],
        ),
      ),
    );
  }
}

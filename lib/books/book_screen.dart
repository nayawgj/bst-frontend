import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_book.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<List<dynamic>> best10Books = [];
  List<List<dynamic>> recent10Books = [];

  @override
  void initState() {
    super.initState();
    fetchBookImages();
  }

  Future<void> fetchBookImages() async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/books');
    final jwtToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJzb2NpYWxJZCI6IkdNQklxTW43NkpEQXUxQmMxRzVSdXd5M1lTTHdfSGhkNm9kaFl6QUJfWTgiLCJpYXQiOjE3MDA2NTc2ODQsImV4cCI6MTcwMDY2MTI4NH0.iYL_jXGsGKOtMLroQ_5Yv2Ppq0HIw0Yr7v8M23wTQX4";

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final tmpBest10Books = data['data']['best10Books'] as List<dynamic>;
      final tmpRecent10Books = data['data']['recent10Books'] as List<dynamic>;

      final bestBooks = tmpBest10Books.map((book) {
        return [
          book['bookImg'] as String,
          book['bookId'] as int,
        ];
      }).toList();

      final recentBooks = tmpRecent10Books.map((book) {
        return [
          book['bookImg'] as String,
          book['bookId'] as int,
        ];
      }).toList();

      setState(() {
        best10Books = bestBooks;
        recent10Books = recentBooks;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // search bar
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  offset: const Offset(1, 3),
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.5),
                                )
                              ]),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(32, 96, 79, 1),
                                      width: 3,
                                    ),
                                  ),
                                  hintText: '검색어를 입력하세요',
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/search.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Best Seller
                      const SectionTitle(text: '베스트 셀러'),
                      BookList(images: best10Books), // Extracted Book List
                      // New Books
                      const SectionTitle(text: '신간 도서'),
                      BookList(images: recent10Books), // Extracted Book List
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BookList extends StatelessWidget {
  final List<List<dynamic>> images;

  const BookList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) {
            if (index < images.length) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailBookScreen(bookId: images[index][1]),
                      ),
                    );
                  },
                  child: Container(
                    width: 150.0,
                    height: 220.0,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.network(
                      images[index][0],
                      fit: BoxFit.cover,
                    ),
                  ));
            } else {
              return Container(
                width: 150.0,
                height: 220.0,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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
    const jwtToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJzb2NpYWxJZCI6IjNkUDNwYWRWRmlmQXY1MkNJWTlDTU1vaDh5eG9iOTdwYWhxSkhUSHM1MDgiLCJpYXQiOjE2OTU1MzQyMjIsImV4cCI6MTY5NTU3MDIyMn0.312jWGVo5OGMxgdfs4i9FPkJzXuscdgEI4xLTJi2AY8";

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
        body: Container(
          color: Colors.white,
          //const Color.fromRGBO(32, 96, 79, 0.5),
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
                    // best
                    const Text(
                      '베스트 셀러',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

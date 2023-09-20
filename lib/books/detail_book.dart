import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailBookScreen extends StatefulWidget {
  final int bookId;
  const DetailBookScreen({super.key, required this.bookId});

  @override
  State<DetailBookScreen> createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen> {
  final List<bool> _isSelected = [true, false];
  Map<String, dynamic> bookData = {};

  @override
  void initState() {
    super.initState();
    fetchData(widget.bookId);
  }

  Future<void> fetchData(int bookId) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/books/detail/$bookId');
    final jwtToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJzb2NpYWxJZCI6IjM2ekFSbGY4WjBvR2hMX2ZBMTgxcThDbmVuRWVZRkNiTVJzMGFiVC1RLXMiLCJpYXQiOjE2OTUxMDQ0MTgsImV4cCI6MTY5NTEwODAxOH0.1xOZbS3ytw4SR55O0Z2HMQqHfSxD9Ld7S_y6r-nrGTE";

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final bookAuthor = data['data']['bookAuthor'] as String;
      final bookImg = data['data']['bookImg'] as String;
      final bookTitle = data['data']['bookTitle'] as String;
      final bookPublisher = data['data']['bookPublisher'] as String;

      setState(() {
        bookData['bookAuthor'] = bookAuthor;
        bookData['bookImg'] = bookImg;
        bookData['bookTitle'] = bookTitle;
        bookData['bookPublisher'] = bookPublisher;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Custom Container Widget
  Widget customContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 80,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        color: isSelected
            ? const Color.fromRGBO(32, 96, 79, 1)
            : const Color.fromRGBO(249, 245, 234, 1),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  // book detail
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 130,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        child: bookData['bookImg'] != null
                            ? Image.network(bookData['bookImg'],
                                fit: BoxFit.contain)
                            : const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookData['bookTitle'] ?? 'Loading...',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            bookData['bookAuthor'] ?? 'Loading...',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(bookData['bookPublisher'] ?? 'Loading...'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: const Color.fromRGBO(217, 217, 217, 1),
            ),
            const SizedBox(
              height: 20,
            ),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  isSelected: _isSelected,
                  onPressed: (index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < _isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          _isSelected[buttonIndex] = true;
                        } else {
                          _isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: customContainer(
                        text: '독후감',
                        isSelected: _isSelected[0],
                        onPressed: () {
                          // Handle onPressed for the first button.
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: customContainer(
                        text: '토론',
                        isSelected: _isSelected[1],
                        onPressed: () {
                          // Handle onPressed for the second button.
                        },
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

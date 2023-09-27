import 'package:flutter/material.dart';

import 'detail_book.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          //const Color.fromRGBO(32, 96, 79, 0.5),
          child: ListView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // search bar
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
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
                                //controller: searchController,
                                //onSubmitted: _handleSubmitted,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(32, 96, 79, 1),
                                          width: 3)),
                                  hintText: '검색어를 입력하세요',
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                      onPressed:
                                          () {}, //searchController.clear,
                                      icon: Image.asset('assets/search.png')),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // best seller
                      const Text(
                        '베스트 셀러',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                  ],
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // new book
                      const Text(
                        '신간 도서',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    bookCover(),
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class bookCover extends StatelessWidget {
  const bookCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DetailBookScreen()));
      },
      child: Container(
        width: 90,
        height: 110,
        color: Colors.amber,
      ),
    );
  }
}

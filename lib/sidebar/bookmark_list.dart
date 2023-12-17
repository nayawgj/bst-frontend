import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../mydebate/outline_debate.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({super.key});

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(32, 96, 79, 1),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                width: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '북마크',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.bookmark, color: Color.fromRGBO(32, 96, 79, 1)),
                ],
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 23),
                  child: Text(
                    '문과 남자의 과학 공부',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                  child: Positioned(
                right: 30,
                top: 24,
                child: Image.asset(
                  'assets/book.png',
                  width: 24,
                ),
              )),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                  child: Text(
                    "『문과 남자의 과학 공부』는 역사ㆍ정치ㆍ경제ㆍ글쓰기ㆍ여행 등 인문학 분야의 글을 써온 작가 유시민이 과학을 소재로 쓴 첫 책이다. 유시민에게 “지적 자극과...",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0, vertical: 145.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

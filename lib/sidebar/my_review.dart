import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../mydebate/outline_debate.dart';

class MyReview extends StatefulWidget {
  const MyReview({super.key});

  @override
  State<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
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
                    '내 리뷰',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.edit, color: Color.fromRGBO(32, 96, 79, 1)),
                ],
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OutlineDebate()));
                    },
                    child: Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(32, 96, 79, 1),
                                    Color.fromRGBO(245, 245, 245, 1)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
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
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('책 제목'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('저자')
                              ],
                            ),
                            Text(
                              '토론 주제',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('#토론 방식')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(32, 96, 79, 1),
                                  Color.fromRGBO(245, 245, 245, 1)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
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
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('책 제목'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('저자')
                            ],
                          ),
                          Text(
                            '토론 주제',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('#토론 방식')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

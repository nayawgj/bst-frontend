import 'dart:convert';

import 'package:booksaeteum/books/review_detail.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:http/http.dart' as http;

import '../sidebar/side_bar.dart';

import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;


const jwtToken = jwt.jwtToken;

class DetailBookScreen extends StatefulWidget {
  final int bookId;
  const DetailBookScreen({super.key, required this.bookId});

  @override
  State<DetailBookScreen> createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen> {
  final List<bool> _isSelected = [true, false];
  Map<String, dynamic> bookData = {};
  List<Map<String, dynamic>> clickedData = [];
  // List<dynamic> reviewData = [];
  // List<dynamic> debateData = [];

  @override
  void initState() {
    super.initState();
    fetchData(widget.bookId);
    fetchReviewData(widget.bookId);
  }

  Future<void> fetchData(int bookId) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/books/detail/$bookId');

    final response = await http.get(
        url,
        headers: {
          'Authorization':'Bearer $jwtToken'
        });
    if(response.statusCode == 200){
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      setState(() {
        bookData = data['data'];
      });
    }else{
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchReviewData(int bookId) async {
    /**
     * "reviewTitle": "asdfasd22"
     * "reviewContent": "asdfasdfasdf"
     * "reviewId": 6
     * "reviewerNickname": "test1"
     * "reviewerImg": "asdfasdf"
     */
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/books/detail/$bookId/review');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $jwtToken'
      });

    if(response.statusCode == 200){
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final reviewData = data['data'];

      setState(() {
        clickedData = [];
        for (int i = 0; i < reviewData.length; i++) {
          final reviewItem = reviewData[i];

          final clickedItem = {
            'leftUpper': reviewItem['reviewTitle'],
            'rightUpper': reviewItem['reviewerNickname'],
            'itemId': reviewItem['reviewId'],
            'leftMid': reviewItem['reviewContent'],
            'debateLock': false,
            'reviewerImg': reviewItem['reviewerImg'],
            'isReview':true
          };
          clickedData.add(clickedItem);
        }
      });
    }
  }

  Future<void> fetchDebateData(int bookId) async {
    /***
     * "debateTopic": "테스트6",
     * "debateId": 108,
     * "debateType": 0,
     * "debatePostCount": 3
     * "debateLock": false
     */
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/books/detail/$bookId/debate');
    final response = await http.get(
      url,
      headers: {
        'Authorization':'Bearer $jwtToken'
      });

    if(response.statusCode == 200){
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final debateData = data['data'];

      setState(() {
        clickedData = [];
        for (int i = 0; i < debateData.length; i++) {
          final debateItem = debateData[i];
          String debateType;

          if(debateItem['debateType']==0){
            debateType = "자유 토론";
          }else{
            debateType = "찬반 토론";
          }

          var debPostCnt = debateItem['debatePostCount'];

          final clickedItem = {
            'leftUpper': debateItem['debateTopic'],
            'rightUpper': "",
            'itemId': debateItem['debateId'],
            'leftMid': "$debateType / $debPostCnt개의 글",
            'debateLock': debateItem['debateLock'],
            'reviewerImg': null,
            'isReview':false
          };
          clickedData.add(clickedItem);
        }
      });
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
                          ? Image.network(
                              bookData['bookImg'],
                              fit: BoxFit.contain
                            )
                          : const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 200),
                                child: Text(
                                  bookData['bookTitle'] ?? 'Loading...',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 200),
                                child: Text(
                                  bookData['bookAuthor'] ?? 'Loading...',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  softWrap: true,
                                ))
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Flexible(
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 200),
                                child: Text(bookData['bookPublisher'] ?? 'Loading...'),
                              )
                          )
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
                      if(index == 0){ // 독후감
                        _isSelected[0] = true;
                        _isSelected[1] = false;
                        fetchReviewData(widget.bookId);
                      }else{
                        _isSelected[0] = false;
                        _isSelected[1] = true;
                        fetchDebateData(widget.bookId);
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
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: customContainer(
                        text: '토론',
                        isSelected: _isSelected[1],
                        onPressed: () {
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: clickedData.length,
                itemBuilder: (context, index) {
                  final clickedItem = clickedData[index];
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          // NavigationBar.push(context,)
                        },
                        child: ListBox(clickedItem: clickedItem),
                      )
                  );
                }
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class ListBox extends StatelessWidget{

  final Map<String, dynamic> clickedItem;

  const ListBox({super.key, required this.clickedItem});

  @override
  Widget build(BuildContext context) {
    final clickedLeftUpper = clickedItem['leftUpper'] as String;
    final clickedRightUpper = clickedItem['rightUpper'] as String;
    final clickedId = clickedItem['itemId'] as int;
    final clickedLeftMid = clickedItem['leftMid'] as String;
    final clickedDebLock = clickedItem['debateLock'] as bool;
    final clickedRevImg = clickedItem['reviewerImg'] as String?;
    final clickedIsReview = clickedItem['isReview'] as bool;


    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> ReviewDetail(reviewId: clickedId))
        );
      },
      child: Container(
        height: 90,
        // width: 350,
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(clickedLeftUpper ?? 'Loading...'),
                  if(clickedDebLock)
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Transform.scale(
                        scale: 0.7,
                        child: const Icon(
                            Icons.lock
                        ),
                      ),
                    ),
                  const Spacer(),
                  if(clickedIsReview && clickedRevImg != null)
                    Image.network(
                      clickedRevImg,
                      width: 25, // Adjust the size as needed
                      height: 25,
                      errorBuilder: (context, error, stackTrace) {
                        return const CircleAvatar(
                          radius: 12, // Adjust the size as needed
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person, // Use any default icon you prefer
                            size: 20, // Adjust the icon size as needed
                          ), // Background color for the CircleAvatar
                        );
                      },
                    ),
                  if(clickedIsReview && clickedRevImg == null)
                    const CircleAvatar(
                      radius: 12, // Adjust the size as needed
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person, // Use any default icon you prefer
                        size: 20, // Adjust the icon size as needed
                      ), // Background color for the CircleAvatar
                    ),
                  const SizedBox(width: 10),
                  Text(clickedRightUpper ?? 'Loading...')
                ],
              ),
              Text(clickedLeftMid ?? 'Loading...')
            ],
          ),
        ),
      )
    );
  }

}
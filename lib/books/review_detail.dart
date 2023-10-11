import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;


const jwtToken = jwt.jwtToken;

class ReviewDetail extends StatefulWidget{
  final int reviewId;
  const ReviewDetail({super.key, required this.reviewId});

  @override
  State<StatefulWidget> createState() => _ReviewDetailState();

}

class _ReviewDetailState extends State<ReviewDetail>{
  Map<String, dynamic> reviewData = {};
  List<dynamic> commentData = [];
  bool bookmarked = true;

  @override
  void initState(){
    fetchData(widget.reviewId);
  }

  Future<void> fetchData(int reviewId) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/review/$reviewId');

    final response = await http.get(
      url,
      headers: {
        'Authorization':'Bearer $jwtToken'
      });
    if(response.statusCode == 200){
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      setState(() {
        reviewData = data['data'];
        commentData = reviewData['reviewComments'];
        bookmarked = reviewData['bookmarked'] as bool;
      });
    }else{
      throw Exception("Failed to load data");
    }
  }

  void toggleBookmark() async {
    final reviewId = widget.reviewId;
    final url = Uri.parse("http://10.0.2.2:8080/api/v1/review/$reviewId/bookmark");

    try{
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if(response.statusCode == 200){
        setState(() {
          bookmarked = !bookmarked;
        });
      }else{
        debugPrint('bookmark review NOT 200 status');
      }
    }catch(e){
      debugPrint('bookmark review ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    final reviewTitle = reviewData['reviewTitle'] as String?;
    var reviewerPhoto = reviewData['reviewerPhoto'];
    final reviewerNickname = reviewData['reviewerNickname'];
    // var bookmarked = reviewData['bookmarked'] as bool;
    final reviewContent = reviewData['reviewContent'] as String?;
    var reviewImg = reviewData['reviewImg'];


    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    reviewTitle ?? "",
                    style: const TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0), // Adjust vertical padding here
                  child: Row(
                    children: [
                      Image.network(
                        reviewerPhoto ?? "",
                        width: 25,
                        height: 25,
                        errorBuilder: (context, error, stackTrace){
                          return const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 20,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        reviewerNickname ?? "",
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          toggleBookmark();
                        },
                        child: Icon(
                            bookmarked ? Icons.bookmark : Icons.bookmark_border,
                            size: 24.0,
                            color: Colors.blue
                        ),
                      )

                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  reviewContent ?? "",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(
                  visible: reviewImg != null,
                  child: Center(
                    child: Image.network(
                      reviewImg != null ?
                      "https://mybst.s3.ap-northeast-2.amazonaws.com/$reviewImg"
                      : '', // Replace with your image URL
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace){
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          color: Colors.grey,
                        );
                      },
                    )
                  )
                )
              ),
              const Divider(
                color: Colors.black,
                height: 30.0,
                thickness: 2.0,
              ),
              const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '댓글',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(commentData.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Image.network(
                              commentData[index]['commenterImg'] ?? "",
                              width: 25,
                              height: 25,
                              errorBuilder: (context, error, stackTrace){
                                return const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey,
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, top: 8.0, bottom: 4.0),
                            child: Text(commentData[index]["commenterNickname"] ?? ""),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top:8.0, bottom: 16.0),
                        child: Text(commentData[index]["commentText"] ?? ""),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                          height: 0.0,
                        ),
                      )
                    ],
                  );
                }),
              )

            ],
          ),
        )
      ),
    );
  }

}
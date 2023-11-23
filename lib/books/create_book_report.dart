import 'dart:convert';

import 'package:booksaeteum/books/choose_book.dart';
import 'package:booksaeteum/books/review_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;



class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  State<CreateReport> createState() => _CreateReportState();
}

const jwtToken = jwt.jwtToken;


class _CreateReportState extends State<CreateReport> {
  bool isImageSeleted = false;
  bool spoilerSelected = false;
  bool privateSelected = false;
  Map<String, dynamic>? selectedBookInfo;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(32, 96, 79, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            '독후감 작성',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () async {
                    final bookId = selectedBookInfo?['bookId'];

                    final url = Uri.parse("http://10.0.2.2:8080/api/v1/review/$bookId");

                    // Prepare the request headers
                    var headers = {
                      'accept': '*/*',
                      'Authorization': 'Bearer $jwtToken',
                    };

                    var request = http.MultipartRequest('POST', url)
                      ..headers.addAll(headers)
                      ..fields['reviewTitle'] = titleController.text
                      ..fields['reviewContent'] = contentController.text
                      ..fields['reviewSpoiler'] = spoilerSelected.toString()
                      ..fields['reviewPrivate'] = privateSelected.toString();


                    var response = await request.send();

                    var responseBody = await response.stream.bytesToString();
                    var jsonResponse = jsonDecode(responseBody);
                    var reviewId = jsonResponse['data'];

                    if(response.statusCode == 200){
                      debugPrint("post Comment Succeed: $reviewId");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewDetail(reviewId: reviewId)));

                    }else{
                      debugPrint("post Comment Failed");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      minimumSize: const Size(30, 25),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    '완료',
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '도서 선택',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () async {
                                final selectedBook = await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ChooseBook())
                                );
                                debugPrint("clicked book:$selectedBook");
                                setState(() {
                                  selectedBookInfo = selectedBook;
                                });
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Color.fromRGBO(32, 96, 79, 1),
                              )
                          )
                        ],
                      ),
                      if(selectedBookInfo != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  selectedBookInfo!['bookImg'],
                                  width: 100,
                                  height: 150,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${selectedBookInfo!['bookTitle']}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text('${selectedBookInfo!['bookAuthor']}'),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      if(selectedBookInfo == null)
                        const Text(
                          '돋보기를 눌러 도서를 검색하세요.',
                          style: TextStyle(color: Colors.black38),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenSize.width,
                  child: const Divider(
                    color: Colors.black12,
                    thickness: 5.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)),
                            hintText: '독후감 제목'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: contentController,
                        style: const TextStyle(fontSize: 15),
                        maxLines: null,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: '글을 작성해주세요'),
                        textInputAction: TextInputAction.newline,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isImageSeleted = true;
                        });
                      },
                      icon: Image.asset('assets/image.png')),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: spoilerSelected,
                    onChanged: ((value) {
                      setState(() {
                        spoilerSelected = true;
                      });
                    }),
                  ),
                  const Text('스포일러 포함'),
                  Checkbox(
                    value: privateSelected,
                    onChanged: ((value) {
                      setState(() {
                        privateSelected = true;
                      });
                    }),
                  ),
                  const Text('비공개'),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchTitle extends StatefulWidget {
  const SearchTitle({super.key});

  @override
  State<SearchTitle> createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.black),
              )),
          title: const Text(
            '토론 개설',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // search bar
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Container(
                  width: 400,
                  height: 30,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      //color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchTitle()));
                          },
                          icon: const Icon(Icons.search)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // list of books
              Container(
                width: 400,
                height: 100,
                color: const Color.fromRGBO(217, 217, 217, 1),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      // book cover
                      Image.asset(
                        'assets/book1.png',
                        height: 80,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text('책 제목'),
                          Row(
                            children: [
                              Text('저자'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('출판사')
                            ],
                          )
                        ],
                      )
                      // book detail text
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

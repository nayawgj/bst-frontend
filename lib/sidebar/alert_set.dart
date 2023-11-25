import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const Text(
                '알림',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              //Icon(Icons.bookmark, color: Color.fromRGBO(32, 96, 79, 1)),
              FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('저장'),
                backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white), // 원하는 테두리 색상
                  borderRadius: BorderRadius.circular(18), // 원하는 모서리 반경
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('내 독후감에 달린 댓글 알림'),
                      SizedBox(
                        height: 15,
                      ),
                      Text('내 토론글 인용 알림'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

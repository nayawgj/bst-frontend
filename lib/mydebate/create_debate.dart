import 'package:flutter/material.dart';

class CreateDebate extends StatefulWidget {
  const CreateDebate({super.key});

  @override
  State<CreateDebate> createState() => _CreateDebateState();
}

class _CreateDebateState extends State<CreateDebate> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              // book title
              const Text('책 제목*'),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // authors
              const Text('저자*'),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // debate title
              const Text('토론 주제*'),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // type of debate - toggle button
              const Text('토론 유형'),
              Row(
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
                      Container(
                        width: 80,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: _isSelected[0] ? Colors.black : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '자유토론',
                            style: TextStyle(
                              color:
                                  _isSelected[0] ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: _isSelected[1] ? Colors.black : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '찬반토론',
                            style: TextStyle(
                              color:
                                  _isSelected[1] ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // 개요
              const Text('개요'),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // password
              const Text('비밀번호'),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MyDebateScreen extends StatefulWidget {
  const MyDebateScreen({super.key});

  @override
  State<MyDebateScreen> createState() => _MyDebateScreenState();
}

class _MyDebateScreenState extends State<MyDebateScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
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
                child: const Column(
                  children: [
                    Row(
                      children: [Text('책 제목'), Text('저자')],
                    ),
                    Text('토론 주제'),
                    Text('#토론 방식')
                  ],
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
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('    책 제목'), Text('    독후감 제목')]),
              ),
              Center(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  label: const Text('  토론방 만들기  '),
                  backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

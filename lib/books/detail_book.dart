import 'package:flutter/material.dart';

class DetailBookScreen extends StatefulWidget {
  const DetailBookScreen({super.key});

  @override
  State<DetailBookScreen> createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Image.asset('assets/mainlogo.png'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(32, 96, 79, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(children: [
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
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('젋은 베르테르의 슬픔'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('요한 볼프강 폰 괴테'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('민용사')
                      ],
                    )
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
                          color: Colors.white,
                        ),
                        color: _isSelected[0]
                            ? const Color.fromRGBO(32, 96, 79, 1)
                            : const Color.fromRGBO(249, 245, 234, 1),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    child: Center(
                      child: Text(
                        '독후감',
                        style: TextStyle(
                          color: _isSelected[0] ? Colors.white : Colors.black,
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
                          color: Colors.white,
                        ),
                        color: _isSelected[1]
                            ? const Color.fromRGBO(32, 96, 79, 1)
                            : const Color.fromRGBO(249, 245, 234, 1),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    child: Center(
                      child: Text(
                        '토론',
                        style: TextStyle(
                          color: _isSelected[1] ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}

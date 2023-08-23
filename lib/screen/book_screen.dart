import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          //const Color.fromRGBO(32, 96, 79, 0.5),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                // search bar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: const Offset(1, 3),
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                        child: TextField(
                          //controller: searchController,
                          //onSubmitted: _handleSubmitted,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(32, 96, 79, 1),
                                    width: 3)),
                            hintText: '검색어를 입력하세요',
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                                onPressed: () {}, //searchController.clear,
                                icon: Image.asset('assets/search.png')),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

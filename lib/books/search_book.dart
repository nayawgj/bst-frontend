import 'package:flutter/material.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({super.key});

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // app bar
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
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/profile_user.png'))),
                ),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          //const Color.fromRGBO(32, 96, 79, 0.5),
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  // search bar
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                      onPressed:
                                          () {}, //searchController.clear,
                                      icon: Image.asset('assets/search.png')),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // search result
                      const Text(
                        '검색 결과',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

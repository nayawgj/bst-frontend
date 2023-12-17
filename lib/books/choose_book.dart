import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;



class ChooseBook extends StatefulWidget {
  const ChooseBook({super.key});

  @override
  State<ChooseBook> createState() => _ChooseBookState();
}

const jwtToken = jwt.jwtToken;

class _ChooseBookState extends State<ChooseBook> {
  TextEditingController searchController = TextEditingController();

  List<dynamic> books = [];

  // @override
  // void initState(){
  //
  // }

  Future<void> fetchData(String keyword) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/books/search?keyword=$keyword');

    final response = await http.get(
        url,
        headers: {
          'Authorization':'Bearer $jwtToken'
        });

    if(response.statusCode == 200){
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      setState(() {
        books = data['data'];
      });
    }else{
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // app bar
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: Image.asset('assets/mainlogo.png'),
        //   centerTitle: true,
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Color.fromRGBO(32, 96, 79, 1),
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   actions: [
        //     Builder(
        //       builder: (context) => IconButton(
        //         onPressed: () => Scaffold.of(context).openEndDrawer(),
        //         icon: Padding(
        //           padding: const EdgeInsets.only(right: 15),
        //           child: SizedBox(
        //               height: 30,
        //               width: 30,
        //               child: FittedBox(
        //                   fit: BoxFit.cover,
        //                   child: Image.asset('assets/profile_user.png'))),
        //         ),
        //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //       ),
        //     )
        //   ],
        // ),
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
                                controller: searchController,
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
                                      onPressed: () async {
                                        await fetchData(searchController.text);
                                      }, //searchController.clear,
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
              Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0
                      ),
                      itemCount: books.length,
                      itemBuilder: (BuildContext context2, int index){
                        final book = books[index];
                        return GridTile(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pop(book);
                                // debugPrint('$book');
                                // Navigator.pop(context, "book");
                                Navigator.of(context).pop(book);
                              },
                              child: Container(
                                width: 150.0,
                                height: 220.0,
                                margin: const EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Image.network(
                                    book['bookImg'],
                                    fit: BoxFit.cover
                                ),
                              )
                            )
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

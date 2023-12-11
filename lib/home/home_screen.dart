import 'dart:convert';

import 'package:booksaeteum/home/new_room.dart';
import 'package:booksaeteum/home/popular_room.dart';
import 'package:booksaeteum/home/search_result.dart';
import 'package:booksaeteum/models/debate_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:http/http.dart' as http;
import 'package:booksaeteum/jwt_token/jwt.dart' as jwt;

const jwtToken = jwt.jwtToken;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // main color
  Color maincolor = const Color.fromRGBO(32, 96, 79, 0.5);

  late Future<List<DebateModel>> bestDebates;
  late Future<List<DebateModel>> recentDebates;

  @override
  void initState() {
    super.initState();
    bestDebates = getBestDebates();
    recentDebates = getRecentDebates();
  }

  Future<List<DebateModel>> getBestDebates() async {
    List<DebateModel> debateInstances = [];
    final url = Uri.parse('http://10.0.2.2:8080/main/best');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      debateInstances = List<DebateModel>.from(
        data.map((data) => DebateModel.fromJson(data)),
      );
      return debateInstances;
    }
    throw Error();
  }

  Future<List<DebateModel>> getRecentDebates() async {
    List<DebateModel> debateInstances = [];
    final url = Uri.parse('http://10.0.2.2:8080/main/new');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      debateInstances = List<DebateModel>.from(
        data.map((data) => DebateModel.fromJson(data)),
      );
      return debateInstances;
    }
    throw Error();
  }

  String getTypeText(int type) {
    if (type == 0) {
      return '자유';
    } else {
      return '찬반';
    }
  }

  // new window
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController =
        TextEditingController(); // search controller**
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    // 검색바&배너
                    Container(
                      color: maincolor,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
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
                                      controller: searchController,
                                      //onSubmitted: _handleSubmitted,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 16),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    32, 96, 79, 1),
                                                width: 3)),
                                        hintText: '검색어를 입력하세요',
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SearchResult()));
                                            },
                                            icon: Image.asset(
                                                'assets/search.png')),
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
                          // banner
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  height: 120,
                                  autoPlay: true,
                                  viewportFraction: 1),
                              items: [1, 2, 3].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        decoration: const BoxDecoration(
                                            color: Colors.white),
                                        child: Image.asset(
                                          'assets/banner_$i.jpg',
                                          fit: BoxFit.cover,
                                        ));
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // 토론방
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: Column(
                        // 방
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '인기 토론방',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PopularRoom()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color.fromRGBO(32, 96, 79, 1),
                                        size: 20,
                                      )),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 3,
                                    color: Colors.black.withOpacity(0.5),
                                  )
                                ]),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      height: 89,
                                      viewportFraction: 1,
                                      scrollDirection: Axis.vertical),
                                  items: [0, 1, 2, 3, 4].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: const GradientBoxBorder(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromRGBO(
                                                            32, 96, 79, 1),
                                                        Color.fromRGBO(
                                                            245, 245, 245, 1)
                                                      ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter),
                                                  width: 2.5),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: FutureBuilder(
                                                future: bestDebates,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    final bestDebates =
                                                        snapshot.data!;
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              left:
                                                                  15.0), // 왼쪽 패딩 추가
                                                          child: Text(
                                                            bestDebates[i]
                                                                .title,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 9),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              left:
                                                                  15.0), // 왼쪽 패딩 추가
                                                          child: Text(
                                                            bestDebates[i]
                                                                .topic,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left:
                                                                        15.0), // 왼쪽 패딩 추가
                                                            child: Text(
                                                              '#${getTypeText(bestDebates[i].type)} #${bestDebates[i].category}',
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 0.11,
                                                              ),
                                                            )),
                                                      ],
                                                    );
                                                  }
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }));
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // 최신 토론방
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '최신 토론방',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NewRoom()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color.fromRGBO(32, 96, 79, 1),
                                        size: 20,
                                      ))
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 3,
                                    color: Colors.black.withOpacity(0.5),
                                  )
                                ]),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      height: 89,
                                      viewportFraction: 1,
                                      scrollDirection: Axis.vertical),
                                  items: [0, 1, 2, 3, 4].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: const GradientBoxBorder(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromRGBO(
                                                            32, 96, 79, 1),
                                                        Color.fromRGBO(
                                                            245, 245, 245, 1)
                                                      ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter),
                                                  width: 2.5),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: FutureBuilder(
                                                future: recentDebates,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    final recentDebates =
                                                        snapshot.data!;
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              left:
                                                                  15.0), // 왼쪽 패딩 추가
                                                          child: Text(
                                                            recentDebates[i]
                                                                .title,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 9),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              left:
                                                                  15.0), // 왼쪽 패딩 추가
                                                          child: Text(
                                                            recentDebates[i]
                                                                .topic,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              left:
                                                                  15.0), // 왼쪽 패딩 추가
                                                          child: Text(
                                                            '#${getTypeText(recentDebates[i].type)} #${recentDebates[i].category}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }));
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // 카테고리
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '카테고리',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyCategory(text: '#소설'),
                              MyCategory(text: '#에세이'),
                              MyCategory(text: '#과학'),
                              MyCategory(text: '#인문학'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyCategory(text: '#자기계발'),
                              MyCategory(text: '#IT'),
                              MyCategory(text: '#역사'),
                              MyCategory(text: '#종교'),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyCategory extends StatelessWidget {
  const MyCategory({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromRGBO(217, 217, 217, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      onPressed: () {},
      minWidth: 50,
      child: Text(text),
    );
  }
}

import 'dart:convert';

import 'package:booksaeteum/books/book_screen.dart';
import 'package:booksaeteum/models/user_info_model.dart';
import 'package:booksaeteum/sidebar/profile_set.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'alert_set.dart';
import 'bookmark_list.dart';
import 'my_review.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late Future<UserInfoModel> userInfo;
  @override
  void initState() {
    super.initState();
    userInfo = getUserInfo();
  }

  Future<UserInfoModel> getUserInfo() async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/user');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final userInfo = data['data'];
      print(data);
      return UserInfoModel.fromJson(userInfo);
    }
    throw Exception('failed to fetch data');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<UserInfoModel>(
          future: userInfo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final user = snapshot.data!;

              Image userImg = Image.asset(
                'assets/profile_user.png',
                width: 55,
                height: 55,
              );
              if (user.image != null) {
                userImg = Image.network(
                  user.image,
                  width: 50,
                  height: 50,
                );
              }

              print(userImg);
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 27),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(32, 96, 79, 1),
                          size: 30,
                        )),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '책 읽는 뿡이',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '레벨 7',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/profile_user.png',
                          width: 55,
                          height: 55,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    // review
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MyReview()));
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              iconSize: 20,
                              color: const Color.fromRGBO(32, 96, 79, 1),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '내 리뷰 ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(32, 96, 79, 1),
                                )
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/line_2.png',
                          width: 280,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // bookmark
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const BookMarks()));
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              iconSize: 20,
                              color: const Color.fromRGBO(32, 96, 79, 1),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '북마크 ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.bookmark,
                                  color: Color.fromRGBO(32, 96, 79, 1),
                                )
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/line_2.png',
                          width: 280,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '설정 ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.settings,
                                  color: Color.fromRGBO(32, 96, 79, 1),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/line_2.png',
                          width: 280,
                          fit: BoxFit.fill,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Profile()));
                                },
                                child: const Text('프로필 설정 ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Alert()));
                                },
                                child: const Text('알림 설정 ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Alert()));
                                },
                                child: const Text('로그 아웃 ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/mainlogo.png',
                      height: 25,
                    )
                  ],
                )
              ],
            );
          }),
    );
  }
}

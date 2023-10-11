import 'package:booksaeteum/sidebar/profile_set.dart';
import 'package:booksaeteum/sidebar/setting.dart';
import 'package:flutter/material.dart';

import 'alert_set.dart';
import 'bookmark_list.dart';
import 'my_review.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                        style: TextStyle(color: Colors.black, fontSize: 15),
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
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Settings()));
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        iconSize: 20,
                        color: const Color.fromRGBO(32, 96, 79, 1),
                      ),
                      const Row(
                        children: [
                          Text(
                            '설정 ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)))
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)))
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)))
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
      ),
    );
  }
}

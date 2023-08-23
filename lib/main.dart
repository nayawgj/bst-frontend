/*import 'package:booksaeteum/home/new_room.dart';
import 'package:booksaeteum/home/popular_room.dart';
import 'package:booksaeteum/screen/book_screen.dart';
import 'package:booksaeteum/screen/home_screen.dart';*/
import 'package:booksaeteum/screen/mainpage.dart';
//import 'package:booksaeteum/screen/mydebate_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /*initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/homescreen': (context) => const HomeScreen(),
        '/homescreen/popular': (context) => const PopularRoom(),
        '/homescreen/new': (context) => const NewRoom(),
        '/mydebate': (context) => const MyDebateScreen(),
        '/books': (context) => const BookScreen(),
      },*/
      home: MainPage(),
    );
  }
}

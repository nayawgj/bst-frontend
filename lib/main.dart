import 'package:booksaeteum/screen/login.dart';
import 'package:booksaeteum/screen/mainpage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
    //home: LogIn());
  }
}

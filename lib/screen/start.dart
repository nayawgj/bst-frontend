import 'package:booksaeteum/screen/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplashScreen(); // 스플래시 스크린을 일정 시간 동안 보여주고 다음 화면으로 이동
  }

  Future<void> _loadSplashScreen() async {
    await Future.delayed(const Duration(seconds: 4)); // 3초 동안 스플래시 스크린 보여주기

    Navigator.pushReplacement(
      // 스플래시 스크린 종료 후 다음 화면으로 이동
      context,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(32, 96, 79, 1),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/launcher_icon.png',
              width: 150,
            ),
            Image.asset('assets/mainlogo_white.png')
          ],
        ),
      ),
    );
  }
}

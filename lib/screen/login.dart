import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
              left: 165, top: 90, child: Image.asset('assets/mainlogo.png')),
          Positioned(
              left: 338, top: 140, child: Image.asset('assets/book1.png')),
          const Positioned(
            left: 130,
            top: 230,
            child: Text(
              '회원가입 및 로그인',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Positioned(
            left: 41,
            top: 268,
            child: SizedBox(
              width: 320,
              height: 43,
              child: Text(
                '사람들과 쉽게\n독서 경험을 나누고 토론해보세요.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.47,
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            top: 350,
            child: Container(
              width: 294,
              height: 44,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/kakao_login.png'),
                fit: BoxFit.fill,
              )),
            ),
          ),
          Positioned(left: 0, top: 360, child: Image.asset('assets/book2.png')),
          Positioned(
              left: 320, top: 500, child: Image.asset('assets/book3.png')),
          Positioned(
            left: 60,
            top: 420,
            child: Container(
              width: 294,
              height: 44,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/naver_login.png'),
                fit: BoxFit.fill,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login_screen.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                // logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/mainlogo.png',
                      width: 150,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                // text
                const Text(
                  '회원가입 및 로그인',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '사람들과 쉽게\n독서 경험을 나누고 토론해보세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // login buttons
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 294,
                    height: 44,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/kakao_login.png'))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 294,
                    height: 44,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/naver_login.png'))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

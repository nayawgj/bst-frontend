import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

//import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // final kakaoLoginUri = Uri.parse(
  //     "http://localhost:8080/oauth2/authorize/kakao?redirect_uri=http://localhost:8080/login/oauth2/code/kakao");

  // Kakao
  Future<void> signInToKakao() async {
    //const APP_REDIRECT_URI = "http://10.0.2.2:8080/login/oauth2/code/kakao";
    const APP_REDIRECT_URI = "http://10.0.2.2:8080/login/oauth2/code/kakao";

    final url = Uri.parse(
        'http://10.0.2.2:8080/oauth2/authorize/kakao?redirect_uri=$APP_REDIRECT_URI');

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: APP_REDIRECT_URI);

    // 백엔드에서 redirect한 callback 데이터 파싱
    final accessToken = Uri.parse(result).queryParameters['accessToken'];
    final refreshKey = Uri.parse(result).queryParameters['refreshKey'];

    print("카카오 로그인 완료!");
  }

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

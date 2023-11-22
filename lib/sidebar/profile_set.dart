import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(32, 96, 79, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Center(
            child: Text(
              '프로필 설정',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('저장'),
              backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white), // 원하는 테두리 색상
                borderRadius: BorderRadius.circular(18), // 원하는 모서리 반경
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // picture of profile
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/profile_user.png',
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // nickname
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '레벨 7',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

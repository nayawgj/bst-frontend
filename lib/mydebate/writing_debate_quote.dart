import 'package:flutter/material.dart';

// 토론글 작성 페이지 with 인용
class WriteDebateWithQuote extends StatelessWidget {
  const WriteDebateWithQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          //취소버튼
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(Size.zero), // 최소 크기를 0으로 지정
                padding: MaterialStateProperty.all(
                    EdgeInsets.zero), // 패딩을 없애서 버튼 내부의 공간을 최소화
                alignment: Alignment.center, // 버튼 내부의 텍스트를 가로 중앙으로 정렬
              ),
              child: Text('취소',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16,
                  ))),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.all(8),
              //업로드 버튼
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      minimumSize: const Size(25, 28),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    '업로드',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 프로필 사진
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_user.png'),
            ),
            SizedBox(height: 20), // 간격 조절
            // 인용하는 글
            Container(
                height: 143,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            //인용 프로필 사진
                            radius: 16,
                            backgroundImage:
                                AssetImage('assets/profile_user.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "닉네임",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "-05/30/23",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "『문과 남자의 과학 공부』는 역사ㆍ정치ㆍ경제ㆍ글쓰기ㆍ여행 등 인문학 분야의 글을 써온 작가 유시민이 과학을 소재로 쓴 첫 책이다. 유시민에게 “지적  ...",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                    ],
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            // 게시글 작성란
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: '의견을 작성해주세요.',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.black), // 구분선
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Image.asset('assets/image.png'), // 아이콘
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  bool isImageSeleted = false;
  bool sploilerSelected = false;
  bool privateSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(32, 96, 79, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            '독후감 작성',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(32, 96, 79, 1),
                      minimumSize: const Size(30, 25),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    '완료',
                  )),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '도서 선택',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Color.fromRGBO(32, 96, 79, 1),
                            ))
                      ],
                    ),
                    const Text(
                      '돋보기를 눌러 도서를 검색하세요.',
                      style: TextStyle(color: Colors.black38),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenSize.width,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 5.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12)),
                          hintText: '독후감 제목'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: '글을 작성해주세요'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isImageSeleted = true;
                        });
                      },
                      icon: Image.asset('assets/image.png')),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: sploilerSelected,
                    onChanged: ((value) {
                      setState(() {
                        sploilerSelected = true;
                      });
                    }),
                  ),
                  const Text('스포일러 포함'),
                  Checkbox(
                    value: privateSelected,
                    onChanged: ((value) {
                      setState(() {
                        privateSelected = true;
                      });
                    }),
                  ),
                  const Text('비공개'),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewDetail extends StatefulWidget{
  const ReviewDetail({super.key});

  @override
  State<StatefulWidget> createState() => _ReviewDetailState();

}

class _ReviewDetailState extends State<ReviewDetail>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: const Text(
        //     '독후감 상세보기',
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   centerTitle: true,
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Color.fromRGBO(32, 96, 79, 1),
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   actions: [
        //     Builder(
        //       builder: (context) => IconButton(
        //         onPressed: () => Scaffold.of(context).openEndDrawer(),
        //         icon: Padding(
        //           padding: const EdgeInsets.only(right: 15),
        //           child: SizedBox(
        //               height: 30,
        //               width: 30,
        //               child: FittedBox(
        //                   fit: BoxFit.cover,
        //                   child: Image.asset('assets/profile_user.png'))),
        //         ),
        //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //       ),
        //     )
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '독후감',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0), // Adjust vertical padding here
                  child: Text(
                    '닉네임',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Description Text Description Text Description Text Description Text Description Text Description Text Description Text Description Text Description Text Description Text Description Text Description Text Description Text ',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  'https://example.com/image_url.jpg', // Replace with your image URL
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace){
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 30.0,
                thickness: 2.0,
              ),
              const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '댓글',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(10, (index) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("닉네임"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('동감해요... 미르띤...'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                          height: 0.0,
                        ),
                      )
                    ],
                  );
                }),
              )

            ],
          ),
        )
      ),
    );
  }

}
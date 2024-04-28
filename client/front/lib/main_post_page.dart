import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Main_post_page extends StatefulWidget {
  const Main_post_page({Key? key}) : super(key: key);
  @override
  _Main_post_pageState createState() => _Main_post_pageState();
}
class _Main_post_pageState extends State<Main_post_page> {
  bool button1state = true; //초기 설정 값
  bool button2state = false;
  bool button3state = false;
  Color button1_text_color = Color(0xff7C2E1A); //초기 색상 값
  Color button1_border_color = Color(0xff7C3D1A);
  Color button2_text_color = Color(0xff4A4A4A);
  Color button2_border_color = Color(0xffB1B1B1);
  Color button3_text_color = Color(0xff4A4A4A);
  Color button3_border_color = Color(0xffB1B1B1);

  void changeState(){ //색 변경
    setState(() {
      if(button1state)
      {button1_text_color = Color(0xff7C2E1A);
        button1_border_color = Color(0xff7C3D1A);}
      else
        {button1_text_color = Color(0xff4A4A4A);
          button1_border_color = Color(0xffB1B1B1);}

      if(button2state)
      {button2_text_color = Color(0xff7C2E1A);
        button2_border_color = Color(0xff7C3D1A);}
      else
      {button2_text_color = Color(0xff4A4A4A);
        button2_border_color = Color(0xffB1B1B1);}

      if(button3state)
      {button3_text_color = Color(0xff7C2E1A);
      button3_border_color = Color(0xff7C3D1A);}
      else
      {button3_text_color = Color(0xff4A4A4A);
      button3_border_color = Color(0xffB1B1B1);}
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xffF6F6F6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container( width: 57.0, height: 25.0,
                      margin: const EdgeInsets.only(left: 27, top: 33.0),
                      child: const Text(
                        '게시글',
                        style: TextStyle(
                          fontFamily: 'paybooc',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.01,
                          color: Color(0xff111111),
                        ),),),
                    SizedBox(width: 158),
                    Container(
                      margin : const EdgeInsets.only(top: 35.0),
                      child: IconButton(
                        onPressed:
                            () {},
                        icon: Image.asset('assets/images/search_icon.png',
                        ),
                      ),
                    ),
                    Container(
                      margin : const EdgeInsets.only(top: 34.0,right: 21.31),
                      child: IconButton(
                        onPressed: () {
                        },
                        icon: Image.asset('assets/images/alarm_icon.png',
                          color: Color(0xffB4B5BE),
                        ),
                      ),)
                  ],
                )
               ),
              Container(
                child: Row(
                  children: [
                    GestureDetector( //버튼1
                      onTap: () {
                        button1state = true;
                        button2state = false;
                        button3state = false;
                        changeState();
                      },
                      child: Container(width: 70, height: 32,
                        margin: const EdgeInsets.only(left: 27, top: 19.0),
                        child: Stack(
                          children: [
                            Positioned(left: 0, top: 0,
                              child: Container(width: 70, height: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFBFBFB),
                                  border: Border.all(color: button1_border_color, width: 1,),
                                  borderRadius: BorderRadius.circular(10),
                                ),),), // Text
                            Positioned(left: 16.72, top: 7.72,
                              child: Text('최신순', style: TextStyle(
                                  fontFamily: 'Pretendard', fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500, fontSize: 14,
                                  letterSpacing: 0.001, color: button1_text_color,
                                ),),),
                          ],),),),
                    GestureDetector( //버튼2
                      onTap: () {
                        button1state = false;
                        button2state = true;
                        button3state = false;
                        changeState();
                      },
                      child: Container(width: 70, height: 32,
                        margin: const EdgeInsets.only(left: 11, top: 19.0),
                        child: Stack(
                          children: [
                            Positioned(left: 0, top: 0,
                              child: Container(width: 70, height: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFBFBFB),
                                  border: Border.all(color: button2_border_color, width: 1,),
                                  borderRadius: BorderRadius.circular(10),
                                ),),), // Text
                            Positioned(left: 16.72, top: 7.72,
                              child: Text('금액순', style: TextStyle(
                                fontFamily: 'Pretendard', fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500, fontSize: 14,
                                letterSpacing: 0.001, color: button2_text_color,
                              ),),),
                          ],),),),
                    GestureDetector( //버튼3
                      onTap: () {
                        button1state = false;
                        button2state = false;
                        button3state = true;
                        changeState();
                      },
                      child: Container(width: 70, height: 32,
                        margin: const EdgeInsets.only(left: 11, top: 19.0),
                        child: Stack(
                          children: [
                            Positioned(left: 0, top: 0,
                              child: Container(width: 70, height: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFBFBFB),
                                  border: Border.all(color: button3_border_color, width: 1,),
                                  borderRadius: BorderRadius.circular(10),
                                ),),), // Text
                            Positioned(left: 16.72, top: 7.72,
                              child: Text('거리순', style: TextStyle(
                                fontFamily: 'Pretendard', fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500, fontSize: 14,
                                letterSpacing: 0.001, color: button3_text_color,
                              ),),),
                          ],),),)
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22.0, top: 36.0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 9.0),
                            child: const Text(
                              '업로드 파일 예시',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.01,
                                color: Color(0xff373737),
                              ),
                            ),
                          ),
                          const Text(
                            '파일 형식  jpg / png',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 12,
                              letterSpacing: 0.01,
                              color: Color(0xff373737),
                            ),
                          ),
                          Column(
                              children: [
                                Text('', style: const TextStyle(fontSize: 10)),
                                Text('', style: const TextStyle(fontSize: 10)),
                                Text('', style: const TextStyle(fontSize: 10)),
                              ]
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 139.58,
                      height: 256.44,
                      margin: const EdgeInsets.only(left: 22.0, top: 18.0),
                      child: Image.asset('assets/images/upload_image_sample.png'),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  }


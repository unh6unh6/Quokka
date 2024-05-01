import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'upload_image.dart';
import 'profile.dart';
class Check_Image extends StatefulWidget{
  final Student s1;
  Check_Image( {Key? key, required this.s1, }): super (key: key);
  @override
  Check_ImageState createState() => Check_ImageState();
}
class Check_ImageState extends State<Check_Image> {
  final int IDLength = 9;
  late Student s1;
  late TextEditingController _MajorController;
  late TextEditingController _IDController;
  late TextEditingController _NameController;
  late bool isIDValid = s1.studentID.trim().length == IDLength;
  request(String ID) async{
    print(ID);
    String url = "http://ec2-43-201-110-178.ap-northeast-2.compute.amazonaws.com:8080/join";
    String param = "/$ID/idExists";
    print(url + param);
    // Map<String, String> userData = {
    //     //   'username': username,
    //     //   'password': password,
    //     // };
    //     // String jsonBody = json.encode(userData);
    try {
      var response = await http.get(Uri.parse(url+param));
      if (response.statusCode == 200) {
        Navigator.push( //로그인 버튼 누르면 게시글 페이지로 이동하게 설정
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      }
      else {
        String jsonString = response.body;
        Map<String, dynamic> error = jsonDecode(jsonString);
        print("code : " + error['code'].toString() + "\n");
        print("httpStatusCode : " + error['httpStatusCode'].toString() + "\n");
        print("message : " + error['message'].toString() + "\n");
      }
    } catch(e) {
      print(e.toString());
    }
  }
  @override
  void initState(){
    super.initState();
    s1 = widget.s1;
    _MajorController =
        TextEditingController(text:s1.major.trim());
    _IDController =
        TextEditingController(text:s1.studentID.trim());
    _NameController =
        TextEditingController(text:s1.name.trim());
    _IDController.addListener(() {
      setState(() {
        isIDValid = _IDController.text.length == IDLength
        && int.tryParse(_IDController.text) != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              leading:
              Padding(padding: EdgeInsets.only(top: 26.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              title: Padding(padding: EdgeInsets.only(top: 26.0),
                  child: SizedBox(
                    height: 25.0,
                    child:
                    Text('회원가입', style: TextStyle(
                      fontFamily: 'paybooc',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.01,
                      color: Color(0xff111111),
                    )),
                  ))),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Container(
                  margin: EdgeInsets.only(left: 24.0, top: 30.0),
                  child: Text('학부 / 학과', style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.01,
                    color: Color(0xff373737),))),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 9.0),
                  width: 320, height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffF0F0F0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 12.0),
                    child: TextField(
                      controller: _MajorController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 13, fontFamily: 'Pretendard',
                            letterSpacing: 0.01, color: Color(0xff404040),
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                  ),
                ),
                  Container(
                      margin: EdgeInsets.only(left: 22.0, top: 28.0),
                      child: Text('학번', style: TextStyle(
                        fontFamily: 'Pretendard',fontSize: 14, fontWeight: FontWeight.bold,
                        letterSpacing: 0.01, color: Color(0xff373737),))),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 9.0),
                  width: 320, height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffF0F0F0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 12.0),
                    child: TextField(
                      maxLength: IDLength,
                      controller: _IDController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 13, fontFamily: 'Pretendard',
                            letterSpacing: 0.01, color: Color(0xff404040),
                          ),
                          counterText: '',
                        ),
                      keyboardType: TextInputType.number,
                    )
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 22.0, top: 28.0),
                    child: Text('이름', style: TextStyle(
                      fontFamily: 'Pretendard',fontSize: 14, fontWeight: FontWeight.bold,
                      letterSpacing: 0.01, color: Color(0xff373737),))),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 9.0),
                  width: 320, height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffF0F0F0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 12.0),
                    child: TextField(
                      controller: _NameController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 13, fontFamily: 'Pretendard',
                            letterSpacing: 0.01, color: Color(0xff404040),
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 21.0, top: 33.0),
                    child: Text('해당 정보가 일치하다면 확인 버튼을 눌러주세요.', style: TextStyle(
                      fontFamily: 'Pretendard',fontSize: 13, fontWeight: FontWeight.w500,
                      letterSpacing: 0.01, color: Color(0xff343434),))),
                Container(margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 9.0),
                  width: 320,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isIDValid ? Color(0xff7C3D1A) : Colors.grey,
                      border: Border.all(
                        width: 0.5,
                        color: Color(0xffACACAC),
                      ),
                      borderRadius: BorderRadius.circular(10.0),

                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: isIDValid
                      ? () {
                        request(_IDController.text);

                    }
                    : null,
                    child: Text('확인', style: TextStyle(fontSize: 16,
                      fontFamily: 'Pretendard', letterSpacing: 0.01,color: Color(0xffFFFFFF),
                    ),),),
                      //keyboardType: TextInputType.text, api로 입력받는 기능 추가해야함
                  ),),
                Container(
                    margin: EdgeInsets.only(left: 20.0, top: 12.0),
                    child: Text('* 해당 정보가 일치하지 않으면 알맞게 바꿔주세요.', style: TextStyle(
                      fontFamily: 'Pretendard',fontSize: 12, fontWeight: FontWeight.w400,
                      letterSpacing: 0.01, color: Color(0xffFF4B4B),))),
              ],
                    )
                )
            ),
          );
  }}
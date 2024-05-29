import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class Stamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 심부름 하는 사람(현재 로그인 한 사람) 실명 도장 틀
    return Container(
      // margin: EdgeInsets.only(top: 17.15),
      child: Stack(
        children: [
          // 심부름 하는 사람(현재 로그인 한 사람) 실명 도장 틀
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(top: 5.15, right: 32),
                  child: Image.asset("assets/images/Rectangle3.png")
              )
          ),
          // 도장 그림
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(top: 28.58, right: 40.53),
                  child: Image.asset("assets/images/stamp.png")
              )
          ),
          // 심부름 하는 사람 이름 첫 번째 글자
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(top: 6.52, right: 55),
                  child: Transform.rotate(
                    angle: 9.77 * math.pi / 180,
                  child: Text(
                    "정",
                    style: TextStyle(
                      fontFamily: 'Cafe24Oneprettynight',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      letterSpacing: 0.00,
                      color: Color(0xffCE1111),
                    ),
                   )
                  ),
              )
          ),
          // 심부름 하는 사람 이름 두 번째 글자
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(top: 9.3, right: 38),
                child: Transform.rotate(
                    angle: 9.77 * math.pi / 180,
                    child: Text(
                      "다",
                      style: TextStyle(
                        fontFamily: 'Cafe24Oneprettynight',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.00,
                        color: Color(0xffCE1111),
                      ),
                    )
                ),
              )
          ),
          // 심부름 하는 사람 이름 세 번째 글자
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(top: 22.9, right: 57),
                child: Transform.rotate(
                    angle: 9.77 * math.pi / 180,
                    child: Text(
                      "은",
                      style: TextStyle(
                        fontFamily: 'Cafe24Oneprettynight',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.00,
                        color: Color(0xffCE1111),
                      ),
                    )
                ),
              )
          ),

        ],
      ),
    );
  }
}
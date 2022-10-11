import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

void showCustomToast({context, alertType, milli = 3000, String? message}) {
  showToastWidget(
    CustomToast(alertType: alertType, duration: milli, message: message),
    context: context,
    duration: Duration(milliseconds: milli),
    dismissOtherToast: true,
    animDuration: Duration(milliseconds: 600),
    reverseCurve: Curves.easeIn,
    curve: Curves.easeIn,
    animation: StyledToastAnimation.slideFromRight,
    reverseAnimation: StyledToastAnimation.slideFromRight,
  );
}

class CustomToast extends StatelessWidget {
  final String alertType;
  final String? message;
  final int duration;
  CustomToast({
    Key? key,
    required this.alertType,
    required this.duration,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.95, 1.0),
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: -2,
                  blurRadius: 15,
                  color: Colors.grey[400]!.withOpacity(0.8),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  alertType == "success"
                      ? "assets/logo/success_logo.png"
                      : "assets/logo/failed_logo.png",
                  width: 15,
                  height: 15,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    message != null
                        ? message!
                        : alertType == "success"
                            ? "ดำเนินการสำเร็จ"
                            : "เกิดข้อผิดพลาด",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Kanit', fontSize: 14, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 5,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )),
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: (duration * 0.8).toInt()),
                tween: Tween<double>(begin: 1, end: 0),
                builder: (context, double value, child) =>
                    LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: Colors.transparent,
                  color: alertType == "success" ? Colors.green : Colors.red,
                  value: value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

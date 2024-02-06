import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget extends StatelessWidget {
  final String message;
  final Color color;
  int? time;
  final FToast fToast = FToast();

  ToastWidget({Key? key, required this.message, required this.color, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      height: MediaQuery.of(context).size.height * .1,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .7,
      child: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  showToast(BuildContext context) {
    Widget toast = ToastWidget(
      message: message,
      color: color,
    );
    fToast.init(context);
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: time ?? 3),
    );
  }
}

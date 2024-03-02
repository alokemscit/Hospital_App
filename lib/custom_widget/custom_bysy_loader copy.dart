import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBusyLoader {
  BuildContext context;
  CustomBusyLoader({required this.context});
  bool b = false;
  Future<void> show() async {
    b = true;
    //print("object");
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.2),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CupertinoPopupSurface(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void close() {
    if (b) {
      b = false;
      Navigator.pop(context);
    }
  }
}

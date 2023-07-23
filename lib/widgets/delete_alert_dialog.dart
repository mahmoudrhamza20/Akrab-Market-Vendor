import 'package:flutter/material.dart';

Future<void> showAlertDialog(
    {context, required title, required body, VoidCallback? onPressed}) async {
  return showDialog<void>(
    context: context,

    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // <-- SEE HERE
        title: title,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              body,
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: onPressed, child: const Text('نعم ')),
          TextButton(
            child: const Text('لا'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

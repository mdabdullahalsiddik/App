import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note_pad/static/All_Colors.dart';
import 'package:note_pad/static/All_Texts.dart';

class Cost_AlertDialog extends StatefulWidget {
  TextEditingController controller;
  VoidCallback onpass;
  var botton;
  Cost_AlertDialog(
      {required this.controller, required this.onpass, required this.botton});

  @override
  State<Cost_AlertDialog> createState() => _Cost_AlertDialogState();
}

class _Cost_AlertDialogState extends State<Cost_AlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: AllText.hintext,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: widget.onpass,
          child: widget.botton,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AllColor.redcolor),
          ),
        ),
      ],
    );
  }
}

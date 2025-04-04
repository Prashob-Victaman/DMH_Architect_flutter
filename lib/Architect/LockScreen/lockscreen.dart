import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showLockConfirmationDialog(
    BuildContext context, Widget newPage, String passingpin) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return LockConfirmationDialog(
        newPage: newPage,
        passingpin: passingpin,
      );
    },
  );
}

class LockConfirmationDialog extends StatefulWidget {
  Widget newPage;
  String passingpin;
  LockConfirmationDialog({
    Key? key,
    required this.newPage,
    required this.passingpin,
  }) : super(key: key);
  @override
  _LockConfirmationDialogState createState() => _LockConfirmationDialogState();
}

class _LockConfirmationDialogState extends State<LockConfirmationDialog> {
  final List<TextEditingController> _pinControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  String _pin = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.lock_outline,
            size: 45,
          ),
          heigh10,
          Text(
            'Enter PIN',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'Enter your 4 digit PIN',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          PinInput(
            pinControllers: _pinControllers,
            onChanged: (pin) {
              setState(() {
                _pin = pin;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          onPressed: widget.passingpin == _pin
              ? () {
                  // TODO: Add your confirmation logic here
                  print('Confirmed PIN: $_pin');
                  Navigator.of(context).pop();

                  Get.to(() => widget.newPage);
                }
              : () {
                  Fluttertoast.showToast(msg: "Incorrect PIN");
                },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

class PinInput extends StatelessWidget {
  final List<TextEditingController> pinControllers;
  final ValueChanged<String> onChanged;

  const PinInput({
    Key? key,
    required this.pinControllers,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: 50,
            height: 50,
            child: TextField(
              controller: pinControllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              obscureText: true,
              obscuringCharacter: '●',
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  if (index < 3) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                  String pin = '';
                  for (var controller in pinControllers) {
                    pin += controller.text;
                  }
                  onChanged(pin);
                }
              },
            ),
          ),
        );
      }),
    );
  }
}

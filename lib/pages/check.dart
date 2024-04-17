import 'package:flutter/material.dart';

class Checking extends StatelessWidget {
  final _passcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            children: [
              TextField(
                controller: _passcode,
                decoration: InputDecoration(labelText: 'Enter Passcode'),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Go!'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

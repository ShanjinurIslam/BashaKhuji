import 'package:flutter/material.dart';

class CreateAd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAdState();
  }
}

class CreateAdState extends State<CreateAd> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ));
  }
}

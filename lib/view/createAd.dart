import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAdState();
  }
}

class CreateAdState extends State<CreateAd> {
  String userID;
  String flatNumber;
  String houseName;
  String houseFloor;
  String catagory;
  String address;
  int rent;
  int numberOfBeds;
  int numberOfToilets;
  String phoneNumber;

  int selectedIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    /*
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          //widget.loginCallback();
          //go to next screen with userId in argument
          
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          //_formKey.currentState.reset();
        });
      }
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Flat Number',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'flatNumber can\'t be empty' : null,
                onSaved: (value) => flatNumber = value.trim(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'House Name',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'houseName can\'t be empty' : null,
                onSaved: (value) => houseName = value.trim(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'House Floor',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'houseFloor can\'t be empty' : null,
                onSaved: (value) => houseFloor = value.trim(),
              ),
            ),
            CupertinoPicker(
              children: <Widget>[
                Text('Family'),
                Text('Bachelor'),
                Text('Sublet')
              ],
              itemExtent: 50, //height of each item
              looping: true,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 2,
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Address',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'houseFloor can\'t be empty' : null,
                onSaved: (value) => address = value.trim(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Rent',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'Rent can\'t be empty' : null,
                onSaved: (value) => rent = int.parse(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Number of beds',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'Number of beds can\'t be empty' : null,
                onSaved: (value) => numberOfBeds = int.parse(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Number of toilets',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'Number of toilets can\'t be empty' : null,
                onSaved: (value) => numberOfBeds = int.parse(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: new TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Number of toilets',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) =>
                    value.isEmpty ? 'Phone Number can\'t be empty' : null,
                onSaved: (value) => phoneNumber = value.trim(),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                child: SizedBox(
                  height: 60.0,
                  width: 300,
                  child: new RaisedButton(
                    elevation: 2.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    color: Colors.blue,
                    child: new Text('Create Ad',
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    onPressed: validateAndSubmit,
                  ),
                ))
          ],
        ));
  }
}

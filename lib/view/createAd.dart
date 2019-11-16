import 'package:bashakhuji/model/ad_model.dart';
import 'package:bashakhuji/scopedModel/mainmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateAd extends StatefulWidget {
  final String userId;
  CreateAd({this.userId});
  @override
  State<StatefulWidget> createState() {
    return CreateAdState();
  }
}

class CreateAdState extends State<CreateAd> {
  final flatNumber = TextEditingController();
  final houseName = TextEditingController();
  final houseFloor = TextEditingController();
  final catagory = TextEditingController();
  final address = TextEditingController();
  final rent = TextEditingController();
  final numberOfBeds = TextEditingController();
  final numberOfToilets = TextEditingController();
  final phoneNumber = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget buildTextField(
    String fieldName, {
    TextEditingController controller,
    TextInputType t = TextInputType.text,
    int maxLine = 1,
  }) {
    return Container(
      child: TextFormField(
        controller: controller,
        autofocus: true,
        keyboardType: t,
        decoration: InputDecoration(labelText: fieldName),
        maxLines: maxLine,
        validator: (value) =>
            value.isEmpty ? fieldName + ' can\'t be empty' : null,
      ),
      margin: EdgeInsets.all(20),
    );
  }

  void dispose() {
    houseName.dispose();
    houseFloor.dispose();
    flatNumber.dispose();
    address.dispose();
    catagory.dispose();
    rent.dispose();
    numberOfBeds.dispose();
    numberOfToilets.dispose();
    phoneNumber.dispose();

    super.dispose();
  }

  int selectedIndex;

  int _stepNumber = 1;
  String _selectedItem;

  void saveData(BuildContext context) {
    _formKey.currentState.save();

    print(houseName.text);
    print(houseFloor.text);
    print(address.text);
    print(flatNumber.text);
    print(rent.text);
    print(numberOfBeds.text);
    print(numberOfToilets.text);
    print(phoneNumber.text);
    print(catagory.text);
  }

  void nextPage(BuildContext context) {
    setState(() {
      if (_stepNumber == 1)
        _stepNumber = 2;
      else
        _stepNumber = 1;

      print(_stepNumber);
    });
  }

  ListView formOneBuilder(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Create Ad',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        buildTextField('flatNumber', controller: flatNumber),
        buildTextField('houseName', controller: houseName),
        buildTextField('houseFloor', controller: houseFloor),
        buildTextField('address', controller: address, maxLine: 2),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                child: Text('Next'),
                onPressed: () {
                  nextPage(context);
                },
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              FlatButton(
                color: Colors.blue,
                child: Text('Save'),
                onPressed: () {
                  saveData(context);
                },
              ),
            ],
          ),
        )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget formTwoBuilder(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Create Ad',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          buildTextField('rent', controller: rent, t: TextInputType.number),
          buildTextField('numberOfBeds',
              controller: numberOfBeds, t: TextInputType.number),
          Padding(
            padding: EdgeInsets.all(20),
            child: new DropdownButton<String>(
              hint: Text('Select Catagory'),
              items:
                  <String>['family', 'bachelor', 'sublet'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              value: _selectedItem,
              onChanged: (String value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
          ),
          buildTextField('numberOfToilets',
              controller: numberOfToilets, t: TextInputType.number),
          buildTextField('phoneNumber',
              controller: phoneNumber, t: TextInputType.number),
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          child: Text('Previous'),
                          onPressed: () {
                            nextPage(context);
                          },
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        FlatButton(
                          color: Colors.blue,
                          child: Text('Save'),
                          onPressed: () {
                            saveData(context);
                            if (validateAndSave()) {
                              try {
                                Ad ad = new Ad(
                                    userID: widget.userId,
                                    flatNumber: flatNumber.text,
                                    houseName: houseName.text,
                                    houseFloor: houseFloor.text,
                                    catagory: _selectedItem,
                                    address: address.text,
                                    rent: int.parse(rent.text),
                                    numberOfBeds: int.parse(numberOfBeds.text),
                                    numberOfToilets:
                                        int.parse(numberOfToilets.text),
                                    phoneNumber: phoneNumber.text);
                                model.uploadData(ad);
                                setState(() {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Upload Done'),
                                            SizedBox(
                                              height: 60,
                                              width: 200,
                                              child: RaisedButton(
                                                  color: Colors.blue,
                                                  child: Text(
                                                    'Go Back',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  }),
                                            )
                                          ],
                                        );
                                      });
                                  //_formKey.currentState.reset();
                                });
                              } catch (e) {
                                print('Error: $e');
                              }
                            }
                          },
                        )
                      ]))),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_stepNumber) {
      case 1:
        return Scaffold(
            body: Form(
          key: _formKey,
          child: formOneBuilder(context),
        ));
        break;

      case 2:
        return Scaffold(
            body: Form(
          key: _formKey,
          child: formTwoBuilder(context),
        ));
        break;
    }
  }
}

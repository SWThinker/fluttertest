/*import 'package:flutter/material.dart';

void main() {
  runApp(
    new Center(
      child: new Directionality(
        textDirection: TextDirection.ltr,
        child: new Text("Prueba 2"),
      ),
    ),
  );
}
*/
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new AddUser());



class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'OMW - Add Users',
        home: Scaffold(
            appBar: AppBar(title: Text('Create Users - OWL System')),
            body: Center(
              child: AddUserHomePage(),
            )));
  }
}

class AddUserHomePage extends StatefulWidget {
  @override
  _AddUserHomePageState createState() => _AddUserHomePageState();
}
class _AddUserHomePageState extends State<AddUserHomePage> {

  TextEditingController _firstnameUser = new TextEditingController();
  TextEditingController _lastnameUser = new TextEditingController();
  TextEditingController _usernameUser = new TextEditingController();
  TextEditingController _phoneUser = new TextEditingController();
  TextEditingController _emailUser = new TextEditingController();
  Future<List> senddata() async {
    final jsonData = '"firstnameUser" :' + _firstnameUser.text + '"lastnameUser":' + _lastnameUser.text + '"usernameUser":' + _usernameUser.text + '"phoneUser":'+ _phoneUser.text + '"emailUser":'+_emailUser.text;
    final dataToSend = jsonEncode(jsonData);
    await http.post('http//localhost:82/OMWDBB/insert.php', body: dataToSend);
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "First Name",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: _firstnameUser,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              Text(
                "Last Name",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: _lastnameUser,
                decoration: InputDecoration(hintText: 'Lastname'),
              ),
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: _usernameUser,
                decoration: InputDecoration(hintText: 'At least 8 Characters'),
              ),
              Text(
                "Phone",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: _phoneUser,
                decoration: InputDecoration(hintText: 'Only Numbers'),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: _emailUser,
                decoration: InputDecoration(hintText: '50 Characters max'),
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () {
                  senddata();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

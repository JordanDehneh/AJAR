import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/ajar_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ajar_app/Sign_in.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String uid = '';
  String firstName ='';
  AuthService _auth = new AuthService();
  getUid() {}

  @override
  void initState() {
    this.uid = '';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
        //this.firstName = val.firstName;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('You are now logged in as ${uid}'),
                SizedBox(
                  height: 15.0,
                ),
                new OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
                  child: Text('Logout'),
                  onPressed: () {
                      _auth.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
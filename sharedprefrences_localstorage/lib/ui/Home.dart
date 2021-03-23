import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences localStorage;

TextEditingController emailController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();

class Home extends StatelessWidget {
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Login") ,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email:",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Password:",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        controller: pwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true))
                  ],
                ),
              ),
              RaisedButton(
                onPressed: save,
                child: Text('Login'),
              ),

              if (localStorage != null)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("User Logged in!!! ->  Email : ${localStorage.get('email')}  Password: ${localStorage.get('password')}",
                               style: TextStyle(fontSize: 20),),
                ),
            ],
          ),
        ),
    );
  }
}


save() async {
  await Home.init();
  localStorage.setString('email', emailController.text.toString());
  localStorage.setString('password', pwdController.text.toString());

}
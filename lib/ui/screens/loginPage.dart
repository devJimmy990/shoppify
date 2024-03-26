import 'package:flutter/material.dart';

import 'signUpPage.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' MJ Shop'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children:[
          Container(
          decoration: BoxDecoration(image:DecorationImage(image:AssetImage("assets/images/20.jpg"),fit:BoxFit.cover)),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Login ",
                    style: TextStyle(
                        color: Colors.indigo,
                      fontWeight:FontWeight.w800,
                        fontSize: 30,
                      letterSpacing: 3,
                    ),
                  ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: TextFormField(
                  //controller: UserName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(400)
                    ),
                    labelText: "User Name ",
                    hintText: "Please Enter your User Name",
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //controller: Password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200)
                    ),
                    labelText: "Password",
                    hintText: "Please Enter your Password",
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              MaterialButton(
                  minWidth: 200,
                  child: Text("Login"),
                  color: Colors.indigo,
                  onPressed:() {}
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Donot have an accont?"),
                    TextButton(onPressed:(){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context)=>SingUp()
                          )
                      );
                    }, child: Text("sign up")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]
      ),
    );
  }
}

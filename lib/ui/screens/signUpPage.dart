import 'package:flutter/material.dart';

import 'loginPage.dart';
class  SingUp extends StatelessWidget {
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
              decoration: BoxDecoration(image:DecorationImage(image:AssetImage("assets/images/bg.jpg"),fit:BoxFit.cover)),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0,left: 5,right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(400)
                              ),
                              labelText: "Frist Name ",
                              hintText: " Frist Name ",
                              suffixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(400)
                              ),
                              labelText: "Last Name ",
                              hintText: " Last Name ",
                              suffixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(400)
                        ),
                        labelText: "User Name ",
                        hintText: "Please Enter your User Name",
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(400)
                        ),
                        labelText: "Email ",
                        hintText: "Please Enter your Email",
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200)
                        ),
                        labelText: "Confirm Password",
                        hintText: "Please Enter your Password again",
                        suffixIcon:const Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                 const SizedBox(height: 16.0),
                  MaterialButton(
                      minWidth: 200,
                      color: Colors.indigo,
                      onPressed:() {},
                      child: Text("Sign up")
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("have an account?"),
                        TextButton(onPressed:(){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context)=>LoginApp()
                              )
                          );
                        }, child:const Text("Login")),
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

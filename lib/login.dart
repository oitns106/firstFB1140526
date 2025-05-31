import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email="";
  String password="";
  final FirebaseAuth auth1=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Login',),),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text('Login', style: TextStyle(fontSize: 36,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Email address:', style: TextStyle(fontSize: 20,)),
                      SizedBox(width: 20,),
                      SizedBox(width: 220,
                        child: TextField(
                          onChanged: (value1)=>email=value1,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(hintText: 'Your Email'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Password:      ', style: TextStyle(fontSize: 20,)),
                      SizedBox(width: 20,),
                      SizedBox(width: 220,
                        child: TextField(
                          onChanged: (value2)=>password=value2,
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Your Password'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child:Container(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final User=await auth1.signInWithEmailAndPassword(email: email, password: password);
                            if (User!=null) Navigator.pushNamed(context,'Service');
                          }
                          catch (e) {
                            print(e);
                          }
                        },
                        child: Text('Login', style: TextStyle(fontSize: 20,),),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

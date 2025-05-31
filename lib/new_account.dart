import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {

  String email="";
  String password="";
  final FirebaseAuth auth1=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('New Account',),),
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
                    child: Text('New User Account', style: TextStyle(fontSize: 36,
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
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final newUser=await auth1.createUserWithEmailAndPassword(email: email, password: password);
                            if (newUser!=null) Navigator.pushNamed(context,'Home');
                          }
                          catch (e) {
                            print(e);
                          }
                        },
                        child: Text('Create', style: TextStyle(fontSize: 20,),),),
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

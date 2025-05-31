import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {

  final FirebaseAuth auth1=FirebaseAuth.instance;
  final DatabaseReference ref=FirebaseDatabase.instance.ref("/users/123");

  sendData() async {
    await ref.set({
      'name': 'John',
      'age': 18,
      'address': {
        "line1": "100 Mountain View",
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Services'),
                       actions: [
                         IconButton(
                           onPressed: () {
                             auth1.signOut();
                             Navigator.pop(context);
                           },
                           icon: Icon(Icons.exit_to_app),
                         ),
                       ],
        ),
        body: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()  async {
                    sendData();
                    var snapshot=await ref.get();
                    if (snapshot!=null) {
                      dynamic values=snapshot.value;
                    }
                  },
                  child: Text('Save'),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: ()  async {
                    ref.update({'age': 21,});
                  },
                  child: Text('Update'),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: ()  async {
                    ref.remove();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

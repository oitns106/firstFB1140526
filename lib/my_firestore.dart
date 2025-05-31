import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String city;

  User({required this.name, required this.city});

  User.fromJson(Map<String, dynamic> json): this(name: json['name'] as String,
                                                 city: json['city'] as String);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
    };
  }
}

class MyCloud1 extends StatefulWidget {
  const MyCloud1({super.key});

  @override
  State<MyCloud1> createState() => _MyCloud1State();
}

class _MyCloud1State extends State<MyCloud1> {

  CollectionReference users=FirebaseFirestore.instance.collection('customers');

  List<Widget> dataList1(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((i)=>ListTile(title: Text(i['name']), subtitle: Text(i['city']),)).toList();
  }

  writeData() async {
    final userRef=users.withConverter(fromFirestore: (snapshot,_)=>User.fromJson(snapshot.data()!),
                                      toFirestore: (user,_)=>user.toJson());
    await userRef.doc('key1').set(User(name: 'Bob', city: 'Kaohsiung'));
  }

  @override
  Widget build(BuildContext context) {
    writeData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test my cloud firestore')),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: StreamBuilder(
                  stream: users.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    return ListView(
                      children: dataList1(snapshot),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

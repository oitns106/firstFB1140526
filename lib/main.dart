import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const hospital1());
}

class hospital1 extends StatefulWidget {
  const hospital1({super.key});

  @override
  State<hospital1> createState() => _hospital1State();
}

class _hospital1State extends State<hospital1> {

  String ms1='病人準備中';
  final DatabaseReference ref=FirebaseDatabase.instance.ref('patient/patient1');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: ElevatedButton(
              child: Text(ms1),
              onPressed: () async {
                if (ms1=='病人準備中') ms1='病人已進入手術室';
                else if (ms1=='病人已進入手術室') ms1='病人已開始手術';
                else if (ms1=='病人已開始手術') ms1='病人已結束手術進入恢復室';
                else if (ms1=='病人已結束手術進入恢復室') ms1='病人已回到病房';
                else if (ms1=='病人已回到病房') ms1='病人準備中';
                String cdate=DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                await ref.set(cdate+ms1);
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}












/*

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'new_account.dart';
import 'login.dart';
import 'service.dart';
import  'my_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      routes: {
        'Login': (context)=>Login(),
        'NewAccount': (context)=>NewAccount(),
        'Service': (context)=>Service(),
        'Home': (context)=>MyHomePage(),
        'FireStore': (context)=>MyCloud1(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Authentication'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: ()=>Navigator.pushNamed(context, 'NewAccount'),
              child: Text('New User Account', style: TextStyle(fontSize: 20, color: Colors.blue,)),),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: ()=>Navigator.pushNamed(context, 'Login'),
              child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.blue,)),),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: ()=>Navigator.pushNamed(context, 'FireStore'),
              child: Text('My Cloud FireStore', style: TextStyle(fontSize: 20, color: Colors.blue,)),),
          ],
        ),
      ),
    );
  }
}



 */
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';                       //請同學們自行產生firebase_options.dart
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

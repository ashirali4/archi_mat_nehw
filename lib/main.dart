import 'package:archi_mat/pages/tab.dart';
import 'package:archi_mat/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//  @override
// void initState() {
//   super.initState();
//   // WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
// }
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//       title: 'ArchiMAT',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home:
//           // TabPage(
//           //   index: 0,
//           // )
//           SplashScreen());
// }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ArchiMAT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // TabPage(
            //   index: 0,
            // )
            SplachPage());
  }
}

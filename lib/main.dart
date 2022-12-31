import 'package:dave_regform/regFormMobile.dart';
import 'package:dave_regform/registrationForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAuAzjn-ZqED4hbSHFoGwMPzkSzPSDcbPU",
          authDomain: "registration-form-f2a79.firebaseapp.com",
          projectId: "registration-form-f2a79",
          storageBucket: "registration-form-f2a79.appspot.com",
          messagingSenderId: "829141693424",
          appId: "1:829141693424:web:3288b921fc30a35e106335",
          measurementId: "G-CZHBR0NX6J"),
    );
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This contains the layout builder tells the app to load the desktop version of the app which is registrationForm.dart,
  // and then to load the regFormMobile if the screen size is smaller. This makes the app more responsive
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return registrationForm();
          } else {
            return regFormMobile();
          }
        },
      ),
    );
  }
}

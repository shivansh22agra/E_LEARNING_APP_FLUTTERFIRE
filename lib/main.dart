import 'package:e_leaning_app/screens/Home_Screen.dart';
import 'package:e_leaning_app/screens/Login_Screen.dart';
import 'package:e_leaning_app/screens/Splash_Screen.dart';
import 'package:e_leaning_app/services/notificationservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}
Future<void> backgroundHandler(RemoteMessage message) async {
  	print(message.data.toString());
 	print(message.notification!.title);
	}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false
      ,
   //   theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      initialRoute: Splash_Screen.id,
      routes: {
        Home_Page.id:(context) => Home_Page(),
        Splash_Screen.id: (context) => Splash_Screen(),
        Login_Screen.id: (context) => Login_Screen(),
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth1/auth/auth.dart';
import 'package:flutter_auth1/home.dart';
import 'package:flutter_auth1/pagesAuth/signIn.dart';
import 'package:flutter_auth1/slider.dart';
import 'package:flutter_auth1/theme.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkIfLogin();
    // checkLogin();
  }

  // void checkLogin() async {
  //   String? token = await authClass.getToken();
  //   if (token != null) {
  //     setState(() {
  //       currentPage = home();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: pageTransitionsTheme,
        primarySwatch: Colors.brown,
      ),
      // home: sliderHome(),
      home: isLogin == true ? home() : signin(),
    );
  }
}

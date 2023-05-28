// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth1/auth/auth.dart';
// import 'package:flutter_auth1/home.dart';
// import 'package:flutter_auth1/pagesAuth/signIn.dart';
// import 'package:slide_to_act/slide_to_act.dart';

// class sliderHome extends StatefulWidget {
//   const sliderHome({super.key});

//   @override
//   State<sliderHome> createState() => _sliderHomeState();
// }

// class _sliderHomeState extends State<sliderHome> {
//   AuthClass authClass = AuthClass();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   // Widget currentPage = signin();
//   bool isLogin = false;

//   checkIfLogin() async {
//     auth.authStateChanges().listen((User? user) {
//       if (user != null && mounted) {
//         setState(() {
//           isLogin = true;
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkIfLogin();
//     // checkLogin();
//   }

//   // void checkLogin() async {
//   //   String? token = await authClass.getToken();
//   //   if (token != null) {
//   //     setState(() {
//   //       currentPage = home();
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 158, 112, 95),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 4,
//               ),
//               ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                     Color.fromARGB(255, 158, 112, 95), BlendMode.hue),
//                 child: Center(
//                   child: Image(
//                     image: AssetImage('assets/appIcon.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 7,
//               ),
//               SlideAction(
//                 borderRadius: 15,
//                 elevation: 3,
//                 innerColor: Color.fromARGB(255, 91, 63, 53),
//                 outerColor: Color.fromARGB(255, 190, 140, 123),
//                 sliderButtonIcon: Icon(
//                   Icons.lock_open_outlined,
//                   color: Colors.white,
//                 ),
//                 sliderRotate: false,
//                 text: 'SLIDE TO OPEN',
//                 textStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//                 onSubmit: () {
//                   isLogin == true
//                       ? Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (builder) => home()),
//                           (route) => false)
//                       : Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (builder) => signin(),
//                           ),
//                           (route) => false,
//                         );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

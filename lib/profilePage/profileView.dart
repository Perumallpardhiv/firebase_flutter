import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_auth1/profilePage/profileEdit.dart';
import 'package:flutter_auth1/profilePage/textBtn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class profileView extends StatefulWidget {
  const profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  final user = FirebaseAuth.instance.currentUser;
  var name;
  var firstname;
  var lastname;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 112, 95),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid)
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading ...");
                  }
                  var details = snapshot.data;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color.fromARGB(255, 185, 131, 112),
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 0, bottom: 20, right: 20, left: 20),
                            child: Text(
                              "PROFILE",
                              style: TextStyle(
                                fontSize: 35,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(255, 185, 131, 112),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: '${details!['imageUrl']}' == ""
                              ? Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/fir-authentication-ab7c1.appspot.com/o/users%2Fprofile.jpg?alt=media&token=5daf7dda-6965-4b9e-a124-107994c11970',
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  '${details['imageUrl']}',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30.0),
                                Text(
                                  'USER NAME',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 33, 33, 33),
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.5),
                                Text(
                                  details['user name'],
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 133, 56, 29),
                                    letterSpacing: 2.0,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'DESCRIPTION',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 33, 33, 33),
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                SizedBox(height: 3.5),
                                Text(
                                  details['description'],
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 133, 56, 29),
                                    letterSpacing: 1.0,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 76, 76, 76),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      details['email'],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                        color: Color.fromARGB(255, 33, 33, 33),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone_in_talk,
                                      color: Color.fromARGB(255, 76, 76, 76),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '+91 ${details['phone number']}',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                        color: Color.fromARGB(255, 33, 33, 33),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_month,
                                      color: Color.fromARGB(255, 76, 76, 76),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "Joined On:",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        letterSpacing: 0.7,
                                        color: Color.fromARGB(255, 33, 33, 33),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      details['joinedAt'],
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        letterSpacing: 0.7,
                                        color: Color.fromARGB(255, 33, 33, 33),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        var url = details['linkDin'];
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw "Could not launch";
                                        }
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: Card(
                                          elevation: 7,
                                          color: Colors.brown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                              width: 1.5,
                                              color: Colors.brown,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              FontAwesomeIcons.linkedin,
                                              color: Color.fromARGB(
                                                  255, 84, 50, 38),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector( 
                                      onTap: () async {
                                        var url = details['github'];
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw "Could not launch";
                                        }
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: Card(
                                          elevation: 7,
                                          color: Colors.brown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                              width: 1.5,
                                              color: Colors.brown,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(FontAwesomeIcons.github,
                                                color: Color.fromARGB(
                                                    255, 84, 50, 38)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  profileEdit()),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: Card(
                                          elevation: 7,
                                          color: Colors.brown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                              width: 1.5,
                                              color: Colors.brown,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 84, 50, 38)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.brown;
    Path path = Path()
      ..relativeLineTo(0, 225)
      ..quadraticBezierTo(size.width / 2, 300, size.width, 225)
      ..relativeLineTo(0, -225)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

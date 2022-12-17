import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class information extends StatefulWidget {
  const information({super.key});

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 112, 95),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color.fromARGB(255, 87, 61, 51),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        child: Lottie.asset(
                          'assets/lottie2.json',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Text(
                        'Hope you like this app :)',
                        style: TextStyle(
                            color: Color.fromARGB(255, 128, 68, 47),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Designed and Developed by :- ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 102, 71, 60),
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Center(
                      child: Text(
                        'Perumall Pardhiv',
                        style: TextStyle(
                            color: Color.fromARGB(255, 67, 46, 39),
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Center(
                      child: Text(
                        'Contact with me on :- ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 94, 69, 60),
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          size: 40,
                          color: Color.fromARGB(255, 94, 69, 60),
                        ),
                        Icon(
                          FontAwesomeIcons.linkedin,
                          size: 40,
                          color: Color.fromARGB(255, 94, 69, 60),
                        ),
                        Icon(
                          FontAwesomeIcons.github,
                          size: 40,
                          color: Color.fromARGB(255, 94, 69, 60),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Center(
                      child: Text(
                        'Report!, if you find anything fishy ;)',
                        style: TextStyle(
                            color: Color.fromARGB(255, 82, 59, 51),
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final dynamic icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      backgroundColor: Color.fromARGB(255, 205, 151, 132),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 104, 71, 59),
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(color: Color.fromARGB(255, 104, 71, 59)),)),
            Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 104, 71, 59),),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class profileEdit extends StatefulWidget {
  const profileEdit({super.key});

  @override
  State<profileEdit> createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
  // TextEditingController _firstNameCont = TextEditingController();
  // TextEditingController _lastNameCont = TextEditingController();
  // TextEditingController _phoneNumCont = TextEditingController();
  // TextEditingController _descCont = TextEditingController();
  String userName = "";
  String descr = "";
  var phoneNum = "";
  final user = FirebaseAuth.instance.currentUser;
  bool showPassword = false;
  String imageUrl = "";
  String github = "";
  String linkDin = "";

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
                padding: EdgeInsets.only(top: 30, left: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color.fromARGB(255, 118, 74, 58),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 20, right: 16),
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
                    imageUrl = imageUrl == "" ? details!['imageUrl'] : imageUrl;
                    github = github == "" ? details!['github'] : github;
                    linkDin = linkDin == "" ? details!['linkDin'] : linkDin;
                    userName =
                        userName == "" ? details!['user name'] : userName;
                    descr = descr == "" ? details!['description'] : descr;
                    phoneNum = phoneNum == ""
                        ? details!['phone number'].toString()
                        : phoneNum;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "EDIT PROFILE",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Color.fromARGB(255, 71, 47, 38),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: '${imageUrl}' == ""
                                      ? '${details!['imageUrl']}' == ""
                                          ? Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/fir-authentication-ab7c1.appspot.com/o/users%2Fprofile.jpg?alt=media&token=5daf7dda-6965-4b9e-a124-107994c11970',
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              '${details['imageUrl']}')
                                      : Image.network(
                                          '${imageUrl}',
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker.pickImage(
                                        source: ImageSource.gallery);
                                    // print('${file!.path}');

                                    if (file == null) return;

                                    if (details!['imageUrl'] == "") {
                                      // created path for storing a image
                                      Reference referenceRoot =
                                          FirebaseStorage.instance.ref();
                                      Reference referenceDirImages =
                                          referenceRoot.child('users');
                                      Reference referenceImageToUpload =
                                          referenceDirImages.child(
                                              DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString());
                                      try {
                                        // storing image
                                        await referenceImageToUpload
                                            .putFile(File(file.path));
                                        imageUrl = await referenceImageToUpload
                                            .getDownloadURL();
                                        setState(() {});
                                      } catch (e) {
                                        print(e);
                                      }
                                    } else {
                                      // selecting the path to update the image
                                      Reference referenceImageToUpload =
                                          FirebaseStorage.instance
                                              .refFromURL(details['imageUrl']);
                                      try {
                                        // storing image
                                        await referenceImageToUpload
                                            .putFile(File(file.path));
                                        imageUrl = await referenceImageToUpload
                                            .getDownloadURL();
                                        setState(() {});
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color:
                                            Color.fromARGB(255, 155, 110, 93),
                                      ),
                                      color: Colors.brown,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 155, 110, 93),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                initialValue: details!['user name'],
                                // controller: _firstNameCont,
                                onChanged: ((value) {
                                  setState(
                                    () {
                                      userName = value;
                                    },
                                  );
                                }),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: "User Name",
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                initialValue: details['description'],
                                // controller: _descCont,
                                onChanged: ((value) {
                                  setState(() {
                                    descr = value;
                                  });
                                }),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                initialValue:
                                    details['phone number'].toString(),
                                // controller: _phoneNumCont,
                                onChanged: ((value) {
                                  setState(() {
                                    phoneNum = value;
                                  });
                                }),
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: "Phone Number",
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                initialValue: details['github'],
                                // controller: _descCont,
                                onChanged: ((value) {
                                  setState(() {
                                    github = value;
                                  });
                                }),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: "Github Link",
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                initialValue: details['linkDin'],
                                // controller: _descCont,
                                onChanged: ((value) {
                                  setState(() {
                                    linkDin = value;
                                  });
                                }),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: "LinkDin Link",
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: Text("CANCEL",
                                  style: TextStyle(
                                      fontSize: 11,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(user!.uid)
                                      .update(
                                    {
                                      'imageUrl': imageUrl,
                                      'user name': userName.trim(),
                                      'phone number': int.parse(phoneNum),
                                      'description': descr.trim(),
                                      'github': github.trim(),
                                      'linkDin': linkDin.trim(),
                                    },
                                  );
                                  Navigator.pop(context);
                                } catch (e) {
                                  print(e);
                                }
                              },
                              color: Colors.brown,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "UPDATE",
                                style: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

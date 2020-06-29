import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp98/Chat_screen.dart';

class Dialog1 extends StatelessWidget {
  String username;

  Dialog1({this.username});

  Future<void> _signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      await Firestore.instance
          .collection("Username")
          .document("username")
          .setData({'username': username});
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        color: Color(0xFFC4C4C4),
        width: 400,
        height: 200,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
              width: 400,
              height: 30,
              color: Color(0xFF0B4A84),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(' Confirm',
                      style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ))),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    color: Color(0xFFC4C4C4),
                    width: 20,
                    height: 20,
                    child: FlatButton(
                      padding: EdgeInsets.only(bottom: 2),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('x'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: Image.asset('images/confirm.png')),
                SizedBox(
                  width: 30,
                ),
                Container(
                    width: 150,
                    height: 50,
                    child: Text(
                      'Do you want to go with this username? \n $username',
                      style: GoogleFonts.didactGothic(),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 80,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'EDIT',
                      style: GoogleFonts.didactGothic(),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 80,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      _signInAnonymously();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Chats();
                      }));
                    },
                    child: Text(
                      'OK',
                      style: GoogleFonts.didactGothic(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
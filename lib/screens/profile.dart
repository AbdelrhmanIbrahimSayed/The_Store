import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:the_store/components/custom_button.dart';
import 'package:the_store/screens/login.dart';


class ProfileScreen extends StatefulWidget {
  final String username;
  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loadingButton = false;

  void signOutButtonPressed(){
    setState(() {
      _loadingButton=true;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    Fluttertoast.showToast(
        msg: "Signed Out",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Hi ${widget.username}",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          CustomButton(text: "Sign Out", onPress: signOutButtonPressed,loading: _loadingButton,),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:the_store/firebase_options.dart';
import 'package:the_store/screens/login.dart';
import 'package:the_store/utils/custom_theme.dart';


void main() async{
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  final String response =await rootBundle.loadString("assets/config/stripe.json");
  final data =await json.decode(response);
  Stripe.publishableKey=data["publishableKey"];

  runApp(

       MaterialApp(theme: CustomTheme.getTheme(),home: LoginScreen(),)

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:3,
        child: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("EL-Store"),
            ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
              boxShadow: CustomTheme.cardShadow
            ),
            child: const TabBar(
                padding: EdgeInsets.symmetric(vertical: 10),
                indicatorColor: Colors.transparent,
                tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.shopping_cart)),
            ]),
          ),
          body: const TabBarView(
            children: [
              //HomeScreen(),
          //    ProfileScreen(),
            //  CheckOutScreen(),
            ],
          ),
        ),
      );
  }
}

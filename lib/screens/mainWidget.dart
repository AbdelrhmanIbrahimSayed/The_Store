

import 'package:flutter/material.dart';
import 'package:the_store/screens/checkout.dart';
import 'package:the_store/screens/home.dart';

import 'package:the_store/screens/profile.dart';

import 'package:the_store/utils/custom_theme.dart';

class MainWidgetScreen extends StatelessWidget {
  final String username;
  const MainWidgetScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(),
        home:  DefaultTabController(
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
        body:  TabBarView(
          children: [
            HomeScreen(username: username,),
            ProfileScreen(username: username),
            CheckOutScreen(username: username,),
          ],
        ),
      ),
    )
    );

  }
}

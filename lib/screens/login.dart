

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_store/components/custom_button.dart';
import 'package:the_store/components/custom_text_input.dart';
import 'package:the_store/models/database.dart';
import 'package:the_store/models/userData.dart';
import 'package:the_store/screens/mainWidget.dart';
import 'package:the_store/utils/custom_theme.dart';
import 'package:the_store/utils/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  bool _loadingButton=false;

  sqflDB db=sqflDB();
  UsersData user=UsersData();
  List<Map> userData=[];

  void initState() {
    // TODO: implement initState
    userData=[];
    saveData();
    super.initState();
  }

  saveData()async{
   // user.setData();
    List<Map> response=await db.select("SELECT * FROM users");
    print("$response");
    setState(() {

      userData.addAll(response);
    });
    print("userData1 ${userData}");
  }


  Map<String,String> data ={};

  _LoginScreenState(){
    data=LoginData.signIn;
  }

  void switchLogin(){
    setState(() {
      if(mapEquals(data, LoginData.signUp)){
        data=LoginData.signIn;
      }else{
        data=LoginData.signUp;
      }
    });
  }


  loginError(){


  }
  void showToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  void loginButtonPressed(){
    //saveData();
    // setState(() {
    //   _loadingButton = true;
    //   // ApplicationState applicationState = Provider.of<ApplicationState>(context, listen: false);
    //   // if(mapEquals(data, LoginData.signUp)){
    //   //   applicationState.signUp(_emailController.text, _passwordController.text, loginError);
    //   // }else{
    //   //   applicationState.signIn(_emailController.text, _passwordController.text, loginError);
    //   // }
    // });
    bool emailAndPassword=false;
    if(mapEquals(data, LoginData.signIn)){
      for(int i=0;i<userData.length;i++){
        print(userData[i]);
        if(userData[i]['email']==_emailController.text &&userData[i]['password']==_passwordController.text){
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainWidgetScreen(username:userData[i]['email'] ,), ) );
          emailAndPassword=true;
          break;
        }
      }
      if(!emailAndPassword) {
        showToast('Username or password wrong');
      }
    }else{
      setState(() {
        user.insertData(_emailController.text, _passwordController.text);
        data=LoginData.signIn;
        userData=[];
        saveData();
        print("userDataUP ${userData}");
        showToast('Email and Password Added Please SignIn');
      });

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      data["heading"] as String ,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Text(data["SubHeading"] as String,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            model(data, _emailController, _passwordController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: switchLogin,
                    child: Text(
                      data["footer"] as String,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  model(Map<String, String> data, TextEditingController emailController, TextEditingController passwordController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20,left: 20,top: 30,bottom: 56),
      decoration: CustomTheme.getCardDecoration(),
      child: Column(
        children: [
          CustomTextInput(label: "Your UserName",
              placeholder: "Enter your UserName",
              icon: Icons.person_outline,
              textEditingController: _emailController),
          CustomTextInput(label: "Password",
              placeholder: "password",
              icon: Icons.lock_outline,
              password: true,
              textEditingController: _passwordController),
          CustomButton(text: data["label"] as String, onPress: loginButtonPressed, loading: _loadingButton,)
        ],
      ),
    );
  }
}



import 'package:the_store/models/database.dart';

class UsersData{
  sqflDB db =sqflDB();

  setData() async {


    int response =  await db.insert(
        "INSERT INTO users (email,password) VALUES ('abdo@gmail.com','123456') ");
    // await db.insert(
    //     "INSERT INTO habits (title,img) VALUES ('Personal development','images/png 2.png') ");
    // await db.insert(
    //     "INSERT INTO habits (title,img) VALUES ('Diet','images/png 1.png') ");

    print("$response");
  }
  insertData(String email,String password) async {


    int response =  await db.insert(
        "INSERT INTO users (email,password) VALUES ('$email','$password') ");

    print("$response");
  }


// updateData() async {
//   // int response =
//   //     await db.update("UPDATE habits SET title='Simple' WHERE id=26 ");
//   await db.update(
//       "UPDATE habits SET title='Islamic', img='images/islamic.jpg' WHERE id=27 ");
//   await db.update(
//       "UPDATE habits SET title='personal development', img='images/develop.jpg' WHERE id=28 ");
//   await db.update(
//       "UPDATE habits SET title='Diet', img='images/diet.jpg' WHERE id=29 ");
//   // print("$response");
// }
//
// deleteDate() async {
//   // await db.delete("DELETE FROM habits WHERE id=15");
//
//   await db.delete("DELETE FROM habits WHERE id=16");
//   // await db.delete("DELETE FROM habits WHERE id=4");
//   // await db.delete("DELETE FROM habits WHERE id=9");
// }
}
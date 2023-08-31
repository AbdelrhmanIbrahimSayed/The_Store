import 'package:flutter/material.dart';
import 'package:the_store/components/grid_card.dart';
import 'package:the_store/models/database.dart';
import 'package:the_store/models/product_data.dart';
import 'package:the_store/screens/login.dart';
import 'package:the_store/screens/product.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> data =[];
  sqflDB db=sqflDB();
  ProductsData product=ProductsData();


  void initState() {
    // TODO: implement initState
       saveData();
    super.initState();
  }

  saveData()async{
   // product.setData();
    List<Map> response=await db.select("SELECT * FROM products");
    print("$response");
    setState(() {

      data.addAll(response);
    });
    print("userData1 ${data}");
  }
  @override
  Widget build(BuildContext context) {

    // onCardPress(){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
    // }
    return Container(
      child: GridView.builder(
          itemCount: data.length,
          padding: EdgeInsets.symmetric(vertical: 30),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
      ,mainAxisSpacing: 30,crossAxisSpacing: 30),
          itemBuilder: (BuildContext context,int index){
        return GridCard(index: index,imageUrl: data[index]['imageUrl'],title: data[index]['title'],price:data[index]['price'] ,description:data[index]['description'] ,username: widget.username,);
          }),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:the_store/components/custom_button.dart';
import 'package:the_store/components/list_card.dart';
import 'package:the_store/models/database.dart';
import 'package:the_store/utils/custom_theme.dart';

class CheckOutScreen extends StatefulWidget {
  final String username;
  const CheckOutScreen({super.key, required this.username});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<Map> carts =[];
  double totalPrice=0;
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 30),
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return ListCard(imageUrl: carts[index]["imageUrl"],price: carts[index]["price"],title:carts[index]["title"] ,);
            },
        ),
        priceFooter(),
        Container(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: CustomButton(text: "CheckOut",
            onPress: () {},
            loading: false,
          ),
        )
      ],
    )
    );
  }
  priceFooter(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(

        height: 2,
      color:CustomTheme.grey,
      thickness: 2,
    ),
          Padding(padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text("Total: ", style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                Text("$totalPrice\$", style: Theme.of(context).textTheme.headlineSmall)
              ],
            ),
          )
      ],
    ),
    );

  }
  getData() async {
   sqflDB db =sqflDB();
   List<Map> response =await db.select("SELECT * FROM check_out WHERE username='${widget.username}'");
   setState(() {
     carts.addAll(response);
   });
   for(int i=0;i<carts.length;i++){
     String val=carts[i]["price"];
     totalPrice+=double.parse(val);
   }


 }
}

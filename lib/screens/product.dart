import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_store/components/custom_button.dart';
import 'package:the_store/models/database.dart';
import 'package:the_store/utils/custom_theme.dart';

class ProductScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final String username;
  const ProductScreen({super.key, required this.imageUrl, required this.title, required this.price, required this.description, required this.username});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}


class _ProductScreenState extends State<ProductScreen> {
  bool addButtonload = false;

  void onAddToCart() async {
    setState(() {
      addButtonload = true;
    });
    insertData(widget.imageUrl,widget.title,widget.price,widget.username);
    print(widget.username);
    // Add to cart
    setState(() {
      addButtonload = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          fit:BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 35,
                          right: 35,
                          child: Container(
                            decoration: const ShapeDecoration(
                                color: CustomTheme.yellow,
                                shape: CircleBorder(),
                                shadows: [BoxShadow(color: Colors.black54,blurRadius: 3,offset: Offset(1,3))]
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.share),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 22),
                            child: Text("Title : ${widget.title}"),
                          ),
                          Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                Text("Price : ${widget.price}\$")
                              ],
                            ),
                          ),
                          CustomButton(text: "Add to Cart", onPress: onAddToCart,loading: addButtonload,),
                          Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "About the item",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(bottom: 20),
                            child: Text(widget.description,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 35,
                left: 30,
                child: Container(
                  decoration: const BoxDecoration(
                      color: CustomTheme.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 3,offset: Offset(1,3))]
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
  insertData(String imageUrl,String title,String price,String username) async {

    sqflDB db =sqflDB();
    int response =  await db.insert(
        "INSERT INTO check_out (imageUrl,title,price,username) VALUES ('$imageUrl','$title','$price','$username') ");
    Fluttertoast.showToast(
        msg: 'Product Added To Cart',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print("$response");
  }
}

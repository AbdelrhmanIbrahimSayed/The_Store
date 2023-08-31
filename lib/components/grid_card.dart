import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_store/screens/product.dart';
import 'package:the_store/utils/custom_theme.dart';

class GridCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final String username;

  const GridCard({super.key,required this.index, required this.imageUrl, required this.title, required this.price, required this.description, required this.username});



  @override
  Widget build(BuildContext context) {
    onCardPress(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(title: title,imageUrl: imageUrl,description: description,price: price,username: username,)));
    }


    return Container(
      margin: index % 2==0 ?const EdgeInsets.only(left: 22):const EdgeInsets.only(right: 22),
    decoration: CustomTheme.getCardDecoration(),
      child: GestureDetector(
        onTap:  onCardPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                      imageUrl: imageUrl, fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                           title,style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text('price : $price\$',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    )
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

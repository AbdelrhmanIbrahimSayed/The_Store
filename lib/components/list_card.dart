import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/custom_theme.dart';

class ListCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const ListCard({super.key, required this.imageUrl, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
      decoration:  CustomTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                  child:SizedBox(
                    height: double.infinity,
                    child: CachedNetworkImage(
                        imageUrl: imageUrl,
                      fit:BoxFit.cover,
                    ),
                  )
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Title : $title',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Price : $price\$",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

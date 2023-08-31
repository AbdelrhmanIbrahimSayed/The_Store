

import 'package:the_store/models/database.dart';

class ProductsData {
  sqflDB db = sqflDB();

  setData() async {
    int response =
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://hips.hearstapps.com/hmg-prod/images/730690-jaadi-8490-b-v2-2-1674579824.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*','jewelery','900','Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentines Day...') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1597248881519-db089d3744a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80','Yellow shoes','9','95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80','Coffee','29','100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1618329340733-ab4554d28b15?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=903&q=80','Yellow shoes','695','From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the oceans pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1618860202521-71e9f4bdcfaa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=967&q=80','Red shoe','114','From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the oceans pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=631&q=80','Headset','109','3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=623&q=80','Pen','56','it is a pen') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80','watch','7','100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort') ");
    await db.insert(
        "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHByb2R1Y3R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60','Cycle','168','Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.') ");
    // await db.insert(
    //     "INSERT INTO products (imageUrl,title,price,description) VALUES ('https://images.unsplash.com/photo-1616740540792-3daec604777d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80','Water bottle','22','Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.') ");




    // await db.insert(
    //     "INSERT INTO habits (title,img) VALUES ('Personal development','images/png 2.png') ");
    // await db.insert(
    //     "INSERT INTO habits (title,img) VALUES ('Diet','images/png 1.png') ");

    print("$response");
  }

  insertData(String email, String password) async {
    int response = await db.insert(
        "INSERT INTO users (email,password) VALUES ('$email','$password') ");

    print("$response");
  }
}


import 'package:flutter/material.dart';
import 'package:grochery_shop_ui/cart_model.dart';
import 'package:grochery_shop_ui/cart_page.dart';
import 'package:grochery_shop_ui/item_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
      },child: Icon(Icons.shopping_bag_sharp,size: 30,),backgroundColor: Colors.pinkAccent.shade200,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Greenmart",
                      style: TextStyle(
                          color: Colors.green.shade900,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.person_outline,
                  size: 35,
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Let's order fresh food for you",
              style: TextStyle(fontSize: 40, fontFamily: "Times New Roman"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Fresh item available",
              style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
            ),
          ),

          Expanded(
              child: Consumer<CartModel> (builder: (context, value, child){
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.18),
                    itemBuilder: (context, index) {
                      return ItemList(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        itemIcon: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: (){
                          Provider.of<CartModel>(context,listen: false)
                              .addItemToCart(index);
                        },
                      );
                    });
              },)
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:grochery_shop_ui/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                )),
            title: Text(
              "Your Cart",
              style: TextStyle(fontSize: 23),
            ),
          ),
          body: Consumer<CartModel>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.CartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                decoration: BoxDecoration(
                                    color: value.CartItems[index][3],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          child: Image.asset(
                                              value.CartItems[index][2]),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              value.CartItems[index][0],
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      "Times New Roman"),
                                            ),
                                            Text(
                                              '\$' + value.CartItems[index][1],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey.shade700),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Provider.of<CartModel>(context,
                                                  listen: false)
                                              .removeItem(index);
                                        },
                                        icon: Icon(Icons.cancel_outlined))
                                  ],
                                )),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade700),
                              ),
                              Text(
                                '\$' + value.CalculateTotal(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                final snackbar=SnackBar(content: value.CalculateTotal()==null? Text("Please select items!",style: TextStyle(fontSize: 20)) : Text("Your payment is completed!",style: TextStyle(fontSize: 20),),
                                duration: Duration(seconds: 5),
                                  backgroundColor: Colors.green.shade200,
                                  action: SnackBarAction(label: "ok",  onPressed: (){}),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              },
                              child: Text(
                                "Pay now",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade200),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}

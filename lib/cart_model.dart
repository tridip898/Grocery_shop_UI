import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List cart = [
    //itemName, itemPrice, itemImage, color
    ["Olive Oil", "200", "lib/icons/oil.png", Colors.yellow.shade200],
    ["Rice", "100", "lib/icons/rice.png", Colors.cyan.shade100],
    ["Potato", "80", "lib/icons/potato.png", Colors.orange.shade100],
    ["Milk", "300", "lib/icons/milk.png", Colors.greenAccent.shade200],
    ["Sugar", "150", "lib/icons/sugar.png", Colors.red.shade100],
    ["Chicken", "250", "lib/icons/chicken.png", Colors.brown.shade200],
    ["Water", "50", "lib/icons/water.png", Colors.blue.shade100],
    ["Bread", "70", "lib/icons/white-bread.png", Colors.blueGrey.shade200],
  ];

  List _cartItems = [
  ];

  get shopItems => cart;
  get CartItems => _cartItems;

  //add item to cart
  void addItemToCart(int index) {
    _cartItems.add(cart[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String CalculateTotal(){
    double totalPrice=0;
    for(int i=0; i< _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}

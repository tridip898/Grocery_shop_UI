import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemIcon;
  final color;
  void Function()? onPressed;
  ItemList(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.itemIcon,
      this.color,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(itemIcon)),
              ),
            ),

            Text(
              itemName,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: onPressed,
                  child: Text('\$' + itemPrice,style: TextStyle(fontSize: 22,color: Colors.grey.shade200),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))),
                  color: Colors.redAccent.shade200,
                ),
                Container(
                  child: Icon(Icons.add,size: 40,),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

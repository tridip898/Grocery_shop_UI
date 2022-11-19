import 'package:flutter/material.dart';
import 'package:grochery_shop_ui/homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/icons/grocery-cart.png"),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "We deliver grocery to your doorstrap",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
              child: Text(
                "You can order your essential daily needed product when you need.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Times New Roman",
                    color: Colors.grey.shade800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 22, color: Colors.grey.shade200),
              ),
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}

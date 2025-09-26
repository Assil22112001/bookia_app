import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get products => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 99,
        leading: Image.asset("assets/images/logob.png"),

        actions: [Icon(Icons.search_sharp)],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Container(
              child: Image.asset("assets/images/Rectangle 13.png"),
            ),
          ),
          SizedBox(height: 14),
          Image.asset("assets/images/Group 2914.png"),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text("Best Seller", style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}

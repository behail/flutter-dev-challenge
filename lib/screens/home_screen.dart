import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hi, it's Behailu",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            Text(
              'Please navigate to the answers using the bottom navigation bar',
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plugin/screens/map_screen.dart';
class CarSelectionScreen extends StatelessWidget {
  final List<String> carList;

  const CarSelectionScreen({Key? key, required this.carList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), // Replace with your image path
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Car list with styling
          ListView.builder(
            itemCount: carList.length,
            itemBuilder: (context, index) {
              final car = carList[index];
              return ListTile(
                title: Text(
                  car,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange, // Or any color you prefer
                  ),
                ),
                tileColor: Colors.black12, // Add a subtle background color
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

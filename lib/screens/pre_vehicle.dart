import 'package:flutter/material.dart';
import 'package:plugin/screens/map_screen.dart';

class PreVehicle extends StatefulWidget {
  @override
  _PreVehicleState createState() => _PreVehicleState();
}

class _PreVehicleState extends State<PreVehicle> {
  // Sample car list for tiles
  final List<String> carList = ["Tata Nexon EV","Tata Tigor EV","Tata Nexon EV Max","MG Comet",
"MS ZS EV 2022",
"MG ZS EV",
"Hyundai IONIQ 5",
"Hyundai Kona Electric",
"Jaguar I-Pace",
"Audi E-Tron GT",
"BYD E6",
"Mercedes-Benz EQC",
"BMW iX",
"Audi E-Tron",
"Tata Xpres-T EV",
"Tata Tiago EV LR",
"Tata Tiago EV ",
"Nexon EV 2023 MR",
"Nexon EV 2023 LR",
"Tata ACE EV",
"Tata Punch EV ",
"Mahindra e2oPlus",
"Mahindra e-Verito",
"Mahindra XUV400 ","Mercedes EQS","EQB","EQE","AMG EQS","I-Pace","Mini Cooper SE","BMW i4","iX xDrive40"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40.0, // Adjust as needed
            left: 10.0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_2.png'), // Replace with your image path
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Text section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Left align text
              children: [
                Text(
                  'Personalize your experience by adding your vehicle:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0), // Adjust spacing as needed
                Text(
                  'Your vehicle is used to determine the appropriate charger!!!\n',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Buttons section positioned at bottom
          Positioned(
            bottom: 30.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToCarSelection(context),
                  child: Text('Add Vehicle',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF78C2C6),
                    minimumSize: Size(double.infinity, 50), // Adjust width and height
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                  }, // Replace with your action for "Remind Me Later" button
                  child: Text('Remind Me Later',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w300),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCarSelection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CarSelectionScreen(carList: carList)),
    );
  }
}


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
          // Back button (not in app bar)
          Positioned(
            top: 40.0, // Adjust as needed
            left: 10.0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          // Car list with spacing and padding
          Positioned.fill( // Use Positioned.fill to ensure full-screen list
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50), // Horizontal padding
              child: ListView.builder(
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  final car = carList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0), // Space between cars
                    child: ListTile(
                      title: Text(
                        car,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Or any color you prefer
                        ),
                      ),
                      tileColor: Colors.black12, // Subtle background color
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MapScreen()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}



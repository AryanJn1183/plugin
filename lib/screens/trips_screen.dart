import 'package:flutter/material.dart';

class StaticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ImageIcon(
              AssetImage('assets/icons/location_logo.png'),
              size: 24.0,
              color: Colors.black,
            ),
            SizedBox(width: 8.0),
            Text('Your Location'),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xFFA25151),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Destination',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(onPressed: () {}, icon: Icon(Icons.star_border,size: 26,color: Colors.yellow,), label: Text('Pondicherry',style: TextStyle(color: Colors.white,fontSize: 20),),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(onPressed: () {}, icon: Icon(Icons.star_border,size: 26,color: Colors.yellow,), label: Text('Vijaywada',style: TextStyle(color: Colors.white,fontSize: 20),),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(onPressed: () {}, icon: Icon(Icons.star,size: 26,color: Colors.yellow,), label: Text('Bengaluru',style: TextStyle(color: Colors.white,fontSize: 20),),)
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Start Your Trip',style: TextStyle(color: Colors.white,fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA25151),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


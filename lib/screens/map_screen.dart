import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _showSearchScreen = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _showSearchScreen
            ? null
            : Image.asset(
                'assets/images/logo.png',
                alignment: Alignment.topLeft,
                height: 40,
                width: 204,
              ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _showSearchScreen = true;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(21.146633, 79.088860),
              initialZoom: 6.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                   'https://api.mapbox.com/styles/v1/aryanjn-118/clu4jtpv900t001qseh2m6uko/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXJ5YW5qbi0xMTgiLCJhIjoiY2x1NGFjYWEwMTlvdzJqczNtZjUzcWpqZSJ9.xyuhA5htEsdG6Z17W2MlMQ',
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiYXJ5YW5qbi0xMTgiLCJhIjoiY2x1NGFjYWEwMTlvdzJqczNtZjUzcWpqZSJ9.xyuhA5htEsdG6Z17W2MlMQ',
                  'id': 'mapbox.mapbox-streets-v8',
                },
              ),
            ],
          ),
          if (_showSearchScreen)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showSearchScreen = false;
                });
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for a location',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get user's current location
                      },
                      child: Text('Get Current Location'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              icon: Image.asset('assets/icons/map_logo.png',height: 62,width: 40,),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 10,),
            IconButton(
              icon: Image.asset('assets/icons/trip_logo.png',height: 62,width: 40,),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });

              },
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 10,),
            IconButton(
              icon: Image.asset('assets/icons/wallet_logo.png',height: 62,width: 40,),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 10,),
            IconButton(
              icon: Image.asset('assets/icons/profile_logo.png',height: 62,width: 40,),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

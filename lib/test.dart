import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Title displayed in the app bar
            title: Text('SliverAppBar Example'),

            // Floating app bar will disappear upon scrolling down
            floating: true,

            // App bar will stick on the top
            pinned: true,

            // Background color of the app bar
            backgroundColor: Colors.blue,

            // Additional height for the app bar when it is collapsed
            expandedHeight: 200.0,


            flexibleSpace: FlexibleSpaceBar(
              // Title displayed when the app bar is expanded
              title: Text('Welcome to Flutter'),

              // Background image for the app bar
              background: Image.network(
                'https://via.placeholder.com/350x150',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // You can add more SliverList, SliverGrid, or other Sliver widgets here
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'data',
                  style: TextStyle(color: Colors.amber),
                ),
                // Add more widgets here if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
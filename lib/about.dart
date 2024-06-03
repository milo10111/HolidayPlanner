import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: const Column(
        children: [
          Text(
            "Holiday Planner App",
            style: TextStyle(fontSize: 30),
          ),
          Divider(),
         Wrap(
          
          spacing: 5,
          children: [ Text("Authors:"), Text("Kacper Ochnik"), Text("Miłosz Grzywacz"), Text("Paweł Zientara")],
         )
        ],
      ),
    );
  }
}

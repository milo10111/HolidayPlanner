import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        // REVIEW: this data should be stored in a separate file, not hardcoded
      ),
      body: const Column(
        children: [
          Text(
            "Holiday Planner App",
            // REVIEW: this data should be stored in a separate file, not hardcoded
            style: TextStyle(fontSize: 30),
          ),
          Divider(),
         Wrap(
          
          spacing: 5,
          children: [ Text("Authors:"), Text("Kacper Ochnik"), Text("Miłosz Grzywacz"), Text("Paweł Zientara")],
          // REVIEW: this data should be stored in a separate file, not hardcoded
         )
        ],
      ),
    );
  }
}

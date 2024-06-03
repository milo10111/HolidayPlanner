import 'package:flutter/material.dart';
import 'package:holiday_planner/about.dart';

class Account extends StatelessWidget {
  const Account({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ListTile(
              title: Text(
                "Name",
                textAlign: TextAlign.center,

              ),
              
              subtitle: Text("email@default.com",
               textAlign: TextAlign.center,),
            ),
            const ListTile(
              title: Text("Settings",
              textAlign: TextAlign.center,),
            ),
            ListTile(
              title: const Text("About",
              textAlign: TextAlign.center,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const About();
                },));
              },
            ),
            const ListTile(
              title: Text("Logout",
              textAlign: TextAlign.center,),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('My account'),
        ));
  }
}

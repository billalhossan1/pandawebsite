
import 'package:flutter/material.dart';
import 'package:pandawebsite/screens/nav_screen.dart';

void main(){
  runApp(const PandaWebsite(
  ));
}

class PandaWebsite extends StatelessWidget {
  const PandaWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavScreen(),
    );
  }
}


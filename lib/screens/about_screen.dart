import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/panda.jpg', // Ensure this image is in assets folder
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome to Panda World!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We are dedicated to spreading awareness and knowledge about pandas. Join us in protecting and celebrating these wonderful creatures!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Learn More"),
            ),
          ],
        ),
      ),
    );
  }
}

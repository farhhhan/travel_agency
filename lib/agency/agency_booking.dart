import 'package:flutter/material.dart';

class AgencyBookingScreen extends StatefulWidget {
  const AgencyBookingScreen({super.key});

  @override
  State<AgencyBookingScreen> createState() => _AgencyBookingScreenState();
}

class _AgencyBookingScreenState extends State<AgencyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Booking Screen show here'),
          ),
        ],
      ),
    );
  }
}
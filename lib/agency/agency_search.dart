import 'package:flutter/material.dart';

class AgencySearchScreen extends StatefulWidget {
  const AgencySearchScreen({super.key});

  @override
  State<AgencySearchScreen> createState() => _AgencySearchScreenState();
}

class _AgencySearchScreenState extends State<AgencySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Searching Screen show here'),
          ),
        ],
      ),
    );
  }
}
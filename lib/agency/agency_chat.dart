import 'package:flutter/material.dart';

class AgencyChatScreen extends StatefulWidget {
  const AgencyChatScreen({super.key});

  @override
  State<AgencyChatScreen> createState() => _AgencyChatScreenState();
}

class _AgencyChatScreenState extends State<AgencyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Chat Screen show here'),
          ),
        ],
      ),
    );
  }
}
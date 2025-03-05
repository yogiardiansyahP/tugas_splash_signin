import 'package:flutter/material.dart';
import 'package:tugas_malam/chat/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Need Chat'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          CallsScreen(),
          CameraScreen(),
          ChatsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/call.png")),
        label: 'Calls',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/camera.png")),
        label: 'Camera',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/chat.png")),
        label: 'Chats',
      ),

        ],
      ),
    );
  }
}

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Calls Screen'),
    );
  }
}

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Camera Screen'),
    );
  }
}


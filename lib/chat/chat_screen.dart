import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: const Color.fromARGB(255, 9, 220, 216),
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 9, 220, 216),
              child: Text(
                "${index + 1}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text("User $index"),
            subtitle: Text("Pesan terakhir dari User $index..."),
            trailing: Text(
              "12:3${index} PM", // Waktu pesan
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(userName: "User $index"),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 18, 170, 197),
        onPressed: () {
          // Tambah chat baru
        },
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String userName;

  const ChatDetailScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        backgroundColor: const Color.fromARGB(255, 9, 220, 216),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                bool isMe = index % 2 == 0;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Color.fromARGB(255, 18, 170, 197) : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isMe ? "Halo! Ini pesan dari saya." : "Halo! Ini pesan dari $userName.",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: const Color.fromARGB(255, 9, 220, 216),
                  onPressed: () {
                    // Kirim pesan
                  },
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

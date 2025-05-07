import 'package:flutter/material.dart';

class ChatMessage {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final bool isOnline;

  ChatMessage({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.isOnline = false,
  });
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatMessage> chats = [
      ChatMessage(
        name: 'Abebe Kebede',
        lastMessage: 'Selam, how are you?',
        time: '10:30 AM',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        isOnline: true,
      ),
      ChatMessage(
        name: 'Tigist Worku',
        lastMessage: 'See you tomorrow!',
        time: 'Yesterday',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
      ),
      ChatMessage(
        name: 'Kebede Alemu',
        lastMessage: 'Thanks for your help!',
        time: 'Yesterday',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
        isOnline: true,
      ),
      ChatMessage(
        name: 'Alemayehu Taye',
        lastMessage: 'Did you see the meeting notes?',
        time: 'Monday',
        avatarUrl: 'https://i.pravatar.cc/150?img=4',
      ),
      ChatMessage(
        name: 'Yohannes Demeke',
        lastMessage: 'The project is going well',
        time: 'Sunday',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Text(
              'These are example chats - not real conversations',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(chat.avatarUrl),
                        radius: 25,
                      ),
                      if (chat.isOnline)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(
                    chat.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat.time,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 4),
                      if (chat.isOnline)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'New',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    // Handle chat selection
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

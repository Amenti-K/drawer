import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String avatarUrl;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.avatarUrl,
  });
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(
        name: 'Abebe Kebede',
        phoneNumber: '+251912345678',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
      ),
      Contact(
        name: 'Kebede Alemu',
        phoneNumber: '+251923456789',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
      ),
      Contact(
        name: 'Alemayehu Taye',
        phoneNumber: '+251934567890',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
      ),
      Contact(
        name: 'Tigist Worku',
        phoneNumber: '+251945678901',
        avatarUrl: 'https://i.pravatar.cc/150?img=4',
      ),
      Contact(
        name: 'Yohannes Demeke',
        phoneNumber: '+251956789012',
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
              'These are example contacts',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.avatarUrl),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {
                      // Handle phone call
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'contacts.dart';
import 'setting.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [Home(), Contacts(), Setting()];

  final List<String> _titles = ['Home', 'Contacts', 'Setting'];

  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      Navigator.pop(context); // Close the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedPageIndex])),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Amenti Kebede"),
                accountEmail: Text("amentikebede@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/1?v=4',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => _onSelectPage(0),
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Contacts'),
                onTap: () => _onSelectPage(1),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: () => _onSelectPage(2),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}

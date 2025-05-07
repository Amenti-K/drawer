import 'package:flutter/material.dart';
import 'page_one.dart';
import 'page_two.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [PageOne(), PageTwo()];

  final List<String> _titles = ['Page One', 'Page Two'];

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
                accountName: Text("John Doe"),
                accountEmail: Text("johndoe@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/1?v=4',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Page One'),
                onTap: () => _onSelectPage(0),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Page Two'),
                onTap: () => _onSelectPage(1),
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

import 'package:auth_firebase/src/features/Report/reporting_screen.dart';
import 'package:auth_firebase/src/features/Search/search_screen.dart';
import 'package:auth_firebase/src/features/auth/login_screen.dart';
import 'package:auth_firebase/src/features/chatbox/chat_screen.dart';
import 'package:auth_firebase/src/features/screens/user_profile.dart';
import 'package:auth_firebase/src/utils/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      print('User ID: ${_currentUser!.uid}');
      print('User Email: ${_currentUser!.email}');
      print('User Display Name: ${_currentUser!.displayName}');
      print('User Photo URL: ${_currentUser!.photoURL}');
      // You can access other user properties like email, displayName, etc.
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white, // Background color of the drawer
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        hexstringtocolor("4b6cb7"),
                        hexstringtocolor("182848"),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.0),
                      ListTile(
                        title: Text(_currentUser?.displayName ?? 'Guest',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                        subtitle: Text(_currentUser?.email ?? '',style: TextStyle(color: Colors.white70)),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: _currentUser?.photoURL != null
                              ? ClipOval(
                            child: Image.network(
                              _currentUser!.photoURL!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ):
                          Icon(Icons.person, color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => user_profile()));
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person), // Add an icon to the left of the title
                  title: Text('My Profile'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => user_profile()));                  },
                ),
                Divider(), // Add a divider between list items
                ListTile(
                  leading: Icon(Icons.rss_feed), // Add an icon to the left of the title
                  title: Text('Feed'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));                  },
                ),
                Divider(), // Add a divider between list items
                ListTile(
                  leading: Icon(Icons.search), // Add an icon to the left of the title
                  title: Text('Missing'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => missingTab()));                  },
                ),
                Divider(), // Add a divider between list items
                ListTile(
                  leading: Icon(Icons.location_on), // Add an icon to the left of the title
                  title: Text('Found'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoundTab()));                  },
                ),
                Divider(), // Add a divider between list items
                ListTile(
                  leading: Icon(Icons.support), // Add an icon to the left of the title
                  title: Text('Support'),
                  onTap: () {
                  },
                ),
                Divider(), // Add a divider between list items
                ListTile(
                  leading: Icon(Icons.support), // Add an icon to the left of the title
                  title: Text('Log Out'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                Divider(), // Add a divider between list items
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Missing'),
              Tab(text: 'Found'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            missingTab(),
            FoundTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportingScreen()),
            );
          },
          child: Icon(Icons.add, color: Colors.indigo,),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.indigo),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.indigo),
              label: 'Chat',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigo),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigo),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                break;
              case 1:
              // Navigate to chat screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chat_screen()),
                );
                break;
              case 2:
              // Navigate to search screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => search_screen()),
                );
                break;
              case 3:
              // Navigate to profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => user_profile()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
class missingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Example number of posts
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Ahmed Khan'),
                  subtitle: Text('Posted 2 hours ago'),
                  leading: CircleAvatar(
                    // User profile picture
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, color: Colors.black),
                  ),
              onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => user_profile()));
        },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Post description'),
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZKyhrQwYpu-fMKgGVG27KxiHUxyG-vur7JRPWxuVol9-R4M8mBuR9QSMJfRwpKwgpG48&usqp=CAU', // Example image URL
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      icon: Icon(Icons.sentiment_very_dissatisfied),
                      onPressed: () {
                        // Perform action for sad reaction
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.sentiment_satisfied),
                      onPressed: () {
                        // Perform action for happy reaction
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Perform action for share button
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class FoundTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Example number of posts
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Sara Ali'),
                  subtitle: Text('Posted 2 hours ago'),
                  leading: CircleAvatar(
                    // User profile picture
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('A missing person is a person who has disappeared and whose status as alive or dead cannot be confirmed as their location and condition are unknown.'),
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKl49kp8-qIUSSvFe_CR-fxzr-FcJopRuGy3CU0CVYnaT3p-dgdMlXFrKyoA&s', // Example image URL
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      icon: Icon(Icons.sentiment_very_dissatisfied),
                      onPressed: () {
                        // Perform action for sad reaction
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.sentiment_satisfied),
                      onPressed: () {
                        // Perform action for happy reaction
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Perform action for share button
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
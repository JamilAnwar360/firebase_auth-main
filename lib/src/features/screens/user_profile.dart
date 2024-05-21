import 'package:auth_firebase/src/features/auth/auth_service.dart';
import 'package:auth_firebase/src/features/screens/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class user_profile extends StatefulWidget {
  const user_profile({Key? key});

  @override
  State<user_profile> createState() => _UserProfileState();
}

class _UserProfileState extends State<user_profile> {
  final AuthService _auth = AuthService(); // Instantiate AuthService
  late User? _user; // Variable to store user data

  @override
  void initState() {
    super.initState();
    // Fetch user data when the screen initializes
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final user = await _auth.getCurrentUser();
    if (user != null) {
      // Set the user data to the state variable
      setState(() {
        _user = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showMenu(
                color: Colors.white70,
                context: context,
                position: RelativeRect.fromLTRB(100, 100, 30, 30),
                items: [
                  PopupMenuItem(
                    child: Text("Edit"),
                    value: "edit",
                  ),
                  PopupMenuItem(
                    child: Text("Change profile picture"),
                    value: "change_picture",
                  ),
                ],
                elevation: 8.0,
              ).then((value) {
                if (value == "edit") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => edit_profile()),
                  );
                } else if (value == "change_picture") {
                  // Logic to change profile picture
                }
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          if (_user != null) ...[
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(/*_user!.photoURL*/'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxPz7ALznq79eHFFg3WE-nW3EBD_Uc50YWDw&s' ?? ''),
            ),
            SizedBox(height: 16.0),
            Text(
              _user!.displayName ?? '',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ProfileDetailItem(
              icon: Icons.email,
              label: 'Email',
              value: _user!.email ?? '',
            ),
            ProfileDetailItem(
              icon: Icons.phone,
              label: 'Phone',
              value: _user!.phoneNumber ?? '',
            ),
            /*ProfileDetailItem(
              icon: Icons.location_on,
              label: 'Location',
              value: _user!.location ?? '',
            ),*/
          ],
        ],
      ),
    );
  }
}

class ProfileDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetailItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hassana/Pages/edit_profile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Organization Name (NGOs or Restaurant)
            Text(
              'NGOs or Restaurant',
              style: TextStyle(
                fontSize: 24, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Organization Logo (Image) - Larger size
            Center(
              child: CircleAvatar(
                radius: 60, // Increased radius
                backgroundImage: AssetImage('assets/images/photo1.jpg'),
                // Replace 'assets/organization_logo.png' with your actual logo image path
              ),
            ),
            SizedBox(height: 32), // Increased spacing

            // Edit Profile
            ListTile(
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to the Taki widget
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Taki()),
                );
              },
            ),
            Divider(),

            // About
            ListTile(
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // TODO: Implement about screen navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
            Divider(),

            // Log Out
            ListTile(
              title: Text('Log Out'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement share app logic
          // You can use a package like 'share' to share the app
        },
        label: Text('Share the App'), // Added label
        icon: Icon(Icons.share),
      ),
    );
  }
}

// Placeholder screens for Edit Profile and About
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      // Add your about screen UI here
    );
  }
}

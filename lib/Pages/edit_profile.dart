import 'package:flutter/material.dart';

class Taki extends StatefulWidget {
  @override
  _TakiState createState() => _TakiState();
}

class _TakiState extends State<Taki> {
  TextEditingController _organizationNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String organizationName = 'My Organization'; // Replace with actual data
  String phoneNumber = '123-456-7890'; // Replace with actual data
  String location = '123 Main St, City'; // Replace with actual data
  String password = '********'; // Replace with actual data

  @override
  void initState() {
    super.initState();
    _organizationNameController.text = organizationName;
    _phoneNumberController.text = phoneNumber;
    _locationController.text = location;
    _passwordController.text = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Organization Name
              Text(
                'Organization Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _organizationNameController,
                onChanged: (value) {
                  setState(() {
                    organizationName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.business),
                ),
              ),
              SizedBox(height: 16),

              // Phone Number
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _phoneNumberController,
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 16),

              // Location
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _locationController,
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Location',
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              SizedBox(height: 16),

              // Password
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _passwordController,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 24),

              // Apply Modifications Button
              ElevatedButton(
                onPressed: () {
                  // Logic for applying modifications goes here
                },
                child: Text('Apply Modifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Taki(),
  ));
}

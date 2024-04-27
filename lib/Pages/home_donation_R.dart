import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation Requests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DonationRequestsPage(),
    );
  }
}

class DonationRequest {
  final String organizationName;
  final String contactNumber;
  final String location;
  final DateTime date;
  final String description;
  final int _quantity; // Changed attribute name to _quantity
  final bool employeeAvailable; // New attribute

  DonationRequest({
    required this.organizationName,
    required this.contactNumber,
    required this.location,
    required this.date,
    required this.description,
    required int quantity,
    required this.employeeAvailable, // Initialize employee availability
  }) : _quantity = quantity;

  int get quantity => _quantity;
}

class DonationRequestsPage extends StatefulWidget {
  @override
  _DonationRequestsPageState createState() => _DonationRequestsPageState();
}

class _DonationRequestsPageState extends State<DonationRequestsPage> {
  final List<DonationRequest> allRequests = [
    DonationRequest(
      organizationName: 'Helping hands ',
      contactNumber: '123-456-7890',
      location: '123 Charity St, Kindness City',
      date: DateTime.now(),
      description: 'This is a description of the donation request.',
      quantity: 50,
      employeeAvailable: true, // Example employee availability
    ),
    DonationRequest(
      organizationName: 'Charity Foundation',
      contactNumber: '987-654-3210',
      location: '456 Generosity Ave, Compassion Town',
      date: DateTime.now(),
      description: 'Request for food items.',
      quantity: 100,
      employeeAvailable: false, // Example employee availability
    ),
    DonationRequest(
      organizationName: 'Community Outreach',
      contactNumber: '555-555-5555',
      location: '789 Caring Blvd, Unity Village',
      date: DateTime.now(),
      description: 'Urgent need for clothing donations.',
      quantity: 75,
      employeeAvailable: true, // Example employee availability
    ),
    DonationRequest(
      organizationName: 'Food Bank',
      contactNumber: '111-222-3333',
      location: '321 Hunger Dr, Benevolence City',
      date: DateTime.now(),
      description: 'Request for non-perishable food items.',
      quantity: 200,
      employeeAvailable: false, // Example employee availability
    ),
  ];

  late List<DonationRequest> filteredRequests;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRequests = allRequests;
    searchController.addListener(filterList);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterList() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredRequests = allRequests.where((request) {
        return request.organizationName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Requests'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by Organization Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10), // Add some space around each card
                  color: Colors.lightBlue[50], // Change the color of the list
                  child: ExpansionTile(
                    title: Text(filteredRequests[index].organizationName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${filteredRequests[index].description}\n'
                            'Location: ${filteredRequests[index].location}\n'
                            'Quantity: ${filteredRequests[index].quantity}'),
                        Text(
                            'Employee Available: ${filteredRequests[index].employeeAvailable ? "Yes" : "No"}'), // Display employee availability
                      ],
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                'Contact: ${filteredRequests[index].contactNumber}'),
                            Text(
                                'Date: ${filteredRequests[index].date.toString()}'),
                          ],
                        ),
                      ),
                    ],
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Implement the accept donation logic
                        print(
                            'Donation accepted for ${filteredRequests[index].organizationName}');
                      },
                      child: Text('Accept'),
                    ),
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

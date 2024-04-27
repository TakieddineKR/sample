import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final List<DonationRequest> _requests = [
    DonationRequest(
      id: 'request_1',
      ngoName: 'Hope NGO',
      ngoPhone: '+213 567 890123',
      quantity: 50,
      description: 'Food for underprivileged children',
      dateOfPickup: DateTime(2024, 4, 5),
      priority: 1, // Initial priority
    ),
    DonationRequest(
      id: 'request_2',
      ngoName: 'Charity Foundation',
      ngoPhone: '+213 567 890124',
      quantity: 100,
      description: 'Clothes for homeless people',
      dateOfPickup: DateTime(2024, 4, 6),
      priority: 2,
    ),
    DonationRequest(
      id: 'request_3',
      ngoName: 'Helping Hands',
      ngoPhone: '+213 567 890125',
      quantity: 200,
      description: 'Books for rural schools',
      dateOfPickup: DateTime(2024, 4, 7),
      priority: 3,
    ),
    // Add more sample data entries here
  ];

  TextEditingController _searchController = TextEditingController();
  List<DonationRequest> _filteredRequests = [];

  @override
  void initState() {
    super.initState();
    _filteredRequests = _requests;
    _searchController.addListener(filterRequests);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterRequests() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredRequests = _requests.where((request) {
        return request.ngoName.toLowerCase().contains(query) ||
            request.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    filterRequests();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRequests.length,
              itemBuilder: (context, index) {
                final request = _filteredRequests[index];
                return DonationRequestTile(
                  request: request,
                  onPriorityChanged: (newPriority) {
                    setState(() {
                      // Adjust priorities of other requests
                      for (var req in _requests) {
                        if (req.id != request.id &&
                            req.priority >= newPriority) {
                          req.priority++;
                        }
                      }
                      // Update the priority of the current request
                      request.priority = newPriority;
                      // Sort requests by priority
                      _requests
                          .sort((a, b) => a.priority.compareTo(b.priority));
                    });
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

class DonationRequest {
  final String id;
  final String ngoName;
  final String ngoPhone;
  final int quantity;
  final String description;
  final DateTime dateOfPickup;
  int priority; // Priority number
  bool isExpanded;

  DonationRequest({
    required this.id,
    required this.ngoName,
    required this.ngoPhone,
    required this.quantity,
    required this.description,
    required this.dateOfPickup,
    this.priority = 1, // Default priority
    this.isExpanded = false,
  });
}

class DonationRequestTile extends StatelessWidget {
  final DonationRequest request;
  final Function(int) onPriorityChanged;

  DonationRequestTile({
    required this.request,
    required this.onPriorityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Text(request.ngoName),
        subtitle: Text(request.description),
        children: [
          ListTile(
            title: Text('Phone: ${request.ngoPhone}'),
            subtitle: Text('Quantity: ${request.quantity}'),
            trailing: PopupMenuButton<int>(
              itemBuilder: (context) {
                return List.generate(request.quantity, (i) {
                  return PopupMenuItem<int>(
                    value: i + 1, // Start from 1 instead of 0
                    child: Text('Priority ${i + 1}'),
                  );
                });
              },
              onSelected: (newPriority) {
                // Update the priority
                onPriorityChanged(newPriority);
              },
              child: Icon(Icons.more_vert),
            ),
          ),
          // Add more details or actions as needed
        ],
        initiallyExpanded: request.isExpanded,
      ),
    );
  }
}

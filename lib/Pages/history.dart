import 'package:flutter/material.dart';

class DonationHistoryScreen extends StatefulWidget {
  @override
  _DonationHistoryScreenState createState() => _DonationHistoryScreenState();
}

class _DonationHistoryScreenState extends State<DonationHistoryScreen> {
  // Sample data (replace with your actual data fetching logic)
  final List<DonationRequest> _requests = [
    DonationRequest(
      ngoName: 'Hope NGO',
      ngoPhone: '+213 567 890123',
      quantity: 50,
      description: 'Food for underprivileged children',
      dateOfPickup: DateTime(2024, 4, 5),
      hasDeliveryEmployee: true,
      restaurantName: 'Kind Kitchen',
      restaurantPhone: '+213 789 456321',
    ),
    DonationRequest(
      ngoName: 'Charity Aid',
      ngoPhone: '+213 987 654321',
      quantity: 30,
      description: 'Clothing for homeless shelters',
      dateOfPickup: DateTime(2024, 3, 20),
      hasDeliveryEmployee: false,
    ),
    // Add more sample data entries here (multiple donation requests)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: _requests.length,
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemBuilder: (context, index) {
            final request = _requests[index];
            final backgroundColor = Color.fromRGBO(
                245, 245, 245, 1.0); // Slightly different from main background
            return Container(
              color: backgroundColor,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'NGO: ${request.ngoName}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Text('Phone:'),
                      Spacer(),
                      Text(request.ngoPhone),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Text('Quantity:'),
                      Spacer(),
                      Text('${request.quantity}'),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text('Description: ${request.description}'),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Text('Date of Pickup:'),
                      Spacer(),
                      Text(request.dateOfPickup.toString()),
                    ],
                  ),
                  if (request.hasDeliveryEmployee) ...[
                    SizedBox(height: 8.0),
                    Text('Delivery Employee Available'),
                  ],
                  SizedBox(height: 8.0),
                  Text(
                    'Restaurant: ${request.restaurantName ?? 'Not Available'}',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Phone: ${request.restaurantPhone ?? 'Not Available'}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement download functionality
                      // This function will be called when the download button is pressed
                    },
                    child: Text('Download'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DonationRequest {
  final String ngoName;
  final String ngoPhone;
  final int quantity;
  final String description;
  final DateTime dateOfPickup;
  final bool hasDeliveryEmployee;
  final String? restaurantName;
  final String? restaurantPhone;

  DonationRequest({
    required this.ngoName,
    required this.ngoPhone,
    required this.quantity,
    required this.description,
    required this.dateOfPickup,
    required this.hasDeliveryEmployee,
    this.restaurantName,
    this.restaurantPhone,
  });
}

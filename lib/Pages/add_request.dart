import 'package:flutter/material.dart';

class AddRequestScreen extends StatefulWidget {
  @override
  _AddRequestScreenState createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _quantity = 0;
  String _location = 'oran';
  DateTime _dateOfNeed = DateTime.now();
  String _phoneNumber = '0555928275';
  String _description = 'we need chickens and selecto my friends';
  bool _deliveryEmployeeAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Donation Request'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Please enter your request details',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                SizedBox(
                  height: 16,
                ), // Change text color
                TextFormField(
                  initialValue: _description,
                  style: TextStyle(color: Colors.black), // Change text color
                  decoration: InputDecoration(
                    labelText: 'Description ',
                    labelStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue), // Change label text color
                    border: OutlineInputBorder(
                      // Add border
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.blue), // Change border color
                    ),
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _quantity.toString(),
                  style: TextStyle(color: Colors.black), // Change text color
                  decoration: InputDecoration(
                    labelText: 'Quantity of Food',
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue), // Change label text color
                    border: OutlineInputBorder(
                      // Add border
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.blue), // Change border color
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        int.tryParse(value) == null ||
                        int.parse(value) <= 0) {
                      return 'Please enter a valid quantity (positive integer).';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _quantity = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: _location,
                  style: TextStyle(color: Colors.black), // Change text color
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue), // Change label text color
                    border: OutlineInputBorder(
                      // Add border
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.blue), // Change border color
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                ),
                Row(
                  children: <Widget>[
                    Text('Date of Need:',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)), // Change text color
                    Spacer(),
                    TextButton(
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: _dateOfNeed,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                        initialEntryMode: DatePickerEntryMode.input,
                        fieldLabelText: 'Select Date',
                        fieldHintText: 'Month/Date/Year',
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() => _dateOfNeed = selectedDate);
                        }
                      }),
                      child: Text(_dateOfNeed.toString().substring(0, 10),
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  initialValue: _phoneNumber,
                  style: TextStyle(color: Colors.black), // Change text color
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue), // Change label text color
                    border: OutlineInputBorder(
                      // Add border
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.blue), // Change border color
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Delivery Employee Available',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)), // Change text color
                  value: _deliveryEmployeeAvailable,
                  onChanged: (newValue) =>
                      setState(() => _deliveryEmployeeAvailable = newValue!),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Simulate form submission (without actually sending data)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request details:')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Change button color
                  ),
                  child: Text('Submit Request',
                      style: TextStyle(
                          color: Colors.white)), // Change button text color
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

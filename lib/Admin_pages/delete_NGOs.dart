import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AdminPage(),
  ));
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final List<String> _ngos = [
    'Hope NGO',
    'Charity Foundation',
    'Helping Hands',
    // Add more NGOs here
  ];
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    final _filteredNgos = _ngos
        .where((ngo) => ngo.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNgos.length,
              itemBuilder: (context, index) {
                final ngo = _filteredNgos[index];
                return ListTile(
                  title: Text(ngo),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirm Deletion'),
                            content:
                                Text('Are you sure you want to delete $ngo?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Delete'),
                                onPressed: () {
                                  setState(() {
                                    _ngos.remove(ngo);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
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

import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Arafat', email: 'admin@imtopu.com', phoneNumber: '01964707688'),
    Contact(name: 'Topu', email: 'info@imtopu.com', phoneNumber: '01964707688'),
    Contact(name: 'Bin', email: 'main@imtopu.com', phoneNumber: '01964707688'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center (
        child: Text('Contact List'),
      )),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            //subtitle: Text(contacts[index].email),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 4.0),
              Text('Phone: ${contact.phoneNumber}'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}

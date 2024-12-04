// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String docId;

  const DetailPage({super.key, required this.docId});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to the edit page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(docId: docId),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: firestore.collection('accomodation_list').doc(docId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data.'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Hotel not found.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final String name = data['name'] ?? 'N/A';
          final String location = data['location'] ?? 'N/A';
          final String description = data['description'] ?? 'N/A';
          final int stars = data['stars'] ?? 0;
          final String owner = data['owner'] ?? 'N/A';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/cleo.jpg', // Static image
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 28, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 18, // Increased font size
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Stars: ',
                      style: TextStyle(
                        fontSize: 18, // Increased font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (int i = 0; i < stars; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18, // Star icon size
                      ),
                    if (stars == 0)
                      const Text(
                        'No Rating',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Owner: $owner',
                  style: const TextStyle(
                    fontSize: 18, // Slightly increased font size
                    fontWeight: FontWeight.bold, // Made bold
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      const url = 'https://www.example.com/book';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: const Text('Book Now'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EditPage extends StatefulWidget {
  final String docId;

  const EditPage({super.key, required this.docId});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;
  late TextEditingController _starsController;
  late TextEditingController _ownerController;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final docSnapshot =
        await firestore.collection('accomodation_list').doc(widget.docId).get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _nameController = TextEditingController(text: data['name']);
        _locationController = TextEditingController(text: data['location']);
        _descriptionController =
            TextEditingController(text: data['description']);
        _starsController =
            TextEditingController(text: data['stars'].toString());
        _ownerController = TextEditingController(text: data['owner']);
      });
    }
  }

  Future<void> _updateData() async {
    if (_formKey.currentState!.validate()) {
      await firestore.collection('accomodation_list').doc(widget.docId).update({
        'name': _nameController.text,
        'location': _locationController.text,
        'description': _descriptionController.text,
        'stars': int.parse(_starsController.text),
        'owner': _ownerController.text,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Hotel Details'),
      ),
      body: _nameController == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Name is required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(labelText: 'Location'),
                      validator: (value) =>
                          value!.isEmpty ? 'Location is required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) =>
                          value!.isEmpty ? 'Description is required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _starsController,
                      decoration: const InputDecoration(labelText: 'Stars'),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty ||
                              int.tryParse(value) == null
                          ? 'Valid number of stars is required'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _ownerController,
                      decoration: const InputDecoration(labelText: 'Owner'),
                      validator: (value) =>
                          value!.isEmpty ? 'Owner is required' : null,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _updateData,
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

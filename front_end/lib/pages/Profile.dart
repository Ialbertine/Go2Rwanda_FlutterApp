// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool _isEditing = false;
  bool _isLoading = false;

  late TextEditingController _fullNameController;
  late TextEditingController _addressController;
  late TextEditingController _contactController;
  late TextEditingController _emailController;

  @override

  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _addressController = TextEditingController();
    _contactController = TextEditingController();
    _emailController = TextEditingController();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() => _isLoading = true);
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Set email from Firebase Auth
        _emailController.text = currentUser.email ?? '';

        // Get additional user data from Firestore
        final userData = await _firestore
            .collection('users')
            .doc(currentUser.uid)
            .get();

        if (userData.exists) {
          setState(() {
            _fullNameController.text = userData.data()?['fullName'] ?? '';
            _addressController.text = userData.data()?['address'] ?? '';
            _contactController.text = userData.data()?['contact'] ?? '';
          });
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error loading profile data');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _firestore.collection('users').doc(currentUser.uid).set({
          'fullName': _fullNameController.text,
          'address': _addressController.text,
          'contact': _contactController.text,
          'email': _emailController.text,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        setState(() => _isEditing = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
              backgroundColor: Color(0xFF2E7D32),
            ),
          );
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error updating profile');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteProfile() async {
    final bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Profile'),
        content: const Text(
          'Are you sure you want to delete your profile? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    ) ?? false;

    if (!confirm) return;

    setState(() => _isLoading = true);
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Delete user data from Firestore
        await _firestore.collection('users').doc(currentUser.uid).delete();
        // Delete user account
        await currentUser.delete();
        // Sign out
        await _auth.signOut();
        
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error deleting profile');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        title: const Text(
          'Go2Rwanda',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteProfile,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: const Color(0xFF2E7D32),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 70, 24, 24),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      _buildFormField(
                                        title: 'Full names',
                                        controller: _fullNameController,
                                        enabled: _isEditing,
                                      ),
                                      _buildFormField(
                                        title: 'Address',
                                        controller: _addressController,
                                        enabled: _isEditing,
                                      ),
                                      _buildFormField(
                                        title: 'Contact',
                                        controller: _contactController,
                                        enabled: _isEditing,
                                        keyboardType: TextInputType.phone,
                                      ),
                                      _buildFormField(
                                        title: 'Email',
                                        controller: _emailController,
                                        enabled: false,
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_isEditing) {
                                              _updateProfile();
                                            } else {
                                              setState(() => _isEditing = true);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF2E7D32),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            _isEditing ? 'Save Profile' : 'Edit Profile',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_isEditing) ...[
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              setState(() => _isEditing = false);
                                              _loadUserData();
                                            },
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: const Text('Cancel'),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              color: Colors.white,
                            ),
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundColor: Color(0xFF2E7D32),
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildFormField({
    required String title,
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2E7D32),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF2E7D32),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false; // Visibility toggle for password
  bool _isConfirmPasswordVisible = false; // Visibility toggle for confirm password

  // Function to validate the email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Function to validate the password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    // Regex to enforce strong password (uppercase, lowercase, digit, special char)
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$');
    if (!regex.hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, digit, and special character';
    }
    return null;
  }

  // Function to validate the confirm password
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isLandscape ? screenWidth * 0.5 : double.infinity,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      validator: _validateEmail,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validateConfirmPassword,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2E7D32),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text('OR', style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/google.png', height: 24),
                          SizedBox(width: 8),
                          Text('Continue with Google'),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? '),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

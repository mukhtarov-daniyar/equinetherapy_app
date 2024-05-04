import 'package:equinetherapy_app/views/screens/main_screen.dart';
import 'package:equinetherapy_app/views/screens/register/register_screen.dart';
import 'package:equinetherapy_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Implement your login logic here
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');

    // Navigate to HomeScreen after successful login
    Get.off(() => MainScreen()); // Use Get.off() to replace the current route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Title can be adjusted or used as commented
          // title: Text('Login'),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Material(
              borderRadius: BorderRadius.circular(
                  10), // Slightly rounded corners for the image
              elevation: 8, // Elevation to create a raised effect
              child: InkWell(
                onTap: () {
                  print('Image tapped!');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10), // Apply the same rounding here to clip the image
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Войти',
              buttonColor: Colors.teal,
              onPressed: _login,
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Get.to(() => const RegisterScreen());
              },
              child: Text(
                'Зарегестрироваться',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 4,
        shadowColor: Colors.grey,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart'; // Import the Vibration package
import 'Colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _showError = false;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _login() async {
    // Reset error message
    setState(() {
      _showError = false;
    });

    // Check username and password
    if (_usernameController.text == 'regular_user2' &&
        _passwordController.text == 'regular_password2') {
      // Login successful, navigate to home page
      Navigator.pushReplacementNamed(context, '/homePage');
    } else {
      // Show error message
      setState(() {
        _showError = true;
      });
      // Vibrate the device
      Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 100.0,
                color: AppColors.c1,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 8.0),
              if (_showError)
                Text(
                  'Bad username or password',
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

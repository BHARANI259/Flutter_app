import 'package:flutter/material.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phone = TextEditingController();
  String role = 'Owner';
  String error = '';

  void sendOtp() {
    if (phone.text.length != 10) {
      setState(() => error = 'Enter 10 digits');
      return;
    }

    if (role == 'Supervisor') {
      setState(() => error = 'Supervisor login is not available yet');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OtpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            const Text(
              'Welcome to BuildCare',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text('Manage your construction site'),

            const SizedBox(height: 30),

            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                filled: true,
                fillColor: Colors.white,
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Login as',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [
                Radio(
                  value: 'Owner',
                  groupValue: role,
                  onChanged: (value) {
                    setState(() => role = value.toString());
                  },
                ),
                const Text('Owner'),

                Radio(
                  value: 'Supervisor',
                  groupValue: role,
                  onChanged: (value) {
                    setState(() => role = value.toString());
                  },
                ),
                const Text('Supervisor'),
              ],
            ),

            if (error.isNotEmpty)
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: sendOtp,
                child: const Text('Send OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
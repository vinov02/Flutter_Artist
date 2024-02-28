import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent!'),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors such as invalid email, user not found, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset email: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 135,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Forgot',
                  style: TextStyle(
                      fontSize: 34, fontFamily: 'Poppins', color: Colors.black),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 34, fontFamily: 'Poppins', color: Color(0xFF6078EA)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Provide your account’s email for which you',
                  style: TextStyle(
                      fontSize: 12, fontFamily: 'Poppins', color: Colors.black),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'want to reset your password!',
                  style: TextStyle(
                      fontSize: 12, fontFamily: 'Poppins', color: Colors.black),
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your Email',
                  labelStyle:
                      TextStyle(fontFamily: 'Poppins', color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:const  Color(0xFFF54EA2)
                      ),
                      onPressed: () {
                        _resetPassword(context);
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF363437)
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

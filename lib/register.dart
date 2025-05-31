import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController branch = TextEditingController();
  final TextEditingController rollno = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _registerUser() async {
    final String emailText = email.text.trim();
    final String passwordText = password.text.trim();
    final String confirmPasswordText = confirmPassword.text.trim();

    if (emailText.isEmpty ||
        passwordText.isEmpty ||
        confirmPasswordText.isEmpty) {
      _showMessage('Please fill in all fields.');
      return;
    }

    if (passwordText != confirmPasswordText) {
      _showMessage('Passwords do not match.');
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
      _showMessage('Registration successful!');
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      print(
          "FirebaseAuthException: ${e.code} - ${e.message}"); // ✅ logs for debugging
      _showMessage(e.message ?? 'An unexpected error occurred.');
    } catch (e) {
      print("Other error: $e"); // ✅ logs for debugging
      _showMessage('Something went wrong: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'SHARE THE MEAL',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 177, 197, 131),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  "Create An Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Helping People In Need",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
            ),
            CustomTextInput(
              controller: name,
              icon: const Icon(Icons.person),
              hint: 'Enter your full name',
              isObscure: false,
            ),
            CustomTextInput(
              controller: email,
              icon: const Icon(Icons.email),
              hint: 'Enter your email',
              isObscure: false,
            ),
            CustomTextInput(
              controller: password,
              icon: const Icon(Icons.password),
              hint: 'Enter your password',
              isObscure: true,
            ),
            CustomTextInput(
              controller: confirmPassword,
              icon: const Icon(Icons.password),
              hint: 'Confirm your password',
              isObscure: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _registerUser,
                  child: const Text('Sign Up'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

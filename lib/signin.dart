import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHARE THE MEAL',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            )),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
            255, 177, 197, 131), // You can change the color
        elevation: 4, // Shadow below the appbar
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Welcome to Share The Meal!",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.green,
              ),
            ),
          ),
          const Center(
            child: Text('Eat.Live.Grow',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color.fromARGB(255, 94, 175, 97))),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  // Your action
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      width: 24,
                      height: 15,
                    ),
                    const SizedBox(width: 8),
                    const Text('Sign in with Google'),
                  ],
                ),
              ),
            ),
          ),
          CustomTextInput(
              controller: _email,
              icon: const Icon(Icons.email),
              hint: 'Enter your email',
              isObscure: false,
              keyboard: TextInputType.emailAddress),
          CustomTextInput(
              controller: _password,
              icon: const Icon(Icons.password),
              hint: 'Enter your password',
              isObscure: true,
              keyboard: TextInputType.text),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text('Sign in')))),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Dont have an account?',
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register here')))
        ],
      ),
    );
  }
}

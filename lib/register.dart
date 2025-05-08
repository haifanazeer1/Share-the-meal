import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController branch = TextEditingController();
    final TextEditingController rollno = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, '/sign-in');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('SHARE THE MEAL',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            )),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 177, 197, 131),
      ),
      body: Column(
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
                //fontFamily: 'Roboto',
                color: Colors.green,
              ),
            ),
          ),
          CustomTextInput(
            controller: name,
            icon: const Icon(Icons.person),
            hint: 'Enter your  full name',
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
            controller: password,
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Sign Up'))),
          ),
        ],
      ),
    );
  }
}

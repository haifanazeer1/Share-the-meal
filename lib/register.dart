import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _branch = TextEditingController();
    final TextEditingController _rollno = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, '/sign-in');
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('SHARE THE MEAL',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            )),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 177, 197, 131),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
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
          Center(
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
            controller: _name,
            icon: Icon(Icons.person),
            hint: 'Enter your  full name',
            isObscure: false,
          ),
          CustomTextInput(
            controller: _email,
            icon: Icon(Icons.email),
            hint: 'Enter your email',
            isObscure: false,
          ),
          CustomTextInput(
            controller: _password,
            icon: Icon(Icons.password),
            hint: 'Enter your password',
            isObscure: true,
          ),
          CustomTextInput(
            controller: _password,
            icon: Icon(Icons.password),
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
                    child: Text('Sign Up'))),
          ),
        ],
      ),
    );
  }
}

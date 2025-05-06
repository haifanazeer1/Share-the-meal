import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required TextEditingController controller,
    this.onTap,
    required this.icon,
    required this.isObscure,
    this.keyboard,
    required this.hint,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Icon icon;
  final bool isObscure;
  final TextInputType? keyboard;
  final String hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 60,
        width: double.maxFinite,
        child: TextField(
          controller: _controller,
          keyboardType: keyboard,
          obscureText: isObscure,
          decoration: InputDecoration(
              hintText: hint,
              icon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onTap: onTap,
        ),
      ),
    );
  }
}

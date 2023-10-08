import 'package:flutter/material.dart';

class TextFieldSignUp extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  const TextFieldSignUp({super.key, required this.name,required this.controller});

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            label: Text(widget.name),
            hintText: 'Enter your ${widget.name}',
            contentPadding: const EdgeInsets.symmetric(horizontal: 3)),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminTextFormField extends StatelessWidget {
  const AdminTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.obscure=false , // Set a default value for obscure
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        obscureText: obscure,
      ),
    );
  }
}

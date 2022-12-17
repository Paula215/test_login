import 'package:flutter/material.dart';

class Cajita extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool invisible;
  final bool email;
  final TextEditingController? controller;

  const Cajita({
    required this.label,
    required this.placeholder,
    this.controller,
    this.invisible = false,
    this.email = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Container(
            width: 350,
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 27, 33, 81),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: email == true
                  ? TextInputType.emailAddress
                  : TextInputType.text,
              obscureText: invisible,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholder,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30)),
            ))
      ],
    );
  }
}

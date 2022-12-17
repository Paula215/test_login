import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAlert extends StatelessWidget {
  void Function()? onTap;
  String label;

  ButtonAlert({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 199, 86),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Text(
            label,
            style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLongIn extends StatelessWidget {
  String label;
  void Function()? onTap;

  ButtonLongIn({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 240,
            height: 52,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 199, 86),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 240,
            height: 52,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromARGB(255, 27, 33, 81), width: 5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: Text(
              label,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  GestureTapCallback onTap;
  final String buttonText;
  ButtonWidget({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: width * .5,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(.1),
              width: 5
            ),
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

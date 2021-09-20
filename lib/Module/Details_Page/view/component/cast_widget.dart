import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({
    Key? key, required this.name, required this.image,
  }) : super(key: key);

  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipOval(
                child: Container(
                  height: 40,
                  width:  40,
                  color: Colors.white54,
                  child: Image.network(image,
                    fit: BoxFit.contain,
                  ),

                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Actor",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

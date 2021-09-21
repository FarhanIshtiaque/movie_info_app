import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class PosterInfo extends StatelessWidget {
  const PosterInfo({
    Key? key, required this.tittle, required this.posterPath, required this.rating, required this.genre, required this.releaseYear, required this.runtime, required this.language,


  }) : super(key: key);

final String tittle;
final String posterPath;
final double rating;
final String genre;
final String runtime;
final String language;
  final   String releaseYear;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
            height: height * .6,
            width: width,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(
                    Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(
               posterPath,
                fit: BoxFit.fill,
              ),
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tittle,
                    //
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  RatingBarIndicator(
                    rating: rating,
                    //
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: Colors.white38,
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    genre,

                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        releaseYear,

                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          height: 12,
                          width: 1,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        runtime,
                        //
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          height: 12,
                          width: 1,
                          color: Colors.white54,
                        ),
                      ),
                      Text(
                        language,
                        // movieDetails.spokenLanguages
                        //     .map((e) => e.name)
                        //     .join(', '),
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: width * .5,
                    height: 1,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.white12,
                          Colors.white70,
                          Colors.white12
                        ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Module/Details_Page/model/cast_model.dart';
import 'package:movie_app/Module/Details_Page/model/movie_details_model.dart';
import 'package:movie_app/Services/tmdb.dart';
import 'package:movie_app/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'component/cast_widget.dart';

class MovieDetails extends StatelessWidget {
  late MovieDetailsModel movieDetails;
  late CastModel credit;

  MovieDetails(this.movieDetails, this.credit);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              IconlyLight.arrowLeft2,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Global.lightBlack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                          TMDB.imageUrlDetails + movieDetails.posterPath,
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
                              movieDetails.title,
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
                              rating: movieDetails.voteAverage / 2,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 16.0,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              movieDetails.genres.map((e) => e.name).join(', '),
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
                                  DateFormat('yyyy').format(
                                      DateTime.parse(movieDetails.releaseDate)),
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
                                  movieDetails.runtime.toString() + " min",
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
                                  movieDetails.spokenLanguages
                                      .map((e) => e.name)
                                      .join(', '),
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Story Line',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      movieDetails.overview,
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white70),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Star Cast',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: credit.cast
                      .where((element) => element.popularity > 5)
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return CastWidget(
                      name: credit.cast[index].name,
                      image: TMDB.imageUrl+ credit.cast[index].profilePath,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

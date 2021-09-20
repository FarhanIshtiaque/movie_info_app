import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Module/Details_Page/view/movie_details.dart';
import 'package:movie_app/Module/Home/model/PopularResponse.dart';
import 'package:movie_app/Module/Home/state/genre_state.dart';
import 'package:movie_app/Services/tmdb.dart';
import 'package:movie_app/constant.dart';

class MovieCard extends StatelessWidget {
  late final Movies movie;

  MovieCard(this.movie);

  GenresState genresState = Get.find();

  @override
  Widget build(BuildContext context) {
    print(movie);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: (){
          TMDB().fetchMovieById(movie.id).then((value) {
            Get.to(MovieDetails(value));
          });

        },
        child: SizedBox(
          width: width,
          height: height * .17,
          child: Stack(
            children: [
              Container(
                height: height * .17,
                width: width * .85,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.071),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Positioned(
                top: -18,
                left: width * .3,
                child: ClipOval(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(color: Global.lightBlack),
                  ),
                ),
              ),
              Positioned(
                bottom: -18,
                left: width * .3,
                child: ClipOval(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(color: Global.lightBlack),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: width * .25,
                        child: Image.network(
                          TMDB.imageUrl + movie.posterPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            movie.title,
                            softWrap: true,
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Language : ${movie.originalLanguage}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: Text(
                            genresState.getString(movie.genreIds),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat('yyyy')
                              .format(DateTime.parse(movie.releaseDate)),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Global.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      'IMDB ${movie.voteAverage}',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

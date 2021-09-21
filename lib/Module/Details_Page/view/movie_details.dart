import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Module/Details_Page/model/cast_model.dart';
import 'package:movie_app/Module/Details_Page/model/movie_details_model.dart';
import 'package:movie_app/Module/Home/view/component/button_widget.dart';
import 'package:movie_app/Services/tmdb.dart';
import 'package:movie_app/constant.dart';
import 'component/cast_widget.dart';
import 'component/poster_info.dart';

class MovieDetails extends StatelessWidget {
  late MovieDetailsModel movieDetails;
  late CastModel credit;

  MovieDetails(this.movieDetails, this.credit);

  @override
  Widget build(BuildContext context) {

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
              PosterInfo(
                posterPath: TMDB.imageUrlDetails + movieDetails.posterPath,
                tittle: movieDetails.title,
                rating: movieDetails.voteAverage / 2,
                genre: movieDetails.genres.map((e) => e.name).join(', '),
                releaseYear: DateFormat('yyyy')
                    .format(DateTime.parse(movieDetails.releaseDate)),
                runtime: movieDetails.runtime.toString() + " min",
                language:
                    movieDetails.spokenLanguages.map((e) => e.name).join(', '),
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
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: credit.cast
                      .where((element) => element.popularity > 5)
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return CastWidget(
                      name: credit.cast[index].name,
                      image: TMDB.imageUrl + credit.cast[index].profilePath,
                    );
                  },
                ),
              ),
              ButtonWidget(
                buttonText: 'Back',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

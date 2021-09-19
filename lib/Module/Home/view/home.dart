import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Module/Home/state/genre_state.dart';
import 'package:movie_app/Module/Home/state/popular_state.dart';
import 'package:movie_app/constant.dart';

import 'component/button_widget.dart';
import 'component/movie_card.dart';
import 'component/movie_tab_button.dart';

class Home extends StatelessWidget {
  final state = Get.put(PopularMovieState());
  final genreState = Get.put(GenresState());
Home(){   print("Printaed");
  state.fetchMovies();
  genreState.getGenres();
}
  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.lightBlack,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Movies',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),

              MovieTab(),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Obx(() {
                  print(state.movies.length);
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: state.movies.length + 1,
                      itemBuilder: (context, index) {
                        return index == state.movies.length
                            ? ButtonWidget(
                                onTap: () {
                                  print('Taped');
                                  state.loadNextPage();
                                },
                              )
                            : MovieCard(state.movies.value[index]);
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Module/Home/state/genre_state.dart';
import 'package:movie_app/Module/Home/state/home_state.dart';
import 'package:movie_app/Module/Home/state/popular_state.dart';
import 'package:movie_app/Module/Home/state/top_rated_state.dart';
import 'package:movie_app/constant.dart';
import 'component/button_widget.dart';
import 'component/movie_card.dart';
import 'component/movie_tab_button.dart';

class Home extends StatelessWidget {
  final state = Get.put(PopularMovieState());
  final topRatedState = Get.put(TopRatedState());
  final genreState = Get.put(GenresState());
  HomeState homeState = Get.put(HomeState());

Home(){
  state.fetchMovies();
  topRatedState.fetchTopRatedMovies();
  genreState.getGenres();
}
  @override
  Widget build(BuildContext context) {

final int buttonValue;

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

              MovieTab(
                onTap: (value){
                  homeState.setSelectedId(value);

                },
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Obx(() {

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: homeState.selectedId.value==0? state.movies.length + 1:topRatedState.movies.length+1,
                      itemBuilder: (context, index) {
                        return index == state.movies.length
                            ? ButtonWidget(
                                onTap: () {
                                  print('Taped');
                                  state.loadNextPage();
                                },
                              )
                            : MovieCard(movie:homeState.selectedId.value==0?state.movies.value[index]:topRatedState.movies.value[index] ,);
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


import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('It is opening');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: width,
        height: height * .17,
        child: Stack(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(.1),
              highlightColor: Colors.white.withOpacity(.2),
              
              child: Container(
                height: height * .17,
                width: width * .85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Positioned(
              top: -18,
              left: width * .3,
              child: ClipOval(
                child: Container(
                  width: 30,
                  height: 30,
                  color: Global.lightBlack,
                
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
                  color: Global.lightBlack,
                ),
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}

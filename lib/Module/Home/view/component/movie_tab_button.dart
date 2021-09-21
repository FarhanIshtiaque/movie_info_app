import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';


class MovieTab extends StatelessWidget {
  const MovieTab({
    Key? key, required this.onTap,
  }) : super(key: key);
final ValueChanged onTap;
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 50.0,
        decoration: BoxDecoration(
         color: Colors.white.withOpacity(.1),

          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(

          indicator: BubbleTabIndicator(

            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40.0,
            indicatorColor: Colors.white.withOpacity(.2),
            indicatorRadius: 20,

          ),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: <Widget>[
            Text('Popular'),
            Text('Top Rated'),
          ],
          onTap: onTap,
        ),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_agency/commentScreens/startThreeScreen.dart';
import 'package:travel_agency/commentScreens/startTwoScreen.dart';
import 'package:travel_agency/commentScreens/stratoneScreen.dart';

class ScreenIndicator extends StatelessWidget {
  ScreenIndicator({super.key});
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [startOneScreen(), startTwoScreen(), startThreeScreen()],
          ),
          Positioned(
            bottom:10,
            right: 160,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10),
            ),
          )
        ],
      ),
    );
  }
}

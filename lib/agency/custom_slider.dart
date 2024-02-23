import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_agency/agency/Blocss/custom_sliderBloc/bloc/slider_bloc.dart';
import 'package:travel_agency/agency/Model/advatisment.dart';

// ignore: must_be_immutable
class custom_adv extends StatefulWidget {
  custom_adv({super.key, required this.trendingMovie, required this.texts});
  String texts;
   List<Ad> trendingMovie;

  @override
  State<custom_adv> createState() => _custom_advState();
}

class _custom_advState extends State<custom_adv> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to Our Journy',style: GoogleFonts.abel(
            letterSpacing: 1,
          fontSize: 26,fontWeight: FontWeight.w600),),
        SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 200,
              child: BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) {
                  return CarouselSlider.builder(
                    itemCount: widget.trendingMovie.length,
                    itemBuilder:
                        (BuildContext context, int Index, int pageViewIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 500,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                image: NetworkImage(widget.trendingMovie[Index].image_ad ),
                                fit: BoxFit.fill,
                              )),
                            )),
                      );
                    },
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      onPageChanged: (Index, reason) {
                          context.read<SliderBloc>().add(changeEvent(Index));
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

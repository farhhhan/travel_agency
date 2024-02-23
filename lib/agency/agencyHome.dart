import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:travel_agency/agency/Blocss/advbloc/bloc/advertisement_bloc.dart';
import 'package:travel_agency/agency/Model/advatisment.dart';
import 'package:travel_agency/agency/custom_agencyFun.dart';
import 'package:travel_agency/agency/custom_slider.dart';

class AgencyHomeScreen extends StatefulWidget {
  const AgencyHomeScreen({Key? key}) : super(key: key);

  @override
  State<AgencyHomeScreen> createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdvertisementBloc>().add(GetAdv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '${DateFormat.yMMMMd().format(DateTime.now())}',
                style: GoogleFonts.abhayaLibre(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  height: 100,
                  width: 80,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.blue,
                  selectedTextColor: Colors.white,
                  dateTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30),
              BlocBuilder<AdvertisementBloc, AdvertisementState>(
                builder: (context, state) {
                  if (state is AdvLodedState) {
                    List<Ad> datas = state.advData;
                    return custom_adv(
                      trendingMovie: datas,
                      texts: 'SliderWork',
                    );
                  } else if (state is AdvLoadingState) {
                    return Center(child:CircleAvatar(
                      maxRadius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage('https://cdn.dribbble.com/users/583436/screenshots/1725368/out.gif'),
                    ));
                  } else {
                    return Text("Something went wrong");
                  }
                },
              ),
              SizedBox(height: 20),
              cutom_agencysButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
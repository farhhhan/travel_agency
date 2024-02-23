import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency/agency/Blocss/BottomBloc/bottom_nav_bloc.dart';
import 'package:travel_agency/agency/agencyHome.dart';
import 'package:travel_agency/agency/agency_booking.dart';
import 'package:travel_agency/agency/agency_chat.dart';
import 'package:travel_agency/agency/agency_profile.dart';

class AgencyNavigator extends StatefulWidget {
  const AgencyNavigator({super.key});

  @override
  State<AgencyNavigator> createState() => _AgencyNavigatorState();
}

class _AgencyNavigatorState extends State<AgencyNavigator> {
  List<Widget> screens = [
    const AgencyHomeScreen(),
    const AgencyChatScreen(),
    const AgencyBookingScreen(),
    const AgencyProfileScreen(),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
              extendBody: true,
              bottomNavigationBar: CurvedNavigationBar(
                
                buttonBackgroundColor:Colors.blue[100] ,
                backgroundColor: Colors.transparent,
                key: _bottomNavigationKey,
                items: <Widget>[
                  Icon(Icons.home_outlined, size: 30),
                  Icon(Icons.chat, size: 30),
                  Icon(Icons.list, size: 30),
                  Icon(Icons.person, size: 30),
                ],
                onTap: (index) {
                      context.read<BottomNavBloc>().add(changeEvent(index));
                },
              ),
              body: screens[state.index]);
        },
      ),
    );
  }
}

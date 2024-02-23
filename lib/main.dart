import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency/agency/Blocss/BottomBloc/bottom_nav_bloc.dart';
import 'package:travel_agency/agency/Blocss/advbloc/bloc/advertisement_bloc.dart';
import 'package:travel_agency/agency/Blocss/custom_sliderBloc/bloc/slider_bloc.dart';
import 'package:travel_agency/agency/Blocss/getAgency/bloc/agency_bloc.dart';
import 'package:travel_agency/agency/Blocss/updateBloc/bloc/agency_update_bloc.dart';
import 'package:travel_agency/agency/Repositrys/agenchyRepo.dart';
import 'package:travel_agency/agency/Repositrys/agency_ad.dart';
import 'package:travel_agency/agency/Repositrys/image_pickersutils.dart';
import 'package:travel_agency/agency/Blocss/bloc/bloc_image/bloc/img_bloc_bloc.dart';
import 'package:travel_agency/commentScreens/startScreen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyDuHbcxY5PxMOq6nJ-VcAkLxp4LjPTCaYI",
          projectId: "travel-8c5ff",
          messagingSenderId: "750098882666",
          appId: "1:750098882666:android:bc0eaa696a0a8573916a13",
          storageBucket: 'travel-8c5ff.appspot.com',
        ))
      : await Firebase.initializeApp();
  runApp(MaterialsScreen());
}

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavBloc(),
          ),
          BlocProvider(
            create: (context) => ImgBlocBloc(ImagePickerServices()),
          ),
          BlocProvider(
            create: (context) => AgencyBloc(Agencyrepositry()),
          ),
          BlocProvider(
            create: (context) => AdvertisementBloc(AdvRepo()),
          ),
          BlocProvider(
            create: (context) => SliderBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StartScreen(),
        ));
  }
}

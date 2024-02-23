import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_agency/agency/agency_login.dart';



class startThreeScreen extends StatelessWidget {
  const startThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              image: DecorationImage(
                image:NetworkImage('https://th.bing.com/th/id/R.61bb7291b415205b557093634cb56d93?rik=XtFIwBmiYKCw5w&riu=http%3a%2f%2faegve.org%2fwp-content%2fuploads%2f2020%2f04%2f16-travel-arbitrage_gif-superJumbo.gif&ehk=ubzneXmCPW4iq7%2fl0KbePdJezYmRH2jliAc0YZRYbSo%3d&risl=&pid=ImgRaw&r=0'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Column(
            children: [
              Text(
                "People didn't take trips ",
                style: GoogleFonts.abhayaLibre(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' trip take ',
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'people',
                    style: GoogleFonts.abhayaLibre(
                      color: Colors.orange,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            '''        to get the  best  of adaventure you just 
   need to leave and go where you like,we are
                                waiting for you''',
            style: GoogleFonts.abhayaLibre(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgencyLoginScreen(),
                      ),
                      (route) => false,
                    ),
                    child: CircleAvatar(
                      maxRadius: 30,
                      child: Image.asset('images/travel-agent.png'),
                    ),
                  ),
                  Text(
                    'Agency',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage('images/logo.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

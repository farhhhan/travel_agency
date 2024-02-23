import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class startOneScreen extends StatelessWidget {
  const startOneScreen({super.key});

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
                image: NetworkImage('https://i.pinimg.com/originals/41/68/37/416837639ec3a916c5e1d84a4123676a.gif'),
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
                'Life is short and the',
                style: GoogleFonts.abhayaLibre(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' world is',
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ' wide',
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
            '''             Ar Friends and  travel, we customize 
   reliable and trutworthy educational tours to 
                  destinations all over the world''',
            style: GoogleFonts.abhayaLibre(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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

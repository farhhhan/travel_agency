import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_agency/agency/Blocss/getAgency/bloc/agency_bloc.dart';
import 'package:travel_agency/agency/Model/agencyModel.dart';
import 'package:travel_agency/agency/admin_editdp.dart';

class AgencyProfileScreen extends StatefulWidget {
  const AgencyProfileScreen({Key? key}) : super(key: key);

  @override
  State<AgencyProfileScreen> createState() => _AgencyProfileScreenState();
}

class _AgencyProfileScreenState extends State<AgencyProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AgencyBloc>().add(GetAgencyData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(40),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: BlocBuilder<AgencyBloc, AgencyState>(
                    builder: (context, state) {
                  if (state is AgencyLodedState) {
                    List<AgencyModel> data = state.agencyData;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, Index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                          
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(40)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 50,
                                        backgroundImage: data[Index].profile != null
                                            ? NetworkImage(data[Index].profile)
                                            : null,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${data[Index].name}',
                                                style: GoogleFonts.alata(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600)),
                                                    SizedBox(height: 5,),
                                            Text('${data[Index].email}',
                                                style: GoogleFonts.alata(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AgencyProfileEditScreen(
                                        agency: data[Index],
                                      ),
                                    ));
                              },
                              leading: Icon(
                                Icons.person_outline,
                                color: Colors.blue,
                              ),
                              title: Text(
                                'Profile Detials',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text('View & Edit Detials'),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                              ),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.edit_document,
                                color: Colors.blue,
                              ),
                              title: Text(
                                'Terms of Use',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.lock,
                                color: Colors.blue,
                              ),
                              title: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (state is AgencyLoadingState) {
                    return Center(
                      child: Container(child:CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: NetworkImage('https://i.pinimg.com/originals/9f/5b/a6/9f5ba6b38c4259a23c5965a8164ec86f.gif'),
                      )),
                    );
                  } else {
                    return Container(
                      child: Text("Nirthy poda Myre"),
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}

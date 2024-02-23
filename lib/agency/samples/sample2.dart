// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel_agency/agency/Blocss/getAgency/bloc/agency_bloc.dart';
// import 'package:travel_agency/agency/Model/agencyModel.dart';
// import 'package:travel_agency/agency/admin_editdp.dart';
// import 'package:travel_agency/agency/sample.dart';

// class AgencyProfileScreen extends StatefulWidget {
//   const AgencyProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<AgencyProfileScreen> createState() => _AgencyProfileScreenState();
// }

// class _AgencyProfileScreenState extends State<AgencyProfileScreen> {
//   User? user = FirebaseAuth.instance.currentUser;
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      context.read<AgencyBloc>().add(GetAgencyData());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               decoration: BoxDecoration(color: Colors.black),
//             ),
//           ),
//           Positioned(
//             bottom: 5,
//             left: 0,
//             right: 0,
//             child: Container(
//                 height: MediaQuery.of(context).size.height * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(20),
//                 child: BlocBuilder<AgencyBloc, AgencyState>(
//                   builder: (context, state) {
//                     if (state is AgencyLodedState) {
//                       List<AgencyModel> data=state.agencyData;
//                       return ListView.builder(
//                         itemCount:data.length,
//                         itemBuilder: (context, Index) {
//                           return Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 120,
//                                       width: 120,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(30),
//                                         image:data[Index].profile !=
//                                                 null
//                                             ? DecorationImage(
//                                                 image: NetworkImage(
//                                                     data[Index].profile),
//                                                 fit: BoxFit.cover,
//                                               )
//                                             : null,
//                                       ),
//                                       child: data[Index].profile
//                                                ==
//                                               null
//                                           ? Center(
//                                               child: Icon(
//                                                 Icons.person,
//                                                 size:
//                                                     60, // Adjust the size as needed
//                                                 color: Colors
//                                                     .grey, // Adjust the color as needed
//                                               ),
//                                             )
//                                           : null,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                               '${data[Index].name}',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600)),
//                                           Text(
//                                               '${data[Index].email}')
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               ListTile(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             AgencyProfileEditScreen(
//                                          agency: data[Index],
//                                         ),
//                                       ));
//                                 },
//                                 leading: Icon(
//                                   Icons.person_outline,
//                                   color: Colors.blue,
//                                 ),
//                                 title: Text(
//                                   'Profile Detials',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 subtitle: Text('View & Edit Detials'),
//                                 trailing: Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               Divider(),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.edit_document,
//                                   color: Colors.blue,
//                                 ),
//                                 title: Text(
//                                   'Terms of Use',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 trailing: Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.lock,
//                                   color: Colors.blue,
//                                 ),
//                                 title: Text(
//                                   'Privacy Policy',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 trailing: Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }else if(state is AgencyLoadingState){
//                       return Center(child: CircularProgressIndicator(),);
//                     }else{
//                       return Container(
//                         child: Text("Error is Occure"),
//                       );
//                     }
//                   }
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }

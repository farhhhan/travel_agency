// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:travel_agency/agency/Blocss/getAgency/bloc/agency_bloc.dart';
// import 'package:travel_agency/agency/Model/agencyModel.dart';
// import 'package:travel_agency/agency/agency_model.dart';
// import 'Blocss/bloc/bloc_image/bloc/img_bloc_bloc.dart';

// class AgencyProfileEditScreen extends StatefulWidget {
//   AgencyProfileEditScreen({required this.agency, Key? key}) : super(key: key);
//   final AgencyModel agency;

//   @override
//   State<AgencyProfileEditScreen> createState() =>
//       _AgencyProfileEditScreenState();
// }

// class _AgencyProfileEditScreenState extends State<AgencyProfileEditScreen> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.agency.name;
//     emailController.text = widget.agency.email;
//   }

//   @override
//   Widget build(BuildContext context) {
      
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           fit: StackFit.expand,
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 decoration: BoxDecoration(color: Colors.black),
//               ),
//             ),
//             Positioned(
//               top: 20,
//               left: 20,
//               right: 10,
//               child: Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       child: Center(
//                         child: Icon(
//                           Icons.arrow_back,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 5,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             onTap: () => _showBottomSheet(context),
//                             child: BlocBuilder<ImgBlocBloc, ImgBlocState>(
//                               builder: (context, state) {
//                                 return CircleAvatar(
//                                   maxRadius: 70,
//                                   backgroundImage: state.file != null
//                                       ? FileImage(
//                                           File(state.file!.path),
//                                         )
//                                       : null,
//                                   child: state.file == null
//                                       ? Image.network(widget.agency.profile)
//                                       : null,
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         hintText: 'Name',
//                         label: Text('Name'),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: emailController,
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         label: Text('Email'),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         BlocBuilder<ImgBlocBloc, ImgBlocState>(
//                           builder: (context, state) {
//                             return InkWell(
//                               onTap: () async {
//                                 await _updateAgency(state.file!);
//                               context.read<AgencyBloc>().add(GetAgencyData());
//                               Future.delayed(Duration(seconds: 2));
//                               Navigator.pop(context);
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: 300,
//                                 decoration: BoxDecoration(
//                                   color: Colors.blue[900],
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20.0)),
//                                 ),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Text(
//                                       "Register",
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<dynamic> _showBottomSheet(BuildContext context) {
//     return showModalBottomSheet<dynamic>(
//         useRootNavigator: true,
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext bc) {
//           return BlocBuilder<ImgBlocBloc, ImgBlocState>(
//             builder: (context, state) {
//               return ListView(
//                 shrinkWrap: true,
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       context.read<ImgBlocBloc>().add(camerPickerEvent());
//                       Navigator.pop(context);
//                     },
//                     leading: Icon(Icons.camera),
//                     title: Text('Take Form Camera'),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       context.read<ImgBlocBloc>().add(gellaryPickerEvent());
//                       Navigator.pop(context);
//                     },
//                     leading: Icon(Icons.browse_gallery),
//                     title: Text('Take Form Gellary'),
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//   }

//   Future<void> _updateAgency(XFile imageFile) async {
//     // Update the AgencyModel instance with the new values
//     widget.agency.name = nameController.text;

//     // Update the profile picture if it's changed
//     if (imageFile != null) {
//       // Upload the image to Firebase Storage
//       firebase_storage.Reference ref =
//           firebase_storage.FirebaseStorage.instance.ref('/foldername' + '1224');
//       firebase_storage.UploadTask uploadTask = ref.putFile(File(imageFile.path));
//       await uploadTask;

//       // Get the download URL of the uploaded image
//       String newUrl = await ref.getDownloadURL();

//       // Update the profile property of the AgencyModel instance
//       widget.agency.profile = newUrl ?? widget.agency.profile;
//     }

//     // Update the AgencyModel instance in Firestore
//     FirebaseFirestore.instance
//         .collection('agency')
//         .doc(widget.agency.uid)
//         .update(widget.agency.toJson());
//   }
// }

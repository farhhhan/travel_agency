import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_agency/agency/Repositrys/firestorgeSignUp.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storge;

import 'Blocss/bloc/bloc_image/bloc/img_bloc_bloc.dart';

class UserRegister extends StatefulWidget {
  UserRegister({
    Key? key,
  }) : super(key: key);
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImgBlocBloc, ImgBlocState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              child: Center(
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sign Up for a',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'New Account',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Please Register to continue our app',
                        style: GoogleFonts.abel(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => ShowBottoms(context),
                            child: CircleAvatar(
                              maxRadius: 70,
                              backgroundImage: state.file != null
                                  ? FileImage(
                                      File(state.file!.path),
                                    )
                                  : null,
                              child: state.file == null
                                  ? Icon(
                                      Icons.person,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      TextFormField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.verified_user),
                          ),
                          labelText: 'User Name',
                          hintText: 'User Name',
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.mail),
                          ),
                          labelText: 'E-mail Address',
                          hintText: 'Email',
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Add your email validation logic here if needed
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.password_rounded),
                          ),
                          labelText: 'Password',
                          hintText: 'Password',
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          // Add your password validation logic here if needed
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.password_rounded),
                          ),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate() &&
                                  state.file != null) {
                                // All fields are valid, continue with registration
                                firebase_storge.Reference ref = firebase_storge
                                    .FirebaseStorage.instance
                                    .ref('/foldername' + '1224');
                                firebase_storge.UploadTask uploadTask =
                                    ref.putFile(File(state.file!.path));
                                Future.value(uploadTask).then((value) async {
                                  var newUrl = await ref.getDownloadURL();
                                  FireStoreUser().registerUser(
                                    imageurls: newUrl.toString(),
                                    context: context,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    username: _userNameController.text,
                                  );
                                });
                              } else {
                                var snackBar =
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                     backgroundColor: Colors.grey[400],
                                      content: Text('Please Fill All Field '));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> ShowBottoms(BuildContext context) {
    return showModalBottomSheet<dynamic>(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return BlocBuilder<ImgBlocBloc, ImgBlocState>(
            builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    onTap: () {
                      context.read<ImgBlocBloc>().add(camerPickerEvent());
                    },
                    leading: Icon(Icons.camera),
                    title: Text('Take Form Camera'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<ImgBlocBloc>().add(gellaryPickerEvent());
                    },
                    leading: Icon(Icons.browse_gallery),
                    title: Text('Take Form Gellary'),
                  ),
                ],
              );
            },
          );
        });
  }
}

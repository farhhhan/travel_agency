import 'package:flutter/material.dart';
import 'package:travel_agency/agency/agency_Navigator.dart';
import 'package:travel_agency/agency/Repositrys/auth.dart';
import 'package:travel_agency/agency/userRegister.dart';
import 'package:travel_agency/agency/util.dart';


class AgencyLoginScreen extends StatefulWidget {
  const AgencyLoginScreen({Key? key}) : super(key: key);

  @override
  _AgencyLoginScreenState createState() => _AgencyLoginScreenState();
}

class _AgencyLoginScreenState extends State<AgencyLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuthentServices _authServices = FirebaseAuthentServices();
  bool isLoading = false;
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/travel-agent.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.68,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(40),
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'E-mail Address',
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              _authServices.forgetPassword(_emailController.text);
                            },
                            child: Text('Forgot Password?'),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      InkWell(
                        onTap: () {
                          _signIn(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: (isLoading)
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.035),
                      Text('Or Login Via'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.034),
                      InkWell(
                        onTap: () => FirebaseAuthentServices().signInWithGoogle(context,false),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                          maxRadius: 20,
                                          child: Image.asset(
                                            'images/google1.png',
                                            fit: BoxFit.fill,
                                          )),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      Text(
                                        'Continue With Google',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserRegister(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

   void _signIn(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    setState(() {
      isLoading = true;
    });
    await _authServices
        .signInWithEmailandPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AgencyNavigator()));
      utils().showToast('Login Succesfully');
      setState(() {
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      utils().showToast(error.toString());
      setState(() {
        isLoading = false;
      });
    });
  }
}

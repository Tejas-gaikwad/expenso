import 'package:expense_app/home.dart';
import 'package:expense_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool authLoading = false;

  Future<User?> _signInWithGoogle() async {
    setState(() {
      authLoading = true;
    });
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      return user;
    } catch(err){
      setState(() {
        authLoading = false;
      });
      print("err ---  $err");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Authentication", textAlign: TextAlign.center, style: TextStyle( fontSize: 35,color: white, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  User? user = await _signInWithGoogle();
                  setState(() {
                    authLoading = false;
                  });
                  print("user   ---   ${user}");
                  if (user != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(user: user),
                    ));
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: white, ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: authLoading  ? const Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: white, strokeWidth: 2.0,)),
                  ) : const Text(
                    "Sign in with Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 14,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:expense_app/core/di/app_dependency_injection.dart';
import 'package:expense_app/home.dart';
import 'package:expense_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthenticationBloc authBloc = AppDependencyInjection.getIt.get();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: BlocConsumer(
          bloc: authBloc,
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Authentication", textAlign: TextAlign.center, style: TextStyle( fontSize: 35,color: white, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () async {

                      authBloc.add(GoogleLoginEvent());

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: white, ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: (state is GoogleLoginLoadingState)  ? const Center(
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
            );
          },
          listener: (context, state) {

            if(state is GoogleLoginErrorState ){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error, While Google Login.")));
            }

            if(state is GoogleLoginSuccessfulState || state is NewGoogleLoginSuccessfulState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success, You Logged in Successfully.")));
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return const Home();
              },), (route) => false,);
            }

          },
        )
      ),
    );
  }
}

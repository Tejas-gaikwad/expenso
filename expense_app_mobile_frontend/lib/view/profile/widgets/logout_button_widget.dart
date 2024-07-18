import 'package:expense_app/view/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/authentication_bloc.dart';
import '../../../core/di/app_dependency_injection.dart';
import '../../../core/utils/colors.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authBloc = AppDependencyInjection.getIt.get();
    return BlocConsumer(
      bloc: authBloc,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            authBloc.add(const LogoutUserEvent());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: (state is AuthenticationLoadingState)
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : const Text(
                    "Log Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LogoutErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error, While Logging Out.")));
        }
        if (state is LogoutSuccessfulState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }
}

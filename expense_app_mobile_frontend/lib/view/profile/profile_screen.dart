import 'package:expense_app/view/auth/bloc/authentication_bloc.dart';
import 'package:expense_app/core/di/app_dependency_injection.dart';
import 'package:expense_app/view/profile/widgets/logout_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/shared_prefs.dart';
import '../../core/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  final String displayName;
  const ProfileScreen({
    super.key,
    required this.displayName,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthenticationBloc authBloc = AppDependencyInjection.getIt.get();
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    final uid = SharedPreferencesManager.getUserId();
    authBloc.add(GetUserInfoEvent(userId: uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile"),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                darkMode = !darkMode;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: darkMode ? neon : white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.dark_mode_outlined),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: BlocConsumer(
        bloc: authBloc,
        builder: (context, state) {
          if (state is UserDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserDataLoadedState) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      profileCard(
                        userName: state.userData.fullName,
                        userEmail: state.userData.email,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider()),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                const LogoutButtonWidget(),
              ],
            );
          }
          return const SizedBox();
        },
        listener: (context, state) {},
      )),
    );
  }

  Widget profileCard({
    String? userName,
    String? userEmail,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.sta,
        children: [
          const SizedBox(width: 20),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(color: black),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                  "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352010-stock-illustration-default-placeholder-man-and-woman.jpg"),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName ?? "",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  userEmail ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

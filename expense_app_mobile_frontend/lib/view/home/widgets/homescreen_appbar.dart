import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/shared_prefs.dart';
import '../../../core/di/app_dependency_injection.dart';
import '../../auth/bloc/authentication_bloc.dart';
import '../../profile/profile_screen.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  AuthenticationBloc authBloc = AppDependencyInjection.getIt.get();
  @override
  void initState() {
    super.initState();
    final uid = SharedPreferencesManager.getUserId();
    authBloc.add(GetUserInfoEvent(userId: uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, state) {
        if (state is UserDataLoadedState) {
          return appBarWidget(
            context: context,
            userName: state.userData.fullName,
            userImage: state.userData.userProfilePicture,
          );
        }
        return appBarWidget(context: context);
      },
    );
  }

  Widget appBarWidget(
      {required BuildContext context, String? userName, String? userImage}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Hey, ${userName ?? ""}'),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    displayName: userName ?? "",
                  ),
                ));
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(userImage ??
                    "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352010-stock-illustration-default-placeholder-man-and-woman.jpg")),
          ),
        ),
      ],
    );
  }
}

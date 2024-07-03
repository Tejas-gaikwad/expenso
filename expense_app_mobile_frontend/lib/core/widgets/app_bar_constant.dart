import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/app_dependency_injection.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class AppBarConstantWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarConstantWidget({super.key});

  @override
  State<AppBarConstantWidget> createState() => _AppBarConstantWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarConstantWidgetState extends State<AppBarConstantWidget> {
  // final ProfileBloc profileBloc = AppDependencyInjection.getIt.get();

  @override
  void initState() {
    super.initState();
    // profileBloc.add(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const SizedBox(),
      leadingWidth: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Genericarts",
                style: AppTextStyle.boldText14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.secondaryColor,
                size: 20,
              ),
            ],
          ),
          // (username != null)
          //     ?
          Text(
            "Hello, username", //${username}
            style: AppTextStyle.bodyText14.copyWith(
              color: AppColors.secondaryColor,
            ),
          )
          // : const SizedBox(),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.notifications_none,
              color: AppColors.textColor,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return CartAllItemsScreen();
            //   },
            // ));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );

    // BlocConsumer(
    //   bloc: profileBloc,
    //   builder: (context, state) {
    //     if (state is ProfileLoadedState) {
    //       return
    // appBarWidget(username: "username"); // state.profile.name
    //       }
    //       return appBarWidget();
    //     },
    //     listener: (context, state) {},
    //   );
    // }

//   Widget appBarWidget({String? username}) {
//     return  AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: const SizedBox(),
//       leadingWidth: 0,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "Genericarts",
//                 style: AppTextStyle.boldText14.copyWith(
//                   color: AppColors.k1045a1,
//                 ),
//               ),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: AppColors.k1045a1,
//                 size: 20,
//               ),
//             ],
//           ),
//           (username != null)
//               ? Text(
//                   "Hello, ${username}",
//                   style: AppTextStyle.bodyText14.copyWith(
//                     color: AppColors.buttonBgColor,
//                   ),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//       actions: [
//         InkWell(
//           onTap: () {},
//           child: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Icon(
//               Icons.notifications_none,
//               color: AppColors.textColor,
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) {
//                 return CartAllItemsScreen();
//               },
//             ));
//           },
//           child: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Icon(
//               Icons.shopping_cart_outlined,
//               color: AppColors.textColor,
//             ),
//           ),
//         ),
//       ],
//     );
//  }
  }
}

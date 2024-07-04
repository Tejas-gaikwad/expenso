
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_layer/clients/login_api_client.dart';
import '../core/logs/logger/app_logger.dart';
import '../model/api_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../model/user_model.dart';

class ExpenseService {
  final AppLogger appLogger;
  final LoginApiClient? loginApiClient;
  ExpenseService({required this.appLogger, this.loginApiClient});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<ApiResponse> addExpense() async {
    try {


      // TODO change this logic as per the lgoic
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final userData = await auth.signInWithCredential(credential);
      String uid = userData.user?.uid ?? '';
      DocumentReference userDocRef = _firestore.collection('users').doc(uid);
      final snapshot = await userDocRef.get();
      if (snapshot.exists) {
        final userParsedData = UserDataModel(
          uid: uid,
          fullName: userData.user?.displayName ?? '',
          email: userData.user?.email ?? '',
          imagePath: userData.user?.photoURL ?? '',
          mobileNo: userData.user?.phoneNumber ?? '',
        );

        await prefs.setBool('isLoggedIn', true);
        return ApiResponse(
          statusCode: '200',
          message: 'message',
          data: userParsedData.toJson(),
        );
      } else {
        final messagingData = await FirebaseMessaging.instance.getToken();
        final data = messagingData;
        final userProfilePicture = userData.user?.photoURL;
        final userParsedData = UserDataModel(
          uid: uid,
          fullName: userData.user?.displayName ?? '',
          email: userData.user?.email ?? '',
          imagePath: userData.user?.photoURL ?? '',
          userProfilePicture: userProfilePicture,
        );
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'uid': uid,
          'fullName': userData.user?.displayName,
          'email': userData.user?.email,
          'mobileNo': '',
          'fcmToken': data,
          'userSocieties': [],
          'userProfilePicture': userProfilePicture,
        });
        return ApiResponse(
            statusCode: '202',
            message: 'message',
            data: userParsedData.toJson());
      }
    } catch (e) {
      print(" google login Error -->>    $e");
      return ApiResponse(
          statusCode: '400',
          message: 'Error while google login',
          data: {'error': e});
    }
  }

}
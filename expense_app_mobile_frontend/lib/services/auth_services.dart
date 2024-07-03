
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_layer/clients/login_api_client.dart';
import '../core/logs/logger/app_logger.dart';
import '../model/api_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../model/user_model.dart';

class AuthService {
  final AppLogger appLogger;
  final LoginApiClient? loginApiClient;
  AuthService({required this.appLogger, this.loginApiClient});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<ApiResponse> googleLogin() async {
    try {
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

  Future<ApiResponse> googleLogout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await googleSignIn.signOut();
      await prefs.setBool('isLoggedIn', false);
      return ApiResponse(
          statusCode: '200', message: 'Logout Successful', data: {});
    } catch (e) {
      print(" google logout Error -->>    $e");
      return ApiResponse(
          statusCode: '400',
          message: 'Error while google Logout',
          data: {'error': e});
    }
  }

  Future<ApiResponse> getUserInformation({required  String userId}) async {
    try{

      final DocumentReference userIdCollection = FirebaseFirestore.instance.collection('users').doc(userId);
      final responseData = await userIdCollection.get();
      final data = responseData.data() ;
      if(data == null) {
        return ApiResponse(
            statusCode: '404', message: 'User not Available', data: {
          'error': 'User not Available'
        });
      }
      return ApiResponse(statusCode: '200', message: 'Data stored successfully', data: data as Map<String, dynamic>);
    }
    catch(error){
      return ApiResponse(statusCode: '400', message: 'Error while Creating Society', data: {});
    }
  }

  Future<ApiResponse> registerUser(
      {required String email,
        required String password,
        required String fullName,
        required String mobileNo}) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user?.uid ?? '';
      final userProfilePicture = userCredential.user?.photoURL;
      final messagingData = await FirebaseMessaging.instance.getToken();
      final fcmToken = messagingData;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'mobileNo': mobileNo,
        'fcmToken': fcmToken,
        'userSocieties': [],
        'userProfilePicture': userProfilePicture,
      });
      return ApiResponse(
          statusCode: '200', message: 'message', data: {'uid': uid});
    } catch (error) {
      print('UserRegistration error ->>>   ${error}');
      rethrow;
    }
  }

  Future<ApiResponse> updateUser({
    String? email,
    required String fullName,
    required String mobileNo,
    required String state,
    required int? pinCode,
    String? country,
    required String city,
    required String address,
    String? userProfilePicture,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      String uid = user?.uid ?? '';
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'fullName': fullName,
        'mobileNo': mobileNo,
        'state': state,
        'country': country,
        'city': city,
        'pinCode': pinCode,
        'address': address,
        'userProfilePicture': userProfilePicture,
      });
      return ApiResponse(
          statusCode: '200', message: 'Data Updated Successfully.', data: {});
    } catch (error) {
      print('UserRegistration error ->>>   ${error}');
      return ApiResponse(
          statusCode: '400', message: 'Error while Updating data.', data: {});
    }
  }

  Future<ApiResponse> updateUserType({
    required String userId,
    required String userType,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'userType': userType,
      });
      return ApiResponse(
          statusCode: '200', message: 'Type Updated Successfully.', data: {});
    } catch (error) {
      print('UserType update error ->>>   $error');
      return ApiResponse(
          statusCode: '400', message: 'Error while Updating Type.', data: {});
    }
  }

  Future<ApiResponse> changeUserType({
    required String societyId,
    required String userId,
    required String userType,
  }) async {
    try {
      final CollectionReference societyCollection =
      FirebaseFirestore.instance.collection('society');
      final DocumentReference userIdCollection =
      FirebaseFirestore.instance.collection('users').doc(userId);
      final CollectionReference userSocietyCollection =
      userIdCollection.collection('society');
      final DocumentReference socIdRef = societyCollection.doc(societyId);

      await socIdRef
          .collection('members')
          .doc(userId)
          .update({'userType': userType});

      await userSocietyCollection.doc(societyId).update({'userType': userType});

      print('DONE ->>>  Type Changed Successfully  ${userType}');

      return ApiResponse(
          statusCode: '200', message: 'Type Changed Successfully', data: {});
    } catch (error) {
      print('ERROR ->>>  Creating society error   ${error}');
      return ApiResponse(
          statusCode: '400', message: 'Error while Creating Society', data: {});
    }
  }





}
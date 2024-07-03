import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/logs/logger/app_logger.dart';
import '../../model/user_model.dart';
import '../../services/auth_services.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepo;
  final AppLogger _appLogger;
  AuthenticationBloc(this.authRepo, this._appLogger) : super(AuthenticationInitialState()) {


    on<GoogleLoginEvent>((event, emit) async {
      try {
        emit(GoogleLoginLoadingState());
        final responseData = await authRepo.googleLogin();
        final userParsedData = UserDataModel.fromJson(responseData.data);



        if (responseData.statusCode == '202') {
          emit(NewGoogleLoginSuccessfulState(userData: userParsedData));
        } else {
          emit(GoogleLoginSuccessfulState(userData: userParsedData));
        }
      } catch (e) {
        print(" google login Error -->>    $e");
        emit(const GoogleLoginErrorState(
            errorMessage: "Authentication Error..."));
        return;
      }
    });

    on<GetUserInfoEvent>((event, emit) async {
      try {
        emit(const UserDataLoadingState());
        final responseData =
            await authRepo.getUserInformationService(userId: event.userId);
        final userParsedData = UserDataModel.fromJson(responseData.data);
        emit(UserDataLoadedState(userData: userParsedData));
      } catch (e) {
        print(" UserData getting  Error -->>    $e");
        emit(
            const UserLoginErrorState(errorMessage: "Authentication Error..."));
        return;
      }
    });

    on<LogoutUserEvent>((event, emit) async {
      try {
        final responseData = await authRepo.googleLogout();
        emit(AuthenticationLoadingState());
        await Future.delayed(const Duration(seconds: 2));
        if (responseData.statusCode == '200') {
          emit(const LogoutSuccessfulState());
          emit(LogoutNavigationState());
        } else {
          emit(LogoutErrorState());
        }
      } catch (e) {
        print("Logout Error -->>    $e");
        emit(AuthenticationRemoveLoaderState());
        return;
      }
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final res = await authRepo.registerUser(
          email: event.email,
          password: event.password,
          fullName: event.fullName,
          mobileNo: event.mobileNo.toString(),
        );

        final uid = res.data['uid'];

        final userData = UserDataModel(
          uid: uid,
          fullName: event.fullName,
          email: event.email,
        );

        emit(UserRegisterSuccessfulState(userData: userData));
      } on FirebaseAuthException catch (e) {
        emit(UserRegisterErrorState(
            error: e.message ?? 'Error while registering user.'));
        print('user login error: $e');
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(UpdateUserLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        authRepo.updateUser(
          country: event.country ?? '',
          email: event.email,
          fullName: event.fullName,
          mobileNo: event.mobileNo.toString(),
          address: event.address ?? '',
          city: event.city ?? '',
          pinCode: event.pinCode,
          state: event.state ?? '',
        );

        emit(UserUpdateSuccessfulState());
      } on FirebaseAuthException catch (e) {
        emit(UserUpdateErrorState(
            error: e.message ?? 'Error while updating user.'));
        print('user update error: $e');
      }
    });

    on<LoginUserWithEmailAndPassword>((event, emit) async {
      try {
        emit(AuthenticationLoadingState());
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        if (userCredential.user == null) {
          emit(AuthenticationErrorState());
        } else {
          emit(AuthenticationSuccessfulState(
            userData: UserDataModel(
              uid: userCredential.user?.uid ?? '',
              fullName: userCredential.user?.displayName ?? '',
              email: userCredential.user?.email ?? "",
            ),
          ));
        }
      } on FirebaseAuthException catch (e) {
        print('user login error: $e');
        emit(UserLoginErrorState(errorMessage: e.message ?? "Error..."));
      }
    });

    on<ChangeUserTypeEvent>((event, emit) async {
      emit(const ChangeUserTypeLoadingState());

      await authRepo.changeUserType(
        societyId: event.societyId,
        userId: event.userId,
        userType: event.userType,
      );

      await Future.delayed(const Duration(seconds: 2));

      emit(const ChangeUserTypeDoneState());
    });
  }
}

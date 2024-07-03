
import 'package:expense_app/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

import '../../auth/bloc/authentication_bloc.dart';
import '../../services/auth_services.dart';
import '../logs/logger/app_logger.dart';

class AppDependencyInjection {
  static final getIt = GetIt.instance;
  static void initDiServices() {
    initDiApiServices();
    initDiApiClients();
    initDiBlocs();
    initRepos();
    initOthers();
  }

  // init api clients
  static void initDiApiClients() {}

  // init all the api services
  static void initDiApiServices() {
    getIt.registerLazySingleton<AuthService>(
    () => AuthService(appLogger: getIt.get(), loginApiClient: null));

  }

// init all the blocs
  static void initDiBlocs() {

    getIt.registerLazySingleton<AuthenticationBloc>(
        () => AuthenticationBloc(getIt.get<AuthRepository>(), getIt.get<AppLogger>()));
  }

  // init Repos
  static void initRepos() {
    getIt.registerLazySingleton(() => AuthRepository(
        authServices: getIt.get<AuthService>(),
        appLogger: getIt.get<AppLogger>()));
  }

// init others
  static void initOthers() {
    getIt.registerLazySingleton<AppLogger>(() => AppLogger.getInstance);
  }
}

import 'package:expense_app/view/add_expense_flow/bloc/expense_bloc.dart';
import 'package:expense_app/repository/auth_repository.dart';
import 'package:expense_app/repository/expense_repo.dart';
import 'package:expense_app/services/expense_services.dart';
import 'package:get_it/get_it.dart';

import '../../view/auth/bloc/authentication_bloc.dart';
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
        () => AuthService(appLogger: getIt.get()));

    getIt.registerLazySingleton<ExpenseService>(
        () => ExpenseService(appLogger: getIt.get()));
  }

// init all the blocs
  static void initDiBlocs() {
    getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(
        getIt.get<AuthRepository>(), getIt.get<AppLogger>()));

    getIt.registerLazySingleton<ExpenseBloc>(
        () => ExpenseBloc(getIt.get<ExpenseRepo>(), getIt.get<AppLogger>()));
  }

  // init Repos
  static void initRepos() {
    getIt.registerLazySingleton(() => AuthRepository(
        authServices: getIt.get<AuthService>(),
        appLogger: getIt.get<AppLogger>()));

    getIt.registerLazySingleton(() => ExpenseRepo(
        expenseServices: getIt.get<ExpenseService>(),
        appLogger: getIt.get<AppLogger>()));
  }

// init others
  static void initOthers() {
    getIt.registerLazySingleton<AppLogger>(() => AppLogger.getInstance);
  }
}

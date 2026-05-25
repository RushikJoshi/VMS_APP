import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../features/company_management/data/repositories/company_repository_impl.dart';
import '../../features/company_management/domain/repositories/company_repository.dart';
import '../../features/company_management/presentation/bloc/company_bloc.dart';

// Phase 3 placeholders
import '../../features/user_management/domain/repositories/user_repository.dart';
import '../../features/user_management/presentation/bloc/user_bloc.dart';
import '../../features/subscription_management/domain/repositories/subscription_repository.dart';
import '../../features/subscription_management/presentation/bloc/subscription_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerFactory(() => CompanyBloc(repository: sl()));
  
  // Repositories
  sl.registerLazySingleton<CompanyRepository>(() => CompanyRepositoryImpl(dio: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
}

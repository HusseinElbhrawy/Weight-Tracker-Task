import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:weight_tracker/features/login/data/datasources/login_remote_datasource.dart';
import 'package:weight_tracker/features/login/data/repositories/login_repo_imp.dart';
import 'package:weight_tracker/features/login/domain/repositories/login_repo.dart';
import 'package:weight_tracker/features/login/domain/usecases/log_out_usecase.dart';
import 'package:weight_tracker/features/login/domain/usecases/sign_in_anny_usecase.dart';
import 'package:weight_tracker/features/login/presentation/cubit/login_cubit.dart';
import 'package:weight_tracker/features/weight/data/datasources/weight_remote_datasouce.dart';
import 'package:weight_tracker/features/weight/data/repositories/weight_repo_impl.dart';
import 'package:weight_tracker/features/weight/domain/repositories/weight_repo.dart';
import 'package:weight_tracker/features/weight/domain/usecases/delete_weight_usecase.dart';
import 'package:weight_tracker/features/weight/domain/usecases/saved_weight_usecase.dart';
import 'package:weight_tracker/features/weight/domain/usecases/update_weight_usecase.dart';
import 'package:weight_tracker/features/weight/presentation/cubit/weight_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //!Feature
  //Bloc

  serviceLocator.registerFactory(
    () => LoginCubit(
      logOutUseCase: serviceLocator(),
      signInAnonymousUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => WeightCubit(
      savedDataUseCase: serviceLocator(),
      deleteWeightUseCase: serviceLocator(),
      updateWeightUseCase: serviceLocator(),
    ),
  );
  //use Case
  serviceLocator.registerLazySingleton(
    () => LogOutUseCase(
      loginRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => DeleteWeightUseCase(
      weightRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignInAnonymousUseCase(
      loginRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SavedWeightUseCase(
      weightRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => UpdateWeightUseCase(
      weightRepository: serviceLocator(),
    ),
  );

  //Repo
  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImplementation(
      loginRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<WeightRepository>(
    () => WeightRepositoryImplementation(
      weightRemoteDataSource: serviceLocator(),
    ),
  );

  //Data Source
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImplementation(
      firebaseAuth: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<WeightRemoteDataSource>(
    () => WeightRemoteDataSourceImplementation(
      firebaseFirestore: serviceLocator(),
    ),
  );

  //!Core

  //!External
  final firebase = await Firebase.initializeApp();
  final firebaseAuth = await FirebaseAuth.instance;
  final firebaseFirestore = await FirebaseFirestore.instance;
  serviceLocator.registerLazySingleton(() => firebase);
  serviceLocator.registerLazySingleton(() => firebaseFirestore);
  serviceLocator.registerLazySingleton(() => firebaseAuth);
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/features/space_feature/data/data_sources/nasa_local_data_source.dart';
import 'package:space_app/features/space_feature/data/data_sources/nasa_remote_data_source.dart';
import 'package:space_app/features/space_feature/data/repositories/nasa_repository_impl.dart';
import 'package:space_app/features/space_feature/domain/repositories/nasa_repository.dart';
import 'package:space_app/features/space_feature/domain/use_cases/get_mars_picture_use_case.dart';
import 'package:space_app/features/space_feature/domain/use_cases/get_picture_of_the_day_use_case.dart';
import 'package:space_app/features/space_feature/presentation/bloc/nasa_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //Bloc as a Factory
  serviceLocator.registerFactory(() => NasaBloc(pictureOfTheDayUseCase: serviceLocator(), marsPictureUseCase: serviceLocator()));

  //UseCases
  serviceLocator.registerLazySingleton(() => GetPictureOfTheDayUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetMarsPictureUseCase(serviceLocator()));

  //Repository
  serviceLocator.registerLazySingleton<NasaRepository>(() => NasaRepositoryImpl(remoteDataSource: serviceLocator(), localDataSource: serviceLocator()));

  //DataSource
  serviceLocator.registerLazySingleton<NasaRemoteDataSource>(() => NasaRemoteDataSourceImpl(client: serviceLocator()));
  serviceLocator.registerLazySingleton<NasaLocalDataSource>(() => NasaLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Dio());

}
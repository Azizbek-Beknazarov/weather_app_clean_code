import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ob_havo_app/features/data/datasource/obhavo_remote_datasource.dart';
import 'package:ob_havo_app/features/data/repository/obhavo_repo_impl.dart';
import 'package:ob_havo_app/features/domain/repository/obhavo_repo.dart';
import 'package:ob_havo_app/features/domain/usecase/get_obhavo_shaharnomi.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';


import 'core/network/network_info.dart';
import 'core/util/input_checker.dart';
final sl=GetIt.instance;

Future<void> init() async{
  //! Features - weather
  //bloc
  sl.registerFactory(
          () => ObHavoBloc(inputChecker: sl(), getObHavoDataShaharNomi: sl()));
  //Use Cases
  sl.registerLazySingleton(() => GetObHavoDataShaharNomi(sl()));
  // sl.registerLazySingleton(() => GetWeatherDataBylocation(sl()));
  // Repository
  sl.registerLazySingleton<ObHavoRepository>(() => ObHavoRepositoryImple(
      remoteDataSource: sl(), info: sl(), ));
  // Data sources
  sl.registerLazySingleton<ObHavoRemoteDataSource>(() =>
      ObHavoRemoteDataSourceImple(client: sl(), ));

  //! core
  sl.registerLazySingleton(() => InputChecker());
  sl.registerLazySingleton<NetworkInfo>(()=> NetworkInfoImple(checker: sl() ));
  //! External

  //geoLocator
  // sl.registerLazySingleton(()=> Geolocator());
  // Client
  sl.registerLazySingleton(()=> http.Client());
  // ConnectionChecker
  sl.registerLazySingleton(()=> InternetConnectionChecker());

}

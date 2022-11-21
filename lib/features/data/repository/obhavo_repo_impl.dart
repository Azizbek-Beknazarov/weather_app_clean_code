import 'package:dartz/dartz.dart';
import 'package:ob_havo_app/core/error/exception.dart';
import 'package:ob_havo_app/core/error/failure.dart';

import 'package:ob_havo_app/core/network/network_info.dart';
import 'package:ob_havo_app/features/data/datasource/obhavo_remote_datasource.dart';
import 'package:ob_havo_app/features/data/model/obhavo_model.dart';

import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

import '../../domain/repository/obhavo_repo.dart';

class ObHavoRepositoryImple implements ObHavoRepository {
  ObHavoRemoteDataSource remoteDataSource;
  // ObhavoLocalDatasource localDatasource;
  NetworkInfo info;

  ObHavoRepositoryImple({
    required this.remoteDataSource,
    // required this.localDatasource,
    required this.info,
  });

  @override
  Future<Either<Xato, ObHavoEntity>> obhavoOlishShaharNomiRepo(
      String shaharNomi) async {
    return await _getObHavo(
        () => remoteDataSource.getObhavoShaharNomiDatasourse(shaharNomi));
  }

  @override
  Future<Either<Xato, ObHavoEntity>> obhavoOlishLocationRepo() async {
    return await _getObHavo(
        () => remoteDataSource.getObhavoLocationDatasourse());
  }

  Future<Either<Xato, ObHavoEntity>> _getObHavo(
      Future<ObHavoModel> Function() chooser) async {
    if (await info.isConnection) {
      try {
        final havo = await chooser();
         // localDatasource.obhavoToCache(havo);
        return Right(havo);
      } on ServerException {
        return Left(ServerXato(xabar: 'Serverda xato bor'));
      }
    }
    else return Left(InternetXato(xabar: 'Internet ulanmagan'));
    // else {
    //   try {
    //     // final havo = await localDatasource.getOxirgiObhavo();
    //     return Right(havo);
    //   } on CacheException {
    //     return Left(CacheXato());
    //   }
    // }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ob_havo_app/core/error/exception.dart';

import 'package:ob_havo_app/core/error/failure.dart';
import 'package:ob_havo_app/core/network/network_info.dart';
import 'package:ob_havo_app/features/data/datasource/obhavo_remote_datasource.dart';

import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

import '../../domain/repository/obhavo_repo.dart';

class ObHavoRepositoryImple implements ObHavoRepository {
  ObHavoRemoteDataSource remoteDataSource;
  NetworkInfo info;

  ObHavoRepositoryImple({required this.remoteDataSource, required this.info});

  @override
  Future<Either<Xato, ObHavoEntity>> obhavoOlishShaharNomiRepo(
      String shaharNomi) async {
    if(await info.isConnection){
      try{
        final shahar=await remoteDataSource.getObhavoShaharNomiDatasourse(shaharNomi);
        return Right(shahar);
      }on ServerException{
        return Left(ServerXato(xabar: 'Obhavo repo impl xatosi'));
      }

    }
    else{
      return Left(CacheXato());
    }
  }
}

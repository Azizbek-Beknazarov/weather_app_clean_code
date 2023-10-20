import 'package:dartz/dartz.dart';
import 'package:ob_havo_app/core/error/failure.dart';
import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

abstract class ObHavoRepository {
  Future<Either<Xato, ObHavoEntity>> obhavoOlishShaharNomiRepo(
      String shaharNomi);

  Future<Either<Xato, ObHavoEntity>> obhavoOlishLocationRepo();
}

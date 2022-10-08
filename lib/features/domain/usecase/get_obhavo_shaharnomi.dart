import 'package:dartz/dartz.dart';
import 'package:ob_havo_app/core/error/failure.dart';
import 'package:ob_havo_app/core/usecase/use_case.dart';
import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';
import 'package:ob_havo_app/features/domain/repository/obhavo_repo.dart';

class GetObHavoDataShaharNomi implements UseCase<ObHavoEntity, ShaharParams> {
  final ObHavoRepository obHavoRepository;

  GetObHavoDataShaharNomi(this.obHavoRepository);

  @override
  Future<Either<Xato, ObHavoEntity>> call(ShaharParams params) async {
    return await obHavoRepository.obhavoOlishShaharNomiRepo(params.shaharNomi);
  }
}

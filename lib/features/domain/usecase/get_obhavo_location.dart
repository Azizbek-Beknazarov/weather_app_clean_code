import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ob_havo_app/core/error/failure.dart';
import 'package:ob_havo_app/core/usecase/use_case.dart';
import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

import '../repository/obhavo_repo.dart';

class GetObHavoDataLocation implements UseCase<ObHavoEntity, NoParams> {
  final ObHavoRepository obHavoRepository;

  GetObHavoDataLocation(this.obHavoRepository);

  @override
  Future<Either<Xato, ObHavoEntity>> call(params) async {
    return await obHavoRepository.obhavoOlishLocationRepo();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

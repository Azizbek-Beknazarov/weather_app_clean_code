import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ob_havo_app/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Xato, Type>> call(Params params);
}

class ShaharParams extends Equatable {
 final String shaharNomi;

  ShaharParams({required this.shaharNomi});

  @override
  List<Object?> get props => [shaharNomi];
}

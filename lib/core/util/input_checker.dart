import 'package:dartz/dartz.dart';
import 'package:ob_havo_app/core/error/failure.dart';

class InputChecker {
  Either<Xato,String> checkOfStringInput(String value) {
    value = value.toLowerCase().trim();

    List<String> values = value.split(" ");
    RegExp expLower = RegExp(r'^[a-z]+$');

    for(String val in values){
      if(!expLower.hasMatch(val) ){
        return Left(InvalidInputXato());
      }
    }
    return Right(value.trim());
  }
}
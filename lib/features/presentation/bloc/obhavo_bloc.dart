

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/core/error/failure.dart';
import 'package:ob_havo_app/core/usecase/use_case.dart';
import 'package:ob_havo_app/features/domain/usecase/get_obhavo_location.dart';

import '../../../core/util/input_checker.dart';
import '../../domain/entity/obhavo_entity.dart';
import '../../domain/usecase/get_obhavo_shaharnomi.dart';
import 'package:ob_havo_app/core/util/constants.dart' as constants;


part 'obhavo_event.dart';

part 'obhavo_state.dart';



class ObHavoBloc extends Bloc<ObHavoEvent, ObHavoState> {
  final GetObHavoDataShaharNomi getObHavoDataShaharNomi;
  final GetObHavoDataLocation getObHavoDataLocation;
  final InputChecker inputChecker;

  ObHavoBloc(
      {required this.getObHavoDataShaharNomi,required this.getObHavoDataLocation, required this.inputChecker})
      : super(InitialObHavo()) {
    //1-event
    on<GetObHavoShaharNomiEvent>((event, emit) async {
      //
      final Either inputEither =
          inputChecker.checkOfStringInput(event.shaharNomi);
      //
      await inputEither
          .fold((xato) async => emit(ErrorObHavo(errorXabar:_mapFailureToMessage(xato) )),
              (shahar) async {
        //fold ichida fold
        emit(LoadingObHavo());
        //
        final xatoOrObhavo =
            await getObHavoDataShaharNomi(ShaharParams(shaharNomi: shahar));
        xatoOrObhavo.fold(
            (l) => emit(ErrorObHavo(errorXabar:_mapFailureToMessage(l))),
            (shahar) => emit(LoadedObHavo(obhavo: shahar)));
      });
    });

    // 2-event
    on<GetObHavoLocationEvent>((event,emit)async{
      emit(LoadingObHavo());
      final xatoOrObhavo =await getObHavoDataLocation(NoParams());
      xatoOrObhavo.fold((l) => emit(ErrorObHavo(errorXabar: _mapFailureToMessage(l))),
              (shahar) =>emit(LoadedObHavo(obhavo: shahar)) );
    });
  }

  String _mapFailureToMessage(Xato failure) {
    switch (failure.runtimeType) {
      case ServerXato:
        return constants.Constants.SERVER_XATO_XABAR;
      case InternetXato:
        return constants.Constants.INTERNET_XATO_XABAR;
      case InvalidInputXato:
        return constants.Constants.INVALID_INPUT_XATO_XABAR;
      default:
        return 'Unexpected Error';
    }
  }

}

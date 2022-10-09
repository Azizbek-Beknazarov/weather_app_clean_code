

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/core/usecase/use_case.dart';

import '../../../core/util/input_checker.dart';
import '../../domain/entity/obhavo_entity.dart';
import '../../domain/usecase/get_obhavo_shaharnomi.dart';
import 'package:ob_havo_app/core/util/constants.dart' as constants;


part 'obhavo_event.dart';

part 'obhavo_state.dart';



class ObHavoBloc extends Bloc<ObHavoEvent, ObHavoState> {
  final GetObHavoDataShaharNomi getObHavoDataShaharNomi;
  final InputChecker inputChecker;

  ObHavoBloc(
      {required this.getObHavoDataShaharNomi, required this.inputChecker})
      : super(InitialObHavo()) {
    //1-event
    on<GetObHavoShaharNomiEvent>((event, emit) async {
      //
      final Either inputEither =
          inputChecker.checkOfStringInput(event.shaharNomi);
      //
      await inputEither
          .fold((xato) async => emit(ErrorObHavo(errorXabar:constants.Constants.SERVER_XATO_XABAR )),
              (shahar) async {
        //fold ichida fold
        emit(LoadingObHavo());
        //
        final xatoOrObhavo =
            await getObHavoDataShaharNomi(ShaharParams(shaharNomi: shahar));
        xatoOrObhavo.fold(
            (l) => emit(ErrorObHavo(errorXabar: constants.Constants.CACHE_XATO_XABAR)),
            (shahar) => emit(LoadedObHavo(obhavo: shahar)));
      });
    });
  }
}

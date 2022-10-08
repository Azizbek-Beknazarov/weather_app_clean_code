import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/core/usecase/use_case.dart';

import '../../../core/util/input_checker.dart';
import '../../domain/entity/obhavo_entity.dart';
import '../../domain/usecase/get_obhavo_shaharnomi.dart';

part 'obhavo_event.dart';

part 'obhavo_state.dart';

const String SERVER_XATO_XABAR = 'Shahar topilmadi';

// const String LOCATION_DISABLED_FAILURE_MESSAGE =
//     'Location services is not enabled';
// const String LOCATION_PERMESSION_FAILURE_MESSAGE =
//     'Location permession is denied';

const String CACHE_XATO_XABAR = 'Internet ulanmagan';
const String INVALID_INPUT_XATO_XABAR = 'Shahar nomi noto\'g\'ri';

class ObHavoBloc extends Bloc<ObHavoEvent, ObHavoState> {
  final GetObHavoDataShaharNomi getObHavoDataShaharNomi;

  // final GetWeatherDataBylocation getWeatherDataBylocation;
  final InputChecker inputChecker;

  ObHavoBloc({required this.getObHavoDataShaharNomi, required this.inputChecker})
      : super(InitialObHavo()) {
    on<GetObHavoShaharNomiEvent>(
        ( event,emit)async{
          final Either inputEither=inputChecker.checkOfStringInput(event.shaharNomi);
          await inputEither.fold((l) async=> emit(ErrorObHavo(errorXabar: 'xatoooooo')),
                  (r)async {
            //
            emit(LoadingObHavo());
            //
                    final xatoOrObhavo=await getObHavoDataShaharNomi(ShaharParams(shaharNomi: r)); 
                    xatoOrObhavo.fold((l) => emit(ErrorObHavo(errorXabar: ' xato emit ichida: $l')),
                            (r) => emit(LoadedObHavo(obhavo: r)));
                  });
        }
    );
  }

  FutureOr<void> _onEvent(
      GetObHavoShaharNomiEvent event, Emitter<ObHavoState> emit) async {
    //
    emit(LoadingObHavo());
    //
    final checkerResult = inputChecker.checkOfStringInput(event.shaharNomi);
    //
    emit(checkerResult.fold(
          (l) => ErrorObHavo(errorXabar: INVALID_INPUT_XATO_XABAR),
          (r) => LoadingObHavo(),

    ));
    final xatoOrObHavo = await getObHavoDataShaharNomi(
        ShaharParams(shaharNomi: event.shaharNomi));
    xatoOrObHavo.fold((l) => ErrorObHavo(errorXabar: 'xatoOrObhavodagi xato'), (
        r) => LoadedObHavo(obhavo: r));
//

  }}
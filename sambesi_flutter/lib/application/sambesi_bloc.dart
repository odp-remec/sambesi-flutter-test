import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';
import 'package:sambesi_flutter/domain/failures/general_failure.dart';
import 'package:sambesi_flutter/domain/failures/server_failure.dart';
import 'package:sambesi_flutter/domain/usecases/aufgabedurchfuehren_usecase.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'sambesi_event.dart';
part 'sambesi_state.dart';

class SambesiBloc extends Bloc<SambesiEvent, SambesiState> {
  final AufgabeDurchfuehrenUsecase usecases;

  SambesiBloc({required this.usecases}) : super(SambesiInitial()) {
    on<AufgabeRequestedEvent>((event, emit) async {
      emit(SambesiStateLoading());

      Either<Failure, Iterable<AufgabeDurchfuehrenEntity>> adviceOrFailure =
          await usecases.getAufgaben();

      adviceOrFailure.fold(
          (failure) =>
              emit(SambesiStateError(message: _mapFailureToMessage(failure))),
          (id) => emit(AufgabeLoaded(id: id.first.id)));
    });
  }

  String _mapFailureToMessage(failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ups, API Error, please try again!";
      case GeneralFailure:
      default:
        return "Ups, something gone wrong, please try again!";
    }
  }
}

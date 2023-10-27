part of 'sambesi_bloc.dart';

@immutable
abstract class SambesiState {}

class SambesiInitial extends SambesiState {}

class SambesiStateLoading extends SambesiState {}

class AufgabeLoaded extends SambesiState {
  final List<AufgabeDurchfuehrenEntity> aufgaben;
  AufgabeLoaded({required this.aufgaben});
}

class SambesiStateError extends SambesiState {
  final String message;

  SambesiStateError({required this.message});
}

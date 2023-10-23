import 'package:dartz/dartz.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';

abstract class AufgabeDurchfuehrenRepo{
  Future<Either<Failure, AufgabeDurchfuehrenEntity>> getAufgabenForDurchfuehrung();
}
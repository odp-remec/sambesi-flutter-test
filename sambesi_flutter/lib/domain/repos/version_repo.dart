import 'package:dartz/dartz.dart';
import 'package:sambesi_flutter/domain/entities/version_entity.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';

abstract class VersionRepo{
  Future<Either<Failure, VersionEntity>> getVersion();
}
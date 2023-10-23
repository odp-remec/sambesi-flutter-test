import 'package:dartz/dartz.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';
import 'package:sambesi_flutter/domain/repos/aufgabedurchfuehren_repo.dart';
import 'package:sambesi_flutter/infrastructure/datasources/sambesi_backend_datasource.dart';

class AufgabeDurchfuehrenRepoImpl implements AufgabeDurchfuehrenRepo{
  final SambesiRemoteDatasource sambesiRemoteDatasource;

  AufgabeDurchfuehrenRepoImpl({required this.sambesiRemoteDatasource});

  @override
  Future<Either<Failure, AufgabeDurchfuehrenEntity>> getAufgabenForDurchfuehrung() {
    // TODO: implement getAufgabenForDurchfuehrung
    throw UnimplementedError();
  }

}
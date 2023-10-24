import 'package:dartz/dartz.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';
import 'package:sambesi_flutter/domain/failures/general_failure.dart';
import 'package:sambesi_flutter/domain/failures/server_failure.dart';
import 'package:sambesi_flutter/domain/repos/aufgabedurchfuehren_repo.dart';
import 'package:sambesi_flutter/infrastructure/datasources/sambesi_backend_datasource.dart';
import 'package:sambesi_flutter/infrastructure/exceptions/server_exception.dart';

class AufgabeDurchfuehrenRepoImpl implements AufgabeDurchfuehrenRepo{
  final SambesiRemoteDatasource sambesiRemoteDatasource;

  AufgabeDurchfuehrenRepoImpl({required this.sambesiRemoteDatasource});

  @override
  Future<Either<Failure, Iterable<AufgabeDurchfuehrenEntity>>> getAufgabenForDurchfuehrung() async {
    try{
      final aufgabenForDurchfuehrung = await sambesiRemoteDatasource.getAlleAufgabenForDurchfuehrungFromApi();
      return Right(aufgabenForDurchfuehrung);
    }
    catch (e){
        if(e.runtimeType is ServerException){
          return Left(ServerFailure());
        }
        return Left(GeneralFailure());
    }
  }

}
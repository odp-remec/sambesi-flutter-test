import 'package:dartz/dartz.dart';
import 'package:sambesi_flutter/domain/entities/version_entity.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';
import 'package:sambesi_flutter/domain/failures/general_failure.dart';
import 'package:sambesi_flutter/domain/failures/server_failure.dart';
import 'package:sambesi_flutter/domain/repos/version_repo.dart';
import 'package:sambesi_flutter/infrastructure/datasources/sambesi_backend_datasource.dart';
import 'package:sambesi_flutter/infrastructure/exceptions/server_exception.dart';

class VersionRepoImpl implements VersionRepo{
  final SambesiRemoteDatasource sambesiRemoteDatasource;

  VersionRepoImpl({required this.sambesiRemoteDatasource});

  @override
  Future<Either<Failure, VersionEntity>> getVersion() async {
    try{
      final version = await sambesiRemoteDatasource.getVersion();
      return Right(version);
    }
    catch (e){
        if(e.runtimeType is ServerException){
          return Left(ServerFailure());
        }
        return Left(GeneralFailure());
    }
  }

}
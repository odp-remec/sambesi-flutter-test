import 'package:dartz/dartz.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/domain/failures/failure.dart';
import 'package:sambesi_flutter/domain/repos/aufgabedurchfuehren_repo.dart';
class AufgabeDurchfuehrenUsecase{
  final AufgabeDurchfuehrenRepo aufgabeDurchfuehrenRepo;

  AufgabeDurchfuehrenUsecase({required this.aufgabeDurchfuehrenRepo});

  Future<Either<Failure, AufgabeDurchfuehrenEntity>> getAufgaben() async{
      return aufgabeDurchfuehrenRepo.getAufgabenForDurchfuehrung();
  }
}
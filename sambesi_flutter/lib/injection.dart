import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sambesi_flutter/application/sambesi_bloc.dart';
import 'package:sambesi_flutter/domain/repos/aufgabedurchfuehren_repo.dart';
import 'package:sambesi_flutter/domain/usecases/aufgabedurchfuehren_usecase.dart';
import 'package:sambesi_flutter/infrastructure/datasources/sambesi_backend_datasource.dart';
import 'package:sambesi_flutter/infrastructure/repositorities/aufgabedurchfuehren_repo_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Factory = Jedes Mal eine neue Instanz
  // Singleton = Nur ein Objekt (Lazy = erst wenn gebraucht wird dieser erstellt)

  //! Blocs
  serviceLocator.registerFactory(() => SambesiBloc(usecases: serviceLocator()));

  //! UseCases
  serviceLocator.registerLazySingleton(() =>
      AufgabeDurchfuehrenUsecase(aufgabeDurchfuehrenRepo: serviceLocator()));

  //! Repos
  serviceLocator.registerLazySingleton<AufgabeDurchfuehrenRepo>(() =>
      AufgabeDurchfuehrenRepoImpl(sambesiRemoteDatasource: serviceLocator()));

  //! Datasources
  serviceLocator.registerLazySingleton<SambesiRemoteDatasource>(
      () => SambesiRemoteDatasourceImpl(client: serviceLocator()));

  //! Extern
  serviceLocator.registerLazySingleton(() => http.Client());
}

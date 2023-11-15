import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sambesi_flutter/application/sambesi_bloc.dart';
import 'package:sambesi_flutter/domain/repos/aufgabedurchfuehren_repo.dart';
import 'package:sambesi_flutter/domain/repos/auth_repo.dart';
import 'package:sambesi_flutter/domain/repos/version_repo.dart';
import 'package:sambesi_flutter/domain/usecases/aufgabedurchfuehren_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/check_cached_account_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/login_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/logout_usecase.dart';
import 'package:sambesi_flutter/infrastructure/datasources/sambesi_backend_datasource.dart';
import 'package:sambesi_flutter/infrastructure/repositorities/aufgabedurchfuehren_repo_impl.dart';
import 'package:sambesi_flutter/infrastructure/repositorities/auth_repo_impl.dart';
import 'package:sambesi_flutter/infrastructure/repositorities/version_repo_impl.dart';
import 'package:sambesi_flutter/global.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Factory = Jedes Mal eine neue Instanz
  // Singleton = Nur ein Objekt (Lazy = erst wenn gebraucht wird dieser erstellt)

  //! Blocs
  serviceLocator.registerFactory(() => SambesiBloc(usecases: serviceLocator()));

  //! UseCases
  serviceLocator.registerLazySingleton(() =>
      AufgabeDurchfuehrenUsecase(aufgabeDurchfuehrenRepo: serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => LoginUseCase(repository: serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => LogoutUseCase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => CheckCachedAccountUseCase(repository: serviceLocator()));

  //! Repos
  serviceLocator.registerLazySingleton<AufgabeDurchfuehrenRepo>(() =>
      AufgabeDurchfuehrenRepoImpl(sambesiRemoteDatasource: serviceLocator()));
  serviceLocator.registerLazySingleton<VersionRepo>(
      () => VersionRepoImpl(sambesiRemoteDatasource: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(oauth: serviceLocator()));

  //! Datasources
  serviceLocator.registerLazySingleton<SambesiRemoteDatasource>(() =>
      SambesiRemoteDatasourceImpl(
          client: serviceLocator(), authRepo: serviceLocator()));

  //! Extern
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() {
    final config = Config(
        tenant: '4a552149-2523-4ee4-9ba9-554ee2d84067/',
        clientId: '4521864f-c105-41ef-b858-fcf8866e68a1',
        scope: 'api://f8878c70-00ed-493f-b59a-dace542ffd57/api.sambesi.backend',
        navigatorKey: navigatorKey,
        webUseRedirect: true);
    return AadOAuth(config);
  });
}

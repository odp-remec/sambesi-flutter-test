import 'package:sambesi_flutter/domain/repos/auth_repo.dart';

class LogoutUseCase {
  final AuthenticationRepository repository;

  LogoutUseCase({required this.repository});

  Future<void> call() {
    return repository.logout();
  }
}
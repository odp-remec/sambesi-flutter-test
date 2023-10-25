import 'package:sambesi_flutter/domain/repos/auth_repo.dart';

class LoginUseCase {
  final AuthenticationRepository repository;

  LoginUseCase({required this.repository});

  Future<String> call({required bool redirect}) {
    return repository.login(redirect: redirect);
  }
}
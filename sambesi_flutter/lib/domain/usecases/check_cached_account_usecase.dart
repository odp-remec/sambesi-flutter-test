import 'package:sambesi_flutter/domain/repos/auth_repo.dart';

class CheckCachedAccountUseCase {
  final AuthenticationRepository repository;

  CheckCachedAccountUseCase({required this.repository});

  Future<bool> call() {
    return repository.hasCachedAccountInformation();
  }
}

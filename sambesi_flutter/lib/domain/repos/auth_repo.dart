
abstract class AuthenticationRepository {
  Future<String> login({required bool redirect});
  Future<bool> hasCachedAccountInformation();
  Future<void> logout(); 
  String getToken();
}
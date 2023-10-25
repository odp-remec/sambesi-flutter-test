import 'package:aad_oauth/aad_oauth.dart';
import 'package:sambesi_flutter/domain/repos/auth_repo.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AadOAuth oauth;
  String token = "";

  AuthenticationRepositoryImpl({required this.oauth});

  @override
  Future<String> login({required bool redirect}) async {
  try {      
      // Der `login` Aufruf gibt ein Ergebnis zurück, das entweder ein Fehler oder ein Token ist.
      final result = await oauth.login();
      
      // Hier nutzen wir das Ergebnis (angenommen, es handelt sich um ein Either-Objekt)
      // und geben entweder den Token zurück oder werfen einen Fehler.
      return result.fold(
        (l) => throw Exception(l.toString()), // Fehlerfall: werfen eines Fehlers
        (r) => saveAndReturnToken(r.toString()) // Erfolgsfall: geben des Tokens zurück
      );
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  String saveAndReturnToken(String t){
    token = t;
    return token;
  }

  @override
  String getToken(){
    return token;
  }

  @override
  Future<bool> hasCachedAccountInformation() async {
    return await oauth.hasCachedAccountInformation;
  }

  @override
  Future<void> logout() async {
    await oauth.logout();
  }
}

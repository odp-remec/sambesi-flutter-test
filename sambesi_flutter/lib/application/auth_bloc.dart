import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/application/auth_event.dart';
import 'package:sambesi_flutter/application/auth_state.dart';
import 'package:sambesi_flutter/domain/usecases/check_cached_account_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/login_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/logout_usecase.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase loginUseCase;
  final CheckCachedAccountUseCase checkCachedAccountUseCase;
  final LogoutUseCase logoutUseCase;

  AuthenticationBloc({
    required this.loginUseCase,
    required this.checkCachedAccountUseCase,
    required this.logoutUseCase,
  }) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is LoginEvent) {
      try {
        final token = await loginUseCase(redirect: event.redirect);
        print(token);
        yield AuthenticationSuccess(token);
      } catch (error) {
        yield AuthenticationError(error.toString());
      }
    } else if (event is CheckCachedAccountEvent) {
      final hasCachedAccount = await checkCachedAccountUseCase();
      // You can yield a state based on this information
    } else if (event is LogoutEvent) {
      try {
        await logoutUseCase();
        yield AuthenticationLoggedOut(); // You may need to define this state.
      } catch (error) {
        yield AuthenticationError(error.toString());
      }
    }
  }
}

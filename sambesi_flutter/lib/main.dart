import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/application/auth_bloc.dart';
import 'package:sambesi_flutter/application/auth_state.dart';
import 'package:sambesi_flutter/application/sambesi_bloc.dart';
import 'package:sambesi_flutter/domain/usecases/aufgabedurchfuehren_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/check_cached_account_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/login_usecase.dart';
import 'package:sambesi_flutter/domain/usecases/logout_usecase.dart';
import 'package:sambesi_flutter/global.dart';
import 'package:sambesi_flutter/injection.dart';
import 'package:sambesi_flutter/presentation/overview_page.dart';
import 'package:sambesi_flutter/presentation/widgets/myHomePage.dart';

import 'injection.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAD OAuth Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(
          loginUseCase: serviceLocator<LoginUseCase>(),
          checkCachedAccountUseCase: serviceLocator<CheckCachedAccountUseCase>(),
          logoutUseCase: serviceLocator<LogoutUseCase>(),
        ),
        child: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          // Hier können Sie bei Bedarf Fehlermeldungen anzeigen.
          // Zum Beispiel, zeigen Sie einen Snackbar oder Dialog an.
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Close"),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return BlocProvider(
              create: (context) => SambesiBloc(usecases: serviceLocator<AufgabeDurchfuehrenUsecase>()),
              child: const OverviewPage(),
            );

        }
        return const MyHomePage(title: "Login Page");
      },
    );
  }
}

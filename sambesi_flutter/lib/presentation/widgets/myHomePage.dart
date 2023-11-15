import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/application/auth_bloc.dart';
import 'package:sambesi_flutter/application/auth_event.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(LoginEvent(redirect: false));
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(LogoutEvent());
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}

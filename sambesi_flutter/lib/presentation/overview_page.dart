import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/application/sambesi_bloc.dart';
import 'package:sambesi_flutter/presentation/widgets/advice_field.dart';
import 'package:sambesi_flutter/presentation/widgets/custom_button.dart';
import 'package:sambesi_flutter/presentation/widgets/error_message.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sambesi Flutter",
          style: themeData.textTheme.displayLarge?.copyWith(fontSize: 20),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: BlocBuilder<SambesiBloc, SambesiState>(
              bloc: BlocProvider.of<SambesiBloc>(
                  context), // init Event wenn Widget geladen wird
              builder: (context, loadAufgabeState) {
                if (loadAufgabeState is SambesiInitial) {
                  return Text(
                    "Dashboard",
                    style: themeData.textTheme.displayLarge
                        ?.copyWith(fontSize: 20),
                  );
                } else if (loadAufgabeState is SambesiStateLoading) {
                  return CircularProgressIndicator(
                    color: themeData.colorScheme.secondary,
                  );
                } else if (loadAufgabeState is AufgabeLoaded) {
                  return AdviceField(advice: loadAufgabeState.id.toString());
                } else if (loadAufgabeState is SambesiStateError) {
                  return ErrorMessage(
                    message: loadAufgabeState.message,
                  );
                }
                return const Placeholder();
              },
            ))),
            const SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(),
                )),
          ],
        ),
      )),
    );
  }
}
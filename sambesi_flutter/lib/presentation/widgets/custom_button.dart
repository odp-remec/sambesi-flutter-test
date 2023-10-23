import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/application/sambesi_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () =>
          {BlocProvider.of<SambesiBloc>(context).add(AufgabeRequestedEvent())},
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeData.colorScheme.secondary),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text("Aufgaben abrufen",
                  style: themeData.textTheme.displayLarge
                      ?.copyWith(fontSize: 20))),
        ),
      ),
    );
  }
}

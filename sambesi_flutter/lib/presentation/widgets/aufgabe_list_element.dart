import 'package:flutter/material.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/infrastructure/dtos/aufgabeDurchfuehren_dto.dart';

class AufgabeListElement extends StatelessWidget {
  final AufgabeDurchfuehrenEntity aufgabe;
  const AufgabeListElement({Key? key, required this.aufgabe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeData.colorScheme.onPrimary),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListTile(
              leading: Text(aufgabe.aufgabeId.toString()),
              title: Text(aufgabe.aufgabeBezeichnung.toString()),
              tileColor: Colors.red,
            )),
      ),
    );
  }
}

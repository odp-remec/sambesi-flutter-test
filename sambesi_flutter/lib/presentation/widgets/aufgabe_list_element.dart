import 'package:flutter/material.dart';
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/infrastructure/dtos/aufgabeDurchfuehren_dto.dart';

class AufgabeListElement extends StatelessWidget {
  final List<AufgabeDurchfuehrenEntity> aufgaben;
  const AufgabeListElement({Key? key, required this.aufgaben}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeData.colorScheme.onPrimary),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                  return ListTile(
              leading: Text(aufgaben[index].aufgabeId.toString()),
              title: Text(aufgaben[index].aufgabeBezeichnung.toString()),
              trailing: Text(aufgaben[index].hilfetext.toString()),
              tileColor: Colors.red,
            );            },)
            
         ),
      ),
    );
  }
}

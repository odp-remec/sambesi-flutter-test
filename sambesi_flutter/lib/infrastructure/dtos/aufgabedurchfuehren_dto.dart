import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';

class AufgabeDurchfuehrenDto extends AufgabeDurchfuehrenEntity {
  AufgabeDurchfuehrenDto({required int aufgabeId, required String aufgabeBezeichnung, required String hilfetext}) : super(aufgabeId: aufgabeId, aufgabeBezeichnung: aufgabeBezeichnung, hilfetext: hilfetext);

  factory AufgabeDurchfuehrenDto.fromJson(Map<String, dynamic> json) {
    return AufgabeDurchfuehrenDto(aufgabeId: json["aufgabeId"], aufgabeBezeichnung: json["aufgabeBezeichnung"], hilfetext: json["hilfetext"]);
  }
}

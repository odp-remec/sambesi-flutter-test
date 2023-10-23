import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';

class AufgabeDurchfuehrenDto extends AufgabeDurchfuehrenEntity{
  AufgabeDurchfuehrenDto({required int id}) : super(id: id);

  factory AufgabeDurchfuehrenDto.fromJson(Map<String, dynamic> json){
    return AufgabeDurchfuehrenDto(id: json["id"]);
  }
}
import 'package:sambesi_flutter/domain/entities/version_entity.dart';

class VersionDto extends VersionEntity{
  VersionDto({required String apiVersion, required String dbVersion, required String timeZoneId}) : super(apiVersion: apiVersion, dbVersion: dbVersion, timeZoneId: timeZoneId);

  factory VersionDto.fromJson(Map<String, dynamic> json){
    return VersionDto(apiVersion: json["apiVersion"], dbVersion: json["dbVersion"], timeZoneId: json["timeZoneId"]);
  }
}
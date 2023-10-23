import 'package:http/http.dart' as http;
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/infrastructure/dtos/aufgabeDurchfuehren_dto.dart';
import 'dart:convert';

import 'package:sambesi_flutter/infrastructure/exceptions/server_exception.dart';

abstract class SambesiRemoteDatasource {
  /// can throw Server-Exception
  Future<AufgabeDurchfuehrenEntity> getAlleAufgabenForDurchfuehrungFromApi();
}

class SambesiRemoteDatasourceImpl implements SambesiRemoteDatasource {
  final String apiUrl = "https://willie.sisag.ch/SambesiBackendStage/";
  final http.Client client;

  SambesiRemoteDatasourceImpl({required this.client});

  @override
  Future<AufgabeDurchfuehrenEntity> getAlleAufgabenForDurchfuehrungFromApi() async {
    const String endPoint = "instandhaltung/pendenzdurchfuehren?teilgebietId=0&anlageKnotenId=0&dienstId=0&nurFaelligeAnzeigen=false&loadAll=true&aufgabeStrategieTypFilter=2&aufgabeStrategieTypFilter=3&aufgabeStrategieTypFilter=4&aufgabeStrategieTypFilter=5&aufgabeStrategieTypFilter=6";
    final response = await client
        .get(Uri.parse(apiUrl + endPoint), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final data = json.decode(response.body);
      return AufgabeDurchfuehrenDto.fromJson(data["slip"]);
    }
  }
}
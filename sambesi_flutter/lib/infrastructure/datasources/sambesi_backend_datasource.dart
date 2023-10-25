import 'package:http/http.dart' as http;
import 'package:sambesi_flutter/domain/entities/aufgabedurchfuehren_entity.dart';
import 'package:sambesi_flutter/domain/entities/version_entity.dart';
import 'package:sambesi_flutter/domain/repos/auth_repo.dart';
import 'package:sambesi_flutter/infrastructure/dtos/aufgabeDurchfuehren_dto.dart';
import 'package:sambesi_flutter/infrastructure/dtos/version_dto.dart';
import 'dart:convert';

import 'package:sambesi_flutter/infrastructure/exceptions/server_exception.dart';

abstract class SambesiRemoteDatasource {
  /// can throw Server-Exception
  Future<Iterable<AufgabeDurchfuehrenEntity>> getAlleAufgabenForDurchfuehrungFromApi();

  Future<VersionEntity> getVersion();
}

class SambesiRemoteDatasourceImpl implements SambesiRemoteDatasource {
  final String apiUrl = "https://demoremec003.azurewebsites.net/";
  final http.Client client;
  final AuthenticationRepository authRepo;

  SambesiRemoteDatasourceImpl({required this.client, required this.authRepo});

  @override
  Future<Iterable<AufgabeDurchfuehrenEntity>> getAlleAufgabenForDurchfuehrungFromApi() async {
    String token = authRepo.getToken();
    const String endPoint = "api/v7.5/instandhaltung/pendenzdurchfuehren?teilgebietId=0&anlageKnotenId=0&dienstId=0&nurFaelligeAnzeigen=false&loadAll=true&aufgabeStrategieTypFilter=2&aufgabeStrategieTypFilter=3&aufgabeStrategieTypFilter=4&aufgabeStrategieTypFilter=5&aufgabeStrategieTypFilter=6";
    final response = await client.get(Uri.parse(apiUrl + endPoint), headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"});

    if (response.statusCode != 200) {
      print("Kein 200: "+ response.statusCode.toString());
      throw ServerException();
    } else {
      final Iterable data = json.decode(response.body);
      print("Data");
      print(data.length);
      return List<AufgabeDurchfuehrenEntity>.from(data.map((model) => AufgabeDurchfuehrenDto.fromJson(model)));
    }
  }
  
  @override
  Future<VersionEntity> getVersion() async {
    const String endPoint = "api/version";
    final response = await client.get(Uri.parse(apiUrl + endPoint), headers: {});

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final data = json.decode(response.body);
      return VersionDto.fromJson(data);
    }
  }
}
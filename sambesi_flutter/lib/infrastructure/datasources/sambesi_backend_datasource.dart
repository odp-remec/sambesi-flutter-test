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
  Future<Iterable<AufgabeDurchfuehrenEntity>>
      getAlleAufgabenForDurchfuehrungFromApi();

  Future<VersionEntity> getVersion();
}

class SambesiRemoteDatasourceImpl implements SambesiRemoteDatasource {
  final String apiUrl = "https://demoremec003.azurewebsites.net/";
  final http.Client client;
  final AuthenticationRepository authRepo;

  SambesiRemoteDatasourceImpl({required this.client, required this.authRepo});

  @override
  Future<Iterable<AufgabeDurchfuehrenEntity>>
      getAlleAufgabenForDurchfuehrungFromApi() async {
    String token = authRepo.getToken();

    const String endPoint =
        "api/v7.5/instandhaltung/aufgabehistorie?teilgebietId=0&anlageKnotenId=0&loadAll=true&isOnlyAktuellerAnlageKnoten=false&filterDatumVon=2020-01-01&filterDatumBis=2020-02-01&nurLetzteDurchfuehrung=false&nurVisierteAnzeigen=true&aufgabeStrategieTypen=1&aufgabeStrategieTypen=2&aufgabeStrategieTypen=3&aufgabeStrategieTypen=4&aufgabeStrategieTypen=5&aufgabeStrategieTypen=6&aufgabenStatus=3&aufgabenStatus=4&aufgabenStatus=6&aufgabenStatus=7&aufgabenStatus=9&aufgabenStatus=10&aufgabenStatus=11";
    final response = await client.get(Uri.parse(apiUrl + endPoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode != 200) {
      print("Kein 200: " + response.statusCode.toString());
      throw ServerException();
    } else {
      final Iterable data = json.decode(response.body);
      print("Data");
      print(data.length);
      return List<AufgabeDurchfuehrenEntity>.from(
          data.map((model) => AufgabeDurchfuehrenDto.fromJson(model)));
    }
  }

  @override
  Future<VersionEntity> getVersion() async {
    const String endPoint = "api/version";
    final response =
        await client.get(Uri.parse(apiUrl + endPoint), headers: {});

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final data = json.decode(response.body);
      return VersionDto.fromJson(data);
    }
  }
}

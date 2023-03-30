import 'package:arquitetura/app/constants/urls.dart';
import 'package:arquitetura/app/models/digimon_model.dart';
import 'package:dio/dio.dart';

class DigimonService {
  late Dio _dio;

  DigimonService(Dio dio) {
    _dio = dio;
  }

  Future<List<DigimonModel>> listAllDigimons() async {
    return (await _dio.get<List>(baseUrl)).data!.map((digimon) => DigimonModel.fromJson(digimon)).toList();
  }
}

import 'package:arquitetura/app/models/digimon_model.dart';
import 'package:arquitetura/app/services/digimon_service.dart';

class DigimonRepository {
  DigimonService? _digimonService;

  List<DigimonModel> allDigimons = [];

  DigimonRepository(DigimonService digimonService) {
    _digimonService = digimonService;
    listAllDigimons();
  }

  Future<void> listAllDigimons() async {
    allDigimons = await _digimonService!.listAllDigimons();
    allDigimons
        .sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
  }
}

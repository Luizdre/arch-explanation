import 'package:arquitetura/app/models/digimon_model.dart';
import 'package:arquitetura/app/repository/digimon_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  late DigimonRepository digimonRepository;

  @observable
  bool loading = true;

  HomeStoreBase(this.digimonRepository) {
    loadDigimons();
  }

  @action
  loadDigimons() async {
    loading = true;
    await digimonRepository.listAllDigimons();
    loading = false;
  }
}

import 'package:arquitetura/app/repository/digimon_repository.dart';
import 'package:arquitetura/app/services/digimon_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),
    Bind.lazySingleton((i) => DigimonService(i.get())),
    Bind.lazySingleton((i) => DigimonRepository(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}

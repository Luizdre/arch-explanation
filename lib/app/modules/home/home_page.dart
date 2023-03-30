import 'package:arquitetura/app/components/digimon_card.dart';
import 'package:arquitetura/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<HomeStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Observer(
        builder: (context) => store.loading == true
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: store.digimonRepository.allDigimons.length,
                itemBuilder: (context, index) => DigimonCard(digimon: store.digimonRepository.allDigimons[index])),
      ),
    );
  }
}

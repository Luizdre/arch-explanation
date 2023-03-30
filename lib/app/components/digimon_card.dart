// ignore_for_file: must_be_immutable

import 'package:arquitetura/app/constants/colors.dart';
import 'package:arquitetura/app/models/digimon_model.dart';
import 'package:flutter/material.dart';

class DigimonCard extends StatelessWidget {
  DigimonModel digimon;
  DigimonCard({Key? key, required this.digimon}) : super(key: key);

  Color? defineBorderColor() {
    switch (digimon.level) {
      case 'Fresh':
        return fresh;
      case 'In Training':
        return inTraining;
      case 'Rookie':
        return rookie;
      case 'Champion':
        return champion;
      case 'Ultimate':
        return ultimate;
      case 'Armor':
        return armor;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: defineBorderColor()!, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(digimon.name!),
            const SizedBox(height: 20),
            Image.network(digimon.img!, height: 100,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                  child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ));
            }),
            const SizedBox(height: 20),
            Text.rich(TextSpan(
                text: digimon.level,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: defineBorderColor())))
          ],
        ),
      ),
    );
  }
}

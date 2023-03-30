// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'digimon_model.g.dart';

@JsonSerializable()
class DigimonModel {
  String? name;
  String? img;
  String? level;

  DigimonModel({this.name, this.img, this.level});

  factory DigimonModel.fromJson(Map<String, dynamic> json) =>
      _$DigimonModelFromJson(json);

  Map<String, dynamic> toJson() => _$DigimonModelToJson(this);
}

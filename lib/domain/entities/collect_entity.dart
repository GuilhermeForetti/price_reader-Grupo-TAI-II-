// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:price_reader/domain/entities/corporation_entity.dart';

class CollectEntity {
  final String guid;
  final DateTime date;
  final double value;
  final CorporationEntity corporation;
  CollectEntity({
    required this.guid,
    required this.date,
    required this.value,
    required this.corporation,
  });
}

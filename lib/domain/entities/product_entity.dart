// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:price_reader/domain/entities/collect_entity.dart';

class ProductEntity {
  final String guid;
  final String barcode;
  final String description;
  final List<CollectEntity> collects;
  ProductEntity({
    required this.guid,
    required this.barcode,
    required this.description,
    this.collects = const [],
  });
}

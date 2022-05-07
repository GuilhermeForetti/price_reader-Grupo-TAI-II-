import 'dart:math';

import 'package:price_reader/data/abstracts/products_data_source.dart';
import 'package:price_reader/domain/entities/product_entity.dart';

class ProductsFakeDataSource implements ProductsDataSource {
  final allproducts = List.generate(
    Random().nextInt(30) + 5,
    (index) => ProductEntity(
      guid: index.toString(),
      barcode: '789${index.toString()}',
      description: 'descricao index${index.toString()}',
    ),
  );
  @override
  Future<List<ProductEntity>> getProducts({String? query}) async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    if (query == null) {
      return allproducts;
    } else {
      return allproducts
          .where((element) => element.barcode.contains(query))
          .toList();
    }
  }
}

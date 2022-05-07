import 'package:price_reader/domain/entities/product_entity.dart';

abstract class ProductsDataSource {
  Future<List<ProductEntity>> getProducts({
    String? query,
  });
}

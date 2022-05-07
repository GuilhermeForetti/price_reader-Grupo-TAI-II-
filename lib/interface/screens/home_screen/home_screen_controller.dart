import 'package:flutter/cupertino.dart';
import 'package:price_reader/data/abstracts/products_data_source.dart';
import 'package:price_reader/domain/entities/product_entity.dart';
import 'package:provider/provider.dart';

class HomeScreenController extends ChangeNotifier {
  bool loading = true;
  List<ProductEntity> filteredproducts = [];

  getproducts({
    String? query,
    required BuildContext context,
  }) async {
    loading = true;
    notifyListeners();
    final result =
        await context.read<ProductsDataSource>().getProducts(query: query);
    loading = false;
    filteredproducts = result;
    notifyListeners();
  }
}

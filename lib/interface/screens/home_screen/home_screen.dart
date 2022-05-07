import 'package:flutter/material.dart';
import 'package:price_reader/interface/screens/home_screen/home_screen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) {
        context.read<HomeScreenController>().getproducts(context: context);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(builder: (context, provider, child) {
      final loading = provider.loading;
      final products = provider.filteredproducts;
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.camera_alt,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: SearchWidget(),
              ),
              Expanded(
                child: Center(
                  child: loading
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Text(product.description);
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              context.read<HomeScreenController>().getproducts(
                    context: context,
                    query: value,
                  );
            },
            decoration: const InputDecoration(
              label: Text("termo da busca"),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: IconButton(
            color: Colors.blue,
            onPressed: () {},
            icon: const Icon(Icons.crop_free),
          ),
        ),
      ],
    );
  }
}

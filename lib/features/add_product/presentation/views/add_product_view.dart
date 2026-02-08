import 'package:dechbord_fruit_app/core/widgets/build_app_bar.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/add_products_view_body.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: const AddProdutViewBody(),
    );
  }
}

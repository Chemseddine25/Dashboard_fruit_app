import 'package:dechbord_fruit_app/core/services/get_it.dart';
import 'package:dechbord_fruit_app/core/widgets/build_app_bar.dart';
import 'package:dechbord_fruit_app/core/widgets/build_error_bar.dart';
import 'package:dechbord_fruit_app/core/widgets/custom_progress_hud.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/manger/cubit/add_product_cubit_cubit.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/add_products_view_body.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/image_repos/upload_image_repo.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/product_repos/add_product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubitCubit(
          getIt.get<UploadImageRepo>(),
          getIt.get<AddProductRepo>(),
        ),
        child: const AddProductsBlocCosumerViewBody(),
      ),
    );
  }
}

class AddProductsBlocCosumerViewBody extends StatelessWidget {
  const AddProductsBlocCosumerViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubitCubit, AddProductCubitState>(
      listener: (context, state) {
        if (state is AddProductCubitSuccess) {
          buildBar(context, 'Product added successfully');
        }
        if (state is AddProductCubitfailure) {
          buildBar(context, state.errmessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductCubitLoading,
          child: const AddProdutViewBody(),
        );
      },
    );
  }
}

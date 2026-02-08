// ignore_for_file: file_names

import 'package:dechbord_fruit_app/core/widgets/custom_button.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/add_product_view.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: CustomButton(
                  onPressed: () {
                    Navigator.restorablePopAndPushNamed(
                        context, AddProductView.routeName);
                  },
                  text: "add fruit"))
        ],
      ),
    );
  }
}

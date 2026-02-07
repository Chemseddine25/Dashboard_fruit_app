import 'package:dechbord_fruit_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomButton(onPressed: () {}, text: "add fruit")],
    );
  }
}

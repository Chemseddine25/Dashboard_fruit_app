import 'dart:io';

import 'package:dechbord_fruit_app/core/widgets/custom_button.dart';
import 'package:dechbord_fruit_app/core/widgets/custom_text_field.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:flutter/material.dart';

class AddProdutViewBody extends StatefulWidget {
  const AddProdutViewBody({super.key});

  @override
  State<AddProdutViewBody> createState() => _AddProdutViewBodyState();
}

class _AddProdutViewBodyState extends State<AddProdutViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numberOfCalories, unitAmount;

  File? image;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'Product Name',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: 'Product Price',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    expirationMonths = num.parse(value!);
                  },
                  hintText: 'Expiration Months',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    numberOfCalories = num.parse(value!);
                  },
                  hintText: 'Number Of Calories',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  },
                  hintText: 'Unit Amont',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'Product Code',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    description = value!;
                  },
                  hintText: 'Product Description',
                  textInputType: TextInputType.text,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                IsFeaturedCheckBox(onChanged: (value) {
                  isChecked = value;
                }),
                const SizedBox(
                  height: 16,
                ),
                ImageField(
                  onfileChanged: (image) {
                    this.image = image;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    onPressed: () {
                      if (image != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          const SnackBar(
                            content: Text(
                              'Product Added Successfully',
                            ),
                            backgroundColor: Colors.green,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an image'),
                          ),
                        );
                      }
                    },
                    text: "add fruit product"),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )),
    );
  }
}

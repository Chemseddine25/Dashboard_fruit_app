import 'dart:io';

import 'package:dechbord_fruit_app/features/add_product/domain/entities/reviews_entity.dart';

class AddProductEntity {
  final String nameProduct;
  final num priceProduct;
  final num expirationProduct;
  final num numberofcaloriesProduct;
  final num unitsProduct;
  final String descriptionProduct;
  final String codeProduct;
  final bool isFeatured;
  final bool isOrganic;
  final File imageProduct;
  String? urlImageProduct;
  final List<ReviewEntity> reviews;

  AddProductEntity(
      {required this.nameProduct,
      required this.priceProduct,
      required this.expirationProduct,
      required this.numberofcaloriesProduct,
      required this.unitsProduct,
      required this.descriptionProduct,
      required this.codeProduct,
      required this.isFeatured,
      required this.reviews,
      this.isOrganic = false,
      required this.imageProduct,
      this.urlImageProduct});
}

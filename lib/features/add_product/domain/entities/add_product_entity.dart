import 'dart:io';

class AddProductEntity {
  final String nameProduct;
  final num priceProduct;
  final num expirationProduct;
  final num numberofcaloriesProduct;
  final num unitsProduct;
  final String descriptionProduct;
  final String codeProduct;
  final bool isFeatured;
  final File imageProduct;
  String? urlImageProduct;

  AddProductEntity(
      {required this.nameProduct,
      required this.priceProduct,
      required this.expirationProduct,
      required this.numberofcaloriesProduct,
      required this.unitsProduct,
      required this.descriptionProduct,
      required this.codeProduct,
      required this.isFeatured,
      required this.imageProduct,
      this.urlImageProduct});
}

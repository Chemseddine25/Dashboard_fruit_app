import 'dart:io';
import 'package:dechbord_fruit_app/features/add_product/data/models/revuews_model.dart';
import 'package:dechbord_fruit_app/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
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
  final List<ReviewsModel> reviews;
  AddProductModel({
    required this.nameProduct,
    required this.priceProduct,
    required this.expirationProduct,
    required this.numberofcaloriesProduct,
    required this.unitsProduct,
    required this.descriptionProduct,
    required this.codeProduct,
    required this.isFeatured,
    required this.isOrganic,
    required this.imageProduct,
    required this.reviews,
    this.urlImageProduct,
  });
  factory AddProductModel.fromEntity(AddProductEntity addProductEntity) {
    return AddProductModel(
      nameProduct: addProductEntity.nameProduct,
      priceProduct: addProductEntity.priceProduct,
      expirationProduct: addProductEntity.expirationProduct,
      numberofcaloriesProduct: addProductEntity.numberofcaloriesProduct,
      unitsProduct: addProductEntity.unitsProduct,
      descriptionProduct: addProductEntity.descriptionProduct,
      codeProduct: addProductEntity.codeProduct,
      isFeatured: addProductEntity.isFeatured,
      isOrganic: addProductEntity.isOrganic,
      imageProduct: addProductEntity.imageProduct,
      urlImageProduct: addProductEntity.urlImageProduct,
      reviews: addProductEntity.reviews
          .map((e) => ReviewsModel.fromEntity(e))
          .toList(),
    );
  }
  toJson() => {
        "nameProduct": nameProduct,
        "priceProduct": priceProduct,
        "expirationProduct": expirationProduct,
        "numberofcaloriesProduct": numberofcaloriesProduct,
        "unitsProduct": unitsProduct,
        "descriptionProduct": descriptionProduct,
        "codeProduct": codeProduct,
        "isFeatured": isFeatured,
        "isOrganic": isOrganic,
        "urlImageProduct": urlImageProduct,
        "reviews": reviews.map((e) => e.toJson()).toList()
      };
}

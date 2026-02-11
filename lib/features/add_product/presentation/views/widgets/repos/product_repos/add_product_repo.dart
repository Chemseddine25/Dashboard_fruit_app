import 'package:dechbord_fruit_app/core/errors/failures.dart';
import 'package:dechbord_fruit_app/features/add_product/domain/entities/add_product_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct(AddProductEntity addProductEntity);
}

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dechbord_fruit_app/core/errors/failures.dart';
import 'package:dechbord_fruit_app/core/errors/services/database_service.dart';
import 'package:dechbord_fruit_app/features/add_product/data/models/add_products_model.dart';
import 'package:dechbord_fruit_app/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/product_repos/add_product_repo.dart';

class AddProductImplRepo extends AddProductRepo {
  final DatabaseService databaseService;

  AddProductImplRepo(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductEntity addProductEntity) async {
    try {
      await databaseService.addData(
          'products', AddProductModel.fromEntity(addProductEntity).toJson());
      return const Right(null);
    } catch (e) {
      log('❌ Supabase Technical Error: $e');

      return Left(ServerFailure('Failed to add product'));
    }
  }
}

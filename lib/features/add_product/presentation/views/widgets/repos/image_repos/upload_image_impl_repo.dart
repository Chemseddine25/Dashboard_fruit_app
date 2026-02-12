import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dechbord_fruit_app/core/errors/failures.dart';
import 'package:dechbord_fruit_app/core/errors/services/storege_service.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/image_repos/upload_image_repo.dart';

class UploadImageImplRepo extends UploadImageRepo {
  final StorageService storegeService;

  UploadImageImplRepo(this.storegeService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String urlimg = await storegeService.uploadImage(image, 'products');
      return Right(urlimg);
    } catch (e) {
      log('❌ Supabase Technical Error: $e');

      return Left(ServerFailure('Failed to upoload image'));
    }
  }
}

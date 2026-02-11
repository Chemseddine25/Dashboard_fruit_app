import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dechbord_fruit_app/core/errors/failures.dart';

abstract class UploadImageRepo {
  Future<Either<Failure, String>> uploadImage(File image);
    
  
}

import 'package:dechbord_fruit_app/core/errors/services/database_service.dart';
import 'package:dechbord_fruit_app/core/errors/services/storege_service.dart';
import 'package:dechbord_fruit_app/core/errors/services/supbase_database.dart';
import 'package:dechbord_fruit_app/core/errors/services/supbase_storage.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/image_repos/upload_image_impl_repo.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/image_repos/upload_image_repo.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/product_repos/add_product_impl_repo.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/product_repos/add_product_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(StorageSupbaseService());
  getIt.registerSingleton<DatabaseService>(SupbaseDatabase());

  getIt.registerSingleton<UploadImageRepo>(UploadImageImplRepo(
    getIt.get<StorageService>(),
  ));
  getIt.registerSingleton<AddProductRepo>(AddProductImplRepo(
    getIt.get<DatabaseService>(),
  ));
}

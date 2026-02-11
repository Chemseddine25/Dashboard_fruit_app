import 'package:bloc/bloc.dart';
import 'package:dechbord_fruit_app/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/image_repos/upload_image_repo.dart';
import 'package:dechbord_fruit_app/features/add_product/presentation/views/widgets/repos/product_repos/add_product_repo.dart';
import 'package:flutter/material.dart';

part 'add_product_cubit_state.dart';

class AddProductCubitCubit extends Cubit<AddProductCubitState> {
  AddProductCubitCubit(this.uploadImageRepo, this.addProductRepo)
      : super(AddProductCubitInitial());

  final UploadImageRepo uploadImageRepo;
  final AddProductRepo addProductRepo;

  Future<void> addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductCubitLoading());
    var imageResult =
        await uploadImageRepo.uploadImage(addProductEntity.imageProduct);

    imageResult.fold((l) {
      print('❌ Image Upload Error: ${l.message}');
      emit(AddProductCubitfailure(l.message));
    }, (url) async {
      addProductEntity.urlImageProduct = url;

      var productResult = await addProductRepo.addProduct(addProductEntity);
      productResult.fold((l) {
        print('Error Detail: ${l.message}');
        emit(AddProductCubitfailure(l.message));
      }, (r) {
        emit(AddProductCubitSuccess());
      });
    });
  }
}

import 'dart:io';

import 'package:dechbord_fruit_app/core/services/storege_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class StorageSupbaseService implements StorageService {
  @override
  Future<String> uploadImage(File file, String path) async {
    final _supabase = Supabase.instance.client;

    String fileExtension = p.extension(file.path);

    String fileName = p.basenameWithoutExtension(file.path);
    String filePath = '$path/$fileName$fileExtension';
    var result =
        await _supabase.storage.from('products').upload(filePath, file);

    return result;
  }
}

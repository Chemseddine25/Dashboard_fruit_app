import 'dart:io';

import 'package:dechbord_fruit_app/core/errors/services/storege_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class StorageSupbaseService implements StorageService {
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://vogvgpltvaxhkxiqsejq.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZvZ3ZncGx0dmF4aGt4aXFzZWpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk0MzI2MzEsImV4cCI6MjA4NTAwODYzMX0.1lI-Yx5BJx4NrhQR-_Aquy52k-wB9myRfs2-KfuDs0Y',
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileExtension = p.extension(file.path);

    String fileName = p.basenameWithoutExtension(file.path);
    String filePath = '$path/$fileName$fileExtension';
    var result =
        await _supabase.client.storage.from('products').upload(filePath, file);

    return result;
  }
}

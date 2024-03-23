import 'dart:io';

import 'package:amazon_clone/Constants/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final cloudnary = CloudinaryPublic("dbz04pplg", "fk2b5xww");
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res =
            await cloudnary.uploadFile(CloudinaryFile.fromFile(images[i].path));
        imageUrls.add(res.secureUrl);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

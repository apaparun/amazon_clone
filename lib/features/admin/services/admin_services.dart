import 'dart:io';

import 'package:amazon_clone/Constants/error_handling.dart';
import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:amazon_clone/Constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudnary = CloudinaryPublic("dbz04pplg", "fk2b5xww");
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse cloudres = await cloudnary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(cloudres.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
      print("${product.toJson()}");
      http.Response res = await http.post(Uri.parse("$uri/admin/add-product"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
          body: product.toJson());

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product added successfully");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

import 'dart:ffi';

import 'package:food_delivery/controllers/popular_product_conroller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repostiory/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(
      () => ApiClient(appBaseUrl: "https://www.dbstech.com") // loaded apiclient
      );
  Get.lazyPut(
      () => PopularProductRepo(apiClient: Get.find()) // to load repository
      );
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()
  )
  );// to load controller
}

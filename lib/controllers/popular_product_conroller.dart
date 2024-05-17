import 'package:food_delivery/data/repostiory/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList=>_popularProductList;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) //correct response
    {
      _popularProductList = [];
     // _popularProductList.addAll();// to add data we create model
      update();
    } else {}
  }
}

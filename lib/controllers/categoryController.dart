import 'package:archi_mat/Services/categoryService.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var category = [].obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async {
    var category1 = await CategoryService().getcategory();
    if (category1 != null) {
      category.value = category1['arks'];
    }
  }
}

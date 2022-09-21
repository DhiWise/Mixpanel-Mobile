import '/core/app_export.dart';
import 'package:mixpanelapp/presentation/category_type_screen/models/category_type_model.dart';

class CategoryTypeController extends GetxController {
  Rx<CategoryTypeModel> categoryTypeModelObj = CategoryTypeModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    categoryTypeModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    categoryTypeModelObj.value.dropdownItemList.refresh();
  }
}

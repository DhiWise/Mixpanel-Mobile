import 'package:get/get.dart';
import 'package:mixpanelapp/data/models/selectionPopupModel/selection_popup_model.dart';

class CategoryTypeModel {
  RxList<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "General",
      value: "general"
    ),
    SelectionPopupModel(
      id: 2,
      title: "Unique",
      value: "unique"
    ),
    SelectionPopupModel(
      id: 3,
      title: "Average",
      value: "average"
    )
  ].obs;
}

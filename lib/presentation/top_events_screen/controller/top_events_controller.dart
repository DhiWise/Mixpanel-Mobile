import 'package:mixpanelapp/core/constants/MyConstant.dart';
import 'package:mixpanelapp/data/apiClient/notification_api.dart';
import 'package:mixpanelapp/presentation/top_events_screen/models/top_events_item_model.dart';

import '/core/app_export.dart';
import 'package:mixpanelapp/presentation/top_events_screen/models/top_events_model.dart';

class TopEventsController extends GetxController {
  Rx<TopEventsModel> topEventsModelObj = TopEventsModel().obs;


  @override
  void onReady() {
    addAllEvents();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addAllEvents() {
    List<TopEventsItemModel> topEventsItemModelList = [];
    for (int i = 0; i < MyConstant.myTopEvents.length; i++) {
      var topEventsItemModel = TopEventsItemModel();
      topEventsItemModel.eventNameTxt.value = MyConstant.myTopEvents[i];
      topEventsItemModelList.add(topEventsItemModel);
    }
    topEventsModelObj.value.topEventsItemModelList.value =
        topEventsItemModelList;
  }
}

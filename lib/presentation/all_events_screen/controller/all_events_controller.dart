import 'package:flutter/foundation.dart';
import 'package:mixpanelapp/presentation/all_events_screen/models/listcalendar_item_model.dart';
import '/core/app_export.dart';
import 'package:mixpanelapp/presentation/all_events_screen/models/all_events_model.dart';
import 'package:flutter/material.dart';
import 'package:mixpanelapp/data/models/events/get_events_resp.dart';
import 'package:mixpanelapp/data/apiClient/api_client.dart';
import 'package:mixpanelapp/core/constants/MyConstant.dart';

class AllEventsController extends GetxController {
  Rx<AllEventsModel> allEventsModelObj = AllEventsModel().obs;

  GetEventsResp getEventsResp = GetEventsResp();

  @override
  void onReady() {
    var eventName = Get.find<PrefUtils>().getEventName();
    var eventType = Get.find<PrefUtils>().getEventType();
    super.onReady();
    Map<String, dynamic> queryParams = {
      'project_id': '${MyConstant.projectId}',
      'event': '["$eventName"]',
      'type': '$eventType',
      'unit': MyConstant.unit,
      'from_date': MyConstant.fromDate,
      'to_date': MyConstant.toDate,
    };
    this.callFetchEvents(
      successCall: _onFetchEventsSuccess,
      errCall: _onFetchEventsError,
      queryParams: queryParams,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callFetchEvents(
      {VoidCallback? successCall,
      VoidCallback? errCall,
      Map<String, dynamic> queryParams = const {}}) async {
    return Get.find<ApiClient>().fetchEvents(
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Basic ${MyConstant.baseKey}',
        },
        onSuccess: (resp) {
          onFetchEventsSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchEventsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        queryParams: queryParams);
  }

  void onFetchEventsSuccess(var response) {
    getEventsResp = GetEventsResp.fromJson(response);
  }

  void onFetchEventsError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void _onFetchEventsSuccess() {
    List<ListCalendarItemModel> calendarItemList = [];
    var allData = getEventsResp.data!.values!.allEventData!;

    for(int i = 0; i < allData.eventDate!.length; i++){
      var calenderItemModel = ListCalendarItemModel();
      calenderItemModel.eventDateTxt.value = allData.eventDate![i];
      calenderItemModel.totalCountTxt.value = allData.eventCount![i].toString();
      calendarItemList.add(calenderItemModel);

    }
    allEventsModelObj.value.listcalendarItemList.value = calendarItemList;

  }
  void _onFetchEventsError() {
    Get.snackbar('', "Internet is slow");
  }
}

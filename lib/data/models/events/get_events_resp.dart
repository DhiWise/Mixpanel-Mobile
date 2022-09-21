import 'dart:convert';

import 'package:mixpanelapp/core/app_export.dart';

class GetEventsResp {
  Data? data;
  int? legendSize;
  String? computedAt;

  GetEventsResp({this.data, this.legendSize, this.computedAt});

  GetEventsResp.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    legendSize = json['legend_size'];
    computedAt = json['computed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    if (this.legendSize != null) {
      data['legend_size'] = this.legendSize;
    }
    if (this.computedAt != null) {
      data['computed_at'] = this.computedAt;
    }
    return data;
  }
}

class Data {
  List<String>? series;
  Values? values;

  Data({this.series, this.values});

  Data.fromJson(Map<String, dynamic> json) {
    series = json['series'].cast<String>();
    values = json['values'] != null ? Values.fromJson(json['values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.series != null) {
      data['series'] = this.series;
    }
    if (this.values != null) {
      data['values'] = this.values?.toJson();
    }
    return data;
  }
}

class Values {
  AllEventData? allEventData;
  String? eventName = Get.find<PrefUtils>().getEventName();

  Values({ this.eventName});

  Values.fromJson(Map<String, dynamic> json) {
    allEventData = AllEventData.setAllEventData(json['$eventName']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    return data;
  }
}

class AllEventData {
  List<String>? eventDate;
  List<dynamic>? eventCount;

  AllEventData(this.eventDate, this.eventCount);

  AllEventData.setAllEventData(Map<String, dynamic> eventData) {
    var sortedData = Map.fromEntries(eventData.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
    eventDate = sortedData.entries.map((e) => e.key).toList();
    eventCount = sortedData.entries.map((e) => e.value).toList();
  }
}


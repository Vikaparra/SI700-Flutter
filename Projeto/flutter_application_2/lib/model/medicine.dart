import 'package:flutter/material.dart';

class Medic {
  String _title = "";
  String _description = "";
  String _type = "";
  TimeOfDay? _time;
  

  Medic() {
    String _title = "";
    String _description = "";
    String _type = "";
    TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
    
  }

  Medic.withData({title = "", description = "", type = "", time=""}) {
    _title = title;
    _description = description;
    _type = type;
    _time = time;
  }

  Medic.fromMap(map) {
    _title = map["title"];
    _description = map["description"];
    _type = map["type"];
    _time = map["time"].toDate();
  }

  String get title => _title;
  String get description => _description;
  String get type => _type;
  TimeOfDay get time => _time!;
 
  set title(String newTitle) {
    if (newTitle.isNotEmpty) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.isNotEmpty) {
      _description = newDescription;
    }
  }

  set type(String newType) {
    if (newType.isNotEmpty) {
      _type = newType;
    }
  }

  set time(TimeOfDay newTime) {
    if (newTime.hour!= 25) {
      _time = newTime;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["type"] = _type;
    map["time"] = _time;
    
    return map;
  }
}

import 'package:flutter/material.dart';

class Appoint {
  String _title = "";
  String _description = "";
  String _type = "";
  DateTime? _date;
  

  Appoint() {
    String _title = "";
    String _description = "";
    String _type = "";
    DateTime _date = DateTime(0, 0, 0, 25, 0);
    
  }

  Appoint.withData({title = "", description = "", date = "", type = ""}) {
    _title = title;
    _description = description;
    _type = type;
    _date = date;
    
  }

  Appoint.fromMap(map) {
    _title = map["title"];
    _description = map["description"];
    _type = map["type"];
    _date = map["date"].toDate();
  }

  String get title => _title;
  String get description => _description;
  String get type => _type;
  DateTime get date => _date!;
 

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

  set date(DateTime newDate) {
    if (newDate.day != 0) {
      _date = newDate;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["type"] = _type;
    map["date"] = _date;
    
    return map;
  }
}

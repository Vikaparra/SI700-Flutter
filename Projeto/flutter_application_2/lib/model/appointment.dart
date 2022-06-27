import 'package:flutter/material.dart';

class Appoint {
  String _title = "";
  String _description = "";
  DateTime? _date;

  Appoint() {
    String _title = "";
    String _description = "";
    DateTime _date = DateTime(0, 0, 0, 0, 0);
  }

  Appoint.withData({title = "", description = "", date = "", time = ""}) {
    _title = title;
    _description = description;
    _date = date;
  }

  Appoint.fromMap(map) {
    _title = map["title"];
    _description = map["description"];
    _date = map["date"];
  }

  String get title => _title;
  String get description => _description;
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

  set date(DateTime newDate) {
    if (newDate.day != 0) {
      _date = newDate;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    return map;
  }
}

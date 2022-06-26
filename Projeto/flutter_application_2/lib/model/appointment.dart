class Appoint {
  String _title = "";
  String _description = "";
  // String _date = "";
  // String _time = "";

  Appoint() {
    _title = "";
    _description = "";
    // _date = "";
    // _time = "";
  }

  Appoint.withData({title = "", description = "", date = "", time = ""}) {
    _title = title;
    _description = description;
    // _date = date;
    // _time = time;
  }

  Appoint.fromMap(map) {
    _title = map["title"];
    _description = map["description"];
    // _date = map["date"];
    // _time = map["time"];
  }

  String get title => _title = "";
  String get description => _description = "";
  // String get date => _date = "";
  // String get time => _time = "";

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

  // set date(String newDate) {
  //   if (newDate.isNotEmpty) {
  //     _date = newDate;
  //   }
  // }

  // set time(String newTime) {
  //   if (newTime.isNotEmpty) {
  //     _time = newTime;
  //   }
  // }

  toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    // map["date"] = _date;
    // map["time"] = _time;
    return map;
  }
}

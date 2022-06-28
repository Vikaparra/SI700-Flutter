import 'appointment.dart';

class AppointCollection {
  List<String> idList = [];
  List<Appoint> appointList = [];

  AppointCollection() {
    // Appoint information = Appoint();
    // information.date.toString();
    // information.title.compareTo((a, b) => a.date.compareTo(b.date));
    
    idList = [];
    appointList = [];
  }



  int length() {
    return idList.length;
  }

  Appoint getNodeAtIndex(int index) {
    return appointList[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertAppointOfId(String id, Appoint appoint) {
    int index = getIndexOfId(id);

    if (index != -1) {
      appointList[index] = appoint;
    } else {
      idList.add(id);
      appointList.add(appoint);
    }
  }

  updateAppointOfId(String id, Appoint appoint) {
    int index = getIndexOfId(id);
    if (index != -1) {
      appointList[index] = appoint;
    }
  }

  deleteAppointOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      appointList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertAppointOfId(String id, Appoint appoint) {
    idList.add(id);
    appointList.add(appoint);
    appointList.sort((a,b) {
      return a.date.compareTo(b.date);
    });
  }
}

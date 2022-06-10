import 'userinfo.dart';

class NoteCollection {
  List<String> idList = [];
  List<UserInfo> noteList = [];

  NoteCollection() {
    idList = [];
    noteList = [];
  }

  int length() {
    return idList.length;
  }

  UserInfo getNodeAtIndex(int index) {
    return noteList[index];
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

  updateOrInsertNoteOfId(String id, UserInfo note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
    } else {
      idList.add(id);
      noteList.add(note);
    }
  }

  updateNoteOfId(String id, UserInfo note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
    }
  }

  deleteUserInfoOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertUserInfoOfId(String id, UserInfo note) {
    idList.add(id);
    noteList.add(note);
  }
}

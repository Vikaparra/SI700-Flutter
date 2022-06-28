import 'medicine.dart';

class MedicineCollection {
  List<String> idList = [];
  List<Medic> medicList = [];

  MedicineCollection() {    
    idList = [];
    medicList.sort();
    medicList = [];
  }

  int length() {
    return idList.length;
  }

  Medic getNodeAtIndex(int index) {
    return medicList[index];
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

  updateOrInsertMedicOfId(String id, Medic medic) {
    int index = getIndexOfId(id);

    if (index != -1) {
      medicList[index] = medic;
    } else {
      idList.add(id);
      medicList.add(medic);
    }
  }

  updateMedicOfId(String id, Medic medic) {
    int index = getIndexOfId(id);
    if (index != -1) {
      medicList[index] = medic;
    }
  }

  deleteMedicOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      medicList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertMedicOfId(String id, Medic medic) {
    idList.add(id);
    medicList.add(medic);
  }
}

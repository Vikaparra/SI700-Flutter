class Profile {
  String _name = "";
  String _tel = "";
  String _birthDate = "";
  String _cpf = "";
  String _email = "";
  String _password = "";
  int _cuidador = 1;

  Profile() {
    _name = "";
    _tel = "";
    _birthDate = "";
    _cpf = "";
    _email = "";
    _password = "";
    _cuidador = 1;
  }

  Profile.fromMap(map) {
    _name = map["name"];
    _tel = map["tel"];
    _birthDate = map["birthDate"];
    _cpf = map["cpf"];
    _email = map["email"];
    _password = map["password"];
    _cuidador = map["cuidador"];
  }

  String get name => _name;
  String get birthDate => _birthDate;
  String get tel => _tel;
  String get cpf => _cpf;
  String get email => _email;
  String get password => _password;
  int get cuidador => _cuidador;

  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  set cpf(String newCpf) {
    if (newCpf.isNotEmpty) {
      _cpf = newCpf;
    }
  }

  set birthDate(String newBirthDate) {
    if (newBirthDate.isNotEmpty) {
      _birthDate = newBirthDate;
    }
  }

  set tel(String newTel) {
    if (newTel.isNotEmpty) {
      _tel = newTel;
    }
  }

  set email(String newEmail) {
    if (newEmail.isNotEmpty) {
      _email = newEmail;
    }
  }

  set password(String newPass) {
    if (newPass.isNotEmpty) {
      _password = newPass;
    }
  }

  set cuidador(int newCuidador) {
    _cuidador = newCuidador;
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["tel"] = _tel;
    map["birthDate"] = _birthDate;
    map["cpf"] = _cpf;
    map["email"] = _email;
    map["password"] = _password;
    map["cuidador"] = _cuidador;
    return map;
  }
}

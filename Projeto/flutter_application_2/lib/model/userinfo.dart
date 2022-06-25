class UserInfo {
  String _name = "";
  String _tel = "";
  String _birthDate = "";
  String _cpf = "";
  String _email = "";
  String _password = "";
  int _cuidador = -8;

  UserInfo() {
    String _name = "";
    String _tel = "";
    String _birthDate = "";
    String _cpf = "";
    String _email = "";
    String _password = "";
    int _cuidador = -2;
  }

  UserInfo.withData(
      {name = "",
      tel = "",
      birthDate = "",
      cpf = "",
      email = "",
      password = "",
      cuidador = -4}) {
    String _name = name;
    String _tel = tel;
    String _birthDate = birthDate;
    String _cpf = cpf;
    String _email = email;
    String _password = password;
    int _cuidador = cuidador;
  }

  UserInfo.fromMap(map) {
    _name = map["Nome"];
    _tel = map["Telefone"];
    _birthDate = map["Nascimento"];
    _cpf = map["CPF"];
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

  set tel(String newTel) {
    if (newTel.isNotEmpty) {
      _tel = newTel;
    }
  }

  set birthDate(String newBirthDate) {
    if (newBirthDate.isNotEmpty) {
      _birthDate = newBirthDate;
    }
  }

  set cpf(String newCpf) {
    if (newCpf.isNotEmpty) {
      _cpf = newCpf;
    }
  }

  set email(String newEmail) {
    if (newEmail.isNotEmpty) {
      _email = newEmail;
    }
  }

  set password(String newPassword) {
    if (newPassword.isNotEmpty) {
      _password = newPassword;
    }
  }

  set cuidador(int newCuidador) {
    if (newCuidador != -1) {
      _cuidador = newCuidador;
    }
  }

  toMap(UserInfo value) {
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

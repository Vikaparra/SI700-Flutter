// Data Provider para o banco de dados local sqflite
import 'package:dio/dio.dart';
import '../model/profile.dart';

class RestServer {
  // Atributo que irá afunilar todas as consultas
  static RestServer helper = RestServer._createInstance();

  // Construtor privado
  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl = "https://si7001s242265-default-rtdb.firebaseio.com/";
  String suffixUrl = "/.json";

  Future<Profile> getProfile(profileId) async {
    Response response = await _dio.get(prefixUrl + profileId + suffixUrl);
    return Profile.fromMap(response.data);
  } //como ainda não estamos imprimindo as informações no app, ainda não é usado

  Future<int> insertProfile(Profile profile) async {
    Response response = await _dio.post(
      prefixUrl + suffixUrl,
      data: profile.toMap(),
    );
    return 42;
  }
}

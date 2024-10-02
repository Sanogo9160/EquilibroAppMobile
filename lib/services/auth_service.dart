import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/auth_request.dart';
import '../models/utilisateur.dart';

class AuthService{

  final Dio dio = Dio();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final String baseUrl = "http://localhost:8080/api/auth"; // À ajuster si nécessaire
  Utilisateur? currentUser;

  Future<String?> login(AuthRequest request) async {
    try {
      final response = await dio.post(
        '$baseUrl/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];
        await storage.write(key: 'jwt_token', value: token);
        // Si votre backend renvoie également les informations de l'utilisateur lors de la connexion
        if (response.data.containsKey('user')) {
          currentUser = Utilisateur.fromJson(response.data['user']);
        }
        return token;
      }
    } catch (e) {
      print("Erreur d'authentification : $e");
      return null;
    }
    return null;
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
    currentUser = null;
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  Future<void> loadCurrentUser() async {
    final token = await getToken();
    if (token != null) {
      try {
        final response = await dio.get(
          '$baseUrl/login', // Assurez-vous que ce point de terminaison existe dans votre backend
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );

        if (response.statusCode == 200) {
          currentUser = Utilisateur.fromJson(response.data['user']);
        }
      } catch (e) {
        print("Erreur lors du chargement de l'utilisateur : $e");
      }
    }
  }

}

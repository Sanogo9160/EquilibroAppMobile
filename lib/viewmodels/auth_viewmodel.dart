import 'package:equilibroapp/models/utilisateur.dart';
import 'package:flutter/material.dart';
import '../models/auth_request.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Utilisateur? get currentUser => _authService.currentUser;

  Future<void> login(String email, String motDePasse) async {
    _isLoading = true;
    notifyListeners();

    AuthRequest request = AuthRequest(email: email, motDePasse: motDePasse);
    String? token = await _authService.login(request);

    _isLoading = false;
    notifyListeners();

    if (token != null) {
      // Actions supplémentaires après une connexion réussie (si nécessaire)
    } else {
      // Gérer l'échec de la connexion (afficher un message d'erreur, etc.)
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }

  Future<void> loadCurrentUser() async {
    await _authService.loadCurrentUser();
    notifyListeners();
  }

}

class CalculateurBMR {
  static double calculerBMR(double poids, double taille, int age, String sexe) {
    if (sexe.toLowerCase() == "homme") {
      return 88.362 + (13.397 * poids) + (4.799 * taille) - (5.677 * age);
    } else if (sexe.toLowerCase() == "femme") {
      return 447.593 + (9.247 * poids) + (3.098 * taille) - (4.330 * age);
    } else {
      throw ArgumentError("Sexe non valide");
    }
  }

  static double calculerBesoinsCaloriques(double bmr, String niveauActivite) {
    switch (niveauActivite.toLowerCase()) {
      case "sédentaire":
        return bmr * 1.2;
      case "légèrement actif":
        return bmr * 1.375;
      case "modérément actif":
        return bmr * 1.55;
      case "très actif":
        return bmr * 1.725;
      case "extrêmement actif":
        return bmr * 1.9;
      default:
        throw ArgumentError("Niveau d'activité non valide");
    }
  }
}

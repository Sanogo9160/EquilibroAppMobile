import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/plan_de_repas.dart';
import '../models/repas.dart';
import '../models/recette.dart';
import '../models/utilisateur.dart';
import '../models/apports_nutritionnels.dart'; // Assurez-vous d'importer cette classe
import '../services/planification_service.dart';

class PlanificationRepasScreen extends StatefulWidget {
  final Utilisateur utilisateur; // Ajout de l'utilisateur

  const PlanificationRepasScreen({Key? key, required this.utilisateur}) : super(key: key);

  @override
  _PlanificationRepasScreenState createState() => _PlanificationRepasScreenState();
}

class _PlanificationRepasScreenState extends State<PlanificationRepasScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController typeRepasController = TextEditingController();
  final TextEditingController heureController = TextEditingController();
  final TextEditingController recetteNomController = TextEditingController();
  final TextEditingController recetteDescriptionController = TextEditingController();
  final TextEditingController recetteIngredientsController = TextEditingController();

  // Ajoutez des contrôleurs pour les apports nutritionnels
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController proteinesController = TextEditingController();
  final TextEditingController glucidesController = TextEditingController();
  final TextEditingController lipidesController = TextEditingController();

  List<Recette> recettes = []; // Liste des recettes à ajouter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planification des Repas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PlanificationService>(
              builder: (context, service, child) {
                return ListView.builder(
                  itemCount: service.planDeRepas.length,
                  itemBuilder: (context, index) {
                    final plan = service.planDeRepas[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('Plan du ${plan.date.toLocal()}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: plan.repas.map((repas) {
                            return Text('${repas.typeRepas} à ${repas.heure} - Recettes: ${repas.recettes.map((r) => r.nom).join(', ')}');
                          }).toList(),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            service.supprimerPlanDeRepas(index);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                ),
                TextField(
                  controller: typeRepasController,
                  decoration: InputDecoration(labelText: 'Type de repas (Petit-déjeuner, Déjeuner, Dîner)'),
                ),
                TextField(
                  controller: heureController,
                  decoration: InputDecoration(labelText: 'Heure (HH:MM)'),
                ),
                TextField(
                  controller: recetteNomController,
                  decoration: InputDecoration(labelText: 'Nom de la recette'),
                ),
                TextField(
                  controller: recetteDescriptionController,
                  decoration: InputDecoration(labelText: 'Description de la recette'),
                ),
                TextField(
                  controller: recetteIngredientsController,
                  decoration: InputDecoration(labelText: 'Ingrédients (séparés par des virgules)'),
                ),
                // Champs pour les apports nutritionnels
                TextField(
                  controller: caloriesController,
                  decoration: InputDecoration(labelText: 'Calories'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: proteinesController,
                  decoration: InputDecoration(labelText: 'Protéines (g)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: glucidesController,
                  decoration: InputDecoration(labelText: 'Glucides (g)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: lipidesController,
                  decoration: InputDecoration(labelText: 'Lipides (g)'),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Créez la recette
                    final recette = Recette(
                      id: DateTime.now().millisecondsSinceEpoch, // Un identifiant unique temporaire
                      nom: recetteNomController.text,
                      description: recetteDescriptionController.text,
                      ingredients: recetteIngredientsController.text.split(','),
                      apportsNutritionnels: ApportsNutritionnels(
                        calories: double.parse(caloriesController.text),
                        proteines: double.parse(proteinesController.text),
                        glucides: double.parse(glucidesController.text),
                        lipides: double.parse(lipidesController.text),
                      ),
                    );

                    setState(() {
                      recettes.add(recette); // Ajoutez la recette à la liste des recettes
                    });

                    // Réinitialisez les champs de texte pour les recettes et les apports nutritionnels
                    recetteNomController.clear();
                    recetteDescriptionController.clear();
                    recetteIngredientsController.clear();
                    caloriesController.clear();
                    proteinesController.clear();
                    glucidesController.clear();
                    lipidesController.clear();
                  },
                  child: Text('Ajouter Recette'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Créez le repas
                    final repas = Repas(
                      id: DateTime.now().millisecondsSinceEpoch, // Un identifiant unique temporaire
                      typeRepas: typeRepasController.text,
                      heure: DateTime.parse('${dateController.text} ${heureController.text}'),
                      recettes: recettes,
                      utilisateur: widget.utilisateur, // Utilisation de l'utilisateur actuel
                    );

                    // Créez le plan de repas
                    final planDeRepas = PlanDeRepas(
                      id: DateTime.now().millisecondsSinceEpoch, // Un identifiant unique temporaire
                      date: DateTime.parse(dateController.text),
                      repas: [repas],
                      utilisateur: widget.utilisateur, // Utilisation de l'utilisateur actuel
                    );

                    // Ajoutez le plan de repas au service
                    Provider.of<PlanificationService>(context, listen: false).ajouterPlanDeRepas(planDeRepas);

                    // Réinitialisez les champs de texte pour le plan de repas
                    dateController.clear();
                    typeRepasController.clear();
                    heureController.clear();
                    recettes.clear(); // Réinitialisez la liste des recettes
                  },
                  child: Text('Ajouter Plan de Repas'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

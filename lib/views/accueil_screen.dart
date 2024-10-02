import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccueilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        backgroundColor: Color(0xFF03076D),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.bell, color: Colors.white),
            onPressed: () {
              // Action pour les notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Bienvenue !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Liste des fonctionnalités principales
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: <Widget>[
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.userPlus,
                    'Profils de santé',
                    '/creationProfil',
                  ),
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.utensils,
                    'Planification de repas',
                    '/planificationRepas',
                  ),
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.chartPie,
                    'Suivi nutritionnel',
                    '/suiviNutritionnel',
                  ),
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.bell,
                    'Alertes et rappels',
                    '/alertesRappels',
                  ),
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.bookOpen,
                    'Recettes personnalisées',
                    '/recettes',
                  ),
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.userMd,
                    'Consultations diététiques',
                    '/consultations',
                  ),
                  _buildFeatureCard(
                    context,
                    FontAwesomeIcons.fileAlt,
                    'Rapports de progression',
                    '/rapports',
                  ),
                  // Ajoutez d'autres cartes de fonctionnalité selon besoin
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String title, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.black),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

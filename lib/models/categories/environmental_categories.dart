import 'package:flutter/material.dart';
import '../category.dart';

class EnvironmentalCategories {
  /// Get environmental categories for a specific animal
  /// Note: Environmental categories are the same for all animals
  static List<Category> getEnvironmentalCategoriesForAnimal(String animalId) {
    return [
      Category(
        id: 'chemical_environment',
        label: 'Chemical Environment',
        icon: Icons.science,
        imagePath: 'assets/images/environmental/chemical_environment.webp',
      ),
      Category(
        id: 'climatic_seasonal_environment',
        label: 'Climatic Seasonal Environment',
        icon: Icons.wb_sunny,
        imagePath: 'assets/images/environmental/climatic_seasonal_environment.webp',
      ),
      Category(
        id: 'emf_environment',
        label: 'EMF Environment',
        icon: Icons.wifi,
        imagePath: 'assets/images/environmental/emf_environment.webp',
      ),
      Category(
        id: 'geopathic_earth_energies',
        label: 'Geopathic Earth Energies',
        icon: Icons.terrain,
        imagePath: 'assets/images/environmental/geopathic_earth_energies.webp',
      ),
      Category(
        id: 'human_emotional_environment',
        label: 'Human Emotional Environment',
        icon: Icons.people,
        imagePath: 'assets/images/environmental/human_emotional_environment.webp',
      ),
      Category(
        id: 'physical_environment',
        label: 'Physical Environment',
        icon: Icons.home,
        imagePath: 'assets/images/environmental/physical_environment.webp',
      ),
      Category(
        id: 'routine_management_environment',
        label: 'Routine Management Environment',
        icon: Icons.schedule,
        imagePath: 'assets/images/environmental/routine_management_environment.webp',
      ),
      Category(
        id: 'social_environment',
        label: 'Social Environment',
        icon: Icons.group,
        imagePath: 'assets/images/environmental/social_environment_${animalId}.webp',
      ),
    ];
  }
}

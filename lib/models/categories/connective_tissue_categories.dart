import 'package:flutter/material.dart';
import '../category.dart';
import 'skeletal_categories.dart';

class ConnectiveTissueCategories {
  /// Get connective tissue categories for a specific animal
  static List<Category> getConnectiveTissueCategoriesForAnimal(String animalId) {
    // Horse, dog, and cat have the same connective tissue categories
    if (animalId == 'horse' || animalId == 'dog' || animalId == 'cat') {
      return [
        Category(
          id: 'skeleton',
          label: 'Skeleton',
          icon: Icons.accessibility,
          imagePath: 'assets/images/$animalId/skeleton.webp',
          subcategories: SkeletalCategories.getSkeletalSystemCategoriesForAnimal(animalId),
        ),
        Category(
          id: 'adipose_tissue',
          label: 'Adipose Tissue',
          icon: Icons.layers,
          imagePath: 'assets/images/connective_tissue/adipose_tissue.webp',
        ),
        Category(
          id: 'blood',
          label: 'Blood',
          icon: Icons.bloodtype,
          imagePath: 'assets/images/connective_tissue/blood.webp',
        ),
        Category(
          id: 'cartilage',
          label: 'Cartilage',
          icon: Icons.layers,
          imagePath: 'assets/images/connective_tissue/cartilage.webp',
        ),
        Category(
          id: 'fascia',
          label: 'Fascia',
          icon: Icons.layers,
          imagePath: 'assets/images/connective_tissue/fascia.webp',
        ),
        Category(
          id: 'ligaments',
          label: 'Ligaments',
          icon: Icons.link,
          imagePath: 'assets/images/connective_tissue/ligaments.webp',
        ),
        Category(
          id: 'lymph',
          label: 'Lymph',
          icon: Icons.water,
          imagePath: 'assets/images/connective_tissue/lymph.webp',
        ),
        Category(
          id: 'tendons',
          label: 'Tendons',
          icon: Icons.link,
          imagePath: 'assets/images/connective_tissue/tendons.webp',
        ),
      ];
    }

    // Bird has different connective tissue types
    if (animalId == 'bird') {
      return [
        Category(
          id: 'skeleton',
          label: 'Skeleton',
          icon: Icons.accessibility,
          imagePath: 'assets/images/$animalId/skeleton.webp',
          subcategories: SkeletalCategories.getSkeletalSystemCategoriesForAnimal(animalId),
        ),
        Category(
          id: 'aponeuroses',
          label: 'Aponeuroses',
          icon: Icons.layers,
          imagePath: 'assets/images/connective_tissue/aponeuroses.webp',
        ),
        Category(
          id: 'areolar',
          label: 'Areolar',
          icon: Icons.grain,
          imagePath: 'assets/images/connective_tissue/areolar.webp',
        ),
        Category(
          id: 'blood',
          label: 'Blood',
          icon: Icons.bloodtype,
          imagePath: 'assets/images/connective_tissue/blood.webp',
        ),
        Category(
          id: 'cartilage',
          label: 'Cartilage',
          icon: Icons.layers,
          imagePath: 'assets/images/connective_tissue/cartilage.webp',
        ),
        Category(
          id: 'elastic',
          label: 'Elastic',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/connective_tissue/elastic.webp',
        ),
        Category(
          id: 'fascia',
          label: 'Fascia',
          icon: Icons.layers,
          imagePath: 'assets/images/connective_tissue/fascia.webp',
        ),
        Category(
          id: 'ligaments',
          label: 'Ligaments',
          icon: Icons.link,
          imagePath: 'assets/images/connective_tissue/ligaments.webp',
        ),
        Category(
          id: 'lymph',
          label: 'Lymph',
          icon: Icons.water,
          imagePath: 'assets/images/connective_tissue/lymph.webp',
        ),
        Category(
          id: 'reticular',
          label: 'Reticular',
          icon: Icons.grid_on,
          imagePath: 'assets/images/connective_tissue/reticular.webp',
        ),
        Category(
          id: 'tendons',
          label: 'Tendons',
          icon: Icons.link,
          imagePath: 'assets/images/connective_tissue/tendons.webp',
        ),
      ];
    }

    // Default: return empty list for unknown animals
    return [];
  }
}

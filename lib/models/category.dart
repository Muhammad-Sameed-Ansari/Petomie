import 'package:flutter/material.dart';
import 'categories/energy_categories.dart';
import 'categories/skeletal_categories.dart';
import 'categories/muscles_categories.dart';
import 'categories/systems_categories.dart';
import 'categories/connective_tissue_categories.dart';
import 'categories/organs_categories.dart';
import 'categories/glands_categories.dart';
import 'categories/sensory_categories.dart';
import 'categories/holistic_remedies_categories.dart';
import 'categories/environmental_categories.dart';

/// Represents a category in the navigation hierarchy
class Category {
  final String id;
  final String label;
  final IconData icon;
  final String? imagePath;
  final List<Category> subcategories;
  final VoidCallback? onTap;
  final bool isComingSoon;

  const Category({
    required this.id,
    required this.label,
    required this.icon,
    this.imagePath,
    this.subcategories = const [],
    this.onTap,
    this.isComingSoon = false,
  });

  /// Whether this category has subcategories
  bool get hasSubcategories => subcategories.isNotEmpty;

  /// Creates a copy of this category with new subcategories
  Category copyWith({List<Category>? subcategories}) {
    return Category(
      id: id,
      label: label,
      icon: icon,
      imagePath: imagePath,
      subcategories: subcategories ?? this.subcategories,
      onTap: onTap,
      isComingSoon: isComingSoon,
    );
  }

  @override
  String toString() => 'Category(id: $id, label: $label, hasSubcategories: $hasSubcategories)';
}

/// Predefined category data for the app
class CategoryData {
  // Cache for generated subcategories to avoid regeneration
  static final Map<String, List<Category>> _anatomyCache = {};

  /// Get energy categories for a specific animal with caching
  static List<Category> getEnergyCategoriesForAnimal(String animalId) {
    return EnergyCategories.getEnergyCategoriesForAnimal(animalId);
  }

  /// Get skeletal system categories for a specific animal
  static List<Category> getSkeletalSystemCategoriesForAnimal(String animalId) {
    return SkeletalCategories.getSkeletalSystemCategoriesForAnimal(animalId);
  }

  /// Get muscles categories for a specific animal
  static List<Category> getMusclesCategoriesForAnimal(String animalId) {
    return MusclesCategories.getMusclesCategoriesForAnimal(animalId);
  }

  /// Get body systems categories for a specific animal
  static List<Category> getSystemsCategoriesForAnimal(String animalId) {
    return SystemsCategories.getSystemsCategoriesForAnimal(animalId);
  }

  /// Get connective tissue categories for a specific animal
  static List<Category> getConnectiveTissueCategoriesForAnimal(String animalId) {
    return ConnectiveTissueCategories.getConnectiveTissueCategoriesForAnimal(animalId);
  }

  /// Get organs categories for a specific animal
  static List<Category> getOrgansCategoriesForAnimal(String animalId) {
    return OrgansCategories.getOrgansCategoriesForAnimal(animalId);
  }

  /// Get glands categories for a specific animal
  static List<Category> getGlandsCategoriesForAnimal(String animalId) {
    return GlandsCategories.getGlandsCategoriesForAnimal(animalId);
  }

  /// Get sensory categories for a specific animal
  static List<Category> getSensoryCategoriesForAnimal(String animalId) {
    return SensoryCategories.getSensoryCategoriesForAnimal(animalId);
  }

  /// Get holistic remedies categories for a specific animal
  static List<Category> getHolisticRemediesCategoriesForAnimal(String animalId) {
    return HolisticRemediesCategories.getHolisticRemediesCategoriesForAnimal(animalId);
  }

  /// Get environmental categories for a specific animal
  static List<Category> getEnvironmentalCategoriesForAnimal(String animalId) {
    return EnvironmentalCategories.getEnvironmentalCategoriesForAnimal(animalId);
  }

  /// Get anatomy categories for a specific animal with caching
  static List<Category> getAnatomyCategoriesForAnimal(String animalId) {
    print("sameed - getAnatomyCategoriesForAnimal - animalId: $animalId");
    
    // Check cache first
    if (_anatomyCache.containsKey(animalId)) {
      print("sameed - returning cached anatomy categories for $animalId");
      return _anatomyCache[animalId]!;
    }
    
    // Generate categories and cache them
    final categories = [
      Category(
        id: 'energy',
        label: 'Energy',
        icon: Icons.flash_on,
        imagePath: 'assets/images/$animalId/energy.webp',
        // Lazy load energy subcategories only when needed
      ),
      Category(
        id: 'skeleton',
        label: 'Skeleton',
        icon: Icons.accessibility,
        imagePath: 'assets/images/$animalId/skeleton.webp',
        subcategories: getSkeletalSystemCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'connective_tissue',
        label: 'Connective Tissue',
        icon: Icons.layers,
        imagePath: 'assets/images/$animalId/connective_tissue.webp',
        subcategories: getConnectiveTissueCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'muscles',
        label: 'Muscles',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/$animalId/muscles.webp',
        subcategories: getMusclesCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'organs',
        label: 'Organs',
        icon: Icons.favorite,
        imagePath: 'assets/images/$animalId/organs.webp',
        subcategories: getOrgansCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'glands',
        label: 'Glands',
        icon: Icons.scatter_plot,
        imagePath: 'assets/images/$animalId/glands.webp',
        subcategories: getGlandsCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'systems',
        label: 'Systems',
        icon: Icons.psychology,
        imagePath: 'assets/images/$animalId/systems.webp',
        subcategories: getSystemsCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'sensory',
        label: 'Sensory',
        icon: Icons.visibility,
        imagePath: 'assets/images/$animalId/sensory.webp',
        subcategories: getSensoryCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'holistic_remedies',
        label: 'Holistic Remedies',
        icon: Icons.visibility,
        imagePath: 'assets/images/holistic_remedies.webp',
        subcategories: getHolisticRemediesCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'environmental',
        label: 'Environmental',
        icon: Icons.nature,
        imagePath: 'assets/images/environmental.webp',
        subcategories: getEnvironmentalCategoriesForAnimal(animalId),
      ),
    ];
    
    _anatomyCache[animalId] = categories;
    return categories;
  }

  static List<Category> get mainCategories {
    print("sameed - CategoryData - get mainCategories");
    return [
      Category(
        id: 'horse',
        label: 'Horse',
        icon: Icons.pets,
        imagePath: 'assets/images/horse.webp',
        // No subcategories loaded initially
      ),
      Category(
        id: 'dog',
        label: 'Dog',
        icon: Icons.pets,
        imagePath: 'assets/images/dog.webp',
        // No subcategories loaded initially
      ),
      Category(
        id: 'cat',
        label: 'Cat',
        icon: Icons.pets,
        imagePath: 'assets/images/cat.webp',
        // No subcategories loaded initially
      ),
      Category(
        id: 'bird',
        label: 'Bird',
        icon: Icons.flutter_dash,
        imagePath: 'assets/images/bird.webp',
        // No subcategories loaded initially
      ),
      Category(
        id: 'cow',
        label: 'Cow',
        icon: Icons.pets,
        imagePath: 'assets/images/cow.webp',
        isComingSoon: true,
        // No subcategories loaded initially
      ),
      Category(
        id: 'guineapig',
        label: 'Guinea Pig',
        icon: Icons.pets,
        imagePath: 'assets/images/guineapig.webp',
        isComingSoon: true,
        // No subcategories loaded initially
      ),
      Category(
        id: 'rabbit',
        label: 'Rabbit',
        icon: Icons.pets,
        imagePath: 'assets/images/rabbit.webp',
        isComingSoon: true,
        // No subcategories loaded initially
      ),
    ];
  }

  /// Get a main category with its subcategories loaded lazily
  static Category? getMainCategoryWithSubcategories(String animalId) {
    print("sameed - getMainCategoryWithSubcategories - animalId: $animalId");
    
    final mainCategory = mainCategories.firstWhere(
      (category) => category.id == animalId,
      orElse: () => throw ArgumentError('Animal category not found: $animalId'),
    );
    
    // Return category with lazily loaded subcategories
    return mainCategory.copyWith(
      subcategories: getAnatomyCategoriesForAnimal(animalId),
    );
  }
  
  /// Get energy subcategories for a specific anatomy category
  static Category? getAnatomyCategoryWithEnergySubcategories(String animalId, String categoryId) {
    print("sameed - getAnatomyCategoryWithEnergySubcategories - animalId: $animalId, categoryId: $categoryId");
    
    if (categoryId == 'energy') {
      return Category(
        id: 'energy',
        label: 'Energy',
        icon: Icons.flash_on,
        imagePath: 'assets/images/$animalId/energy.webp',
        subcategories: getEnergyCategoriesForAnimal(animalId),
      );
    }
    
    // For other categories, get from cached anatomy categories
    final anatomyCategories = getAnatomyCategoriesForAnimal(animalId);
    return anatomyCategories.firstWhere(
      (category) => category.id == categoryId,
      orElse: () => throw ArgumentError('Anatomy category not found: $categoryId'),
    );
  }

  /// Get a category by its ID from a list of categories
  static Category? findCategoryById(String id, List<Category> categories) {
    for (final category in categories) {
      if (category.id == id) {
        return category;
      }
      final found = findCategoryById(id, category.subcategories);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  /// Clear anatomy cache for a specific animal or all animals
  static void clearAnatomyCache([String? animalId]) {
    if (animalId != null) {
      _anatomyCache.remove(animalId);
    } else {
      _anatomyCache.clear();
    }
  }

  /// Clear energy cache for a specific animal or all animals
  static void clearEnergyCache([String? animalId]) {
    EnergyCategories.clearCache(animalId);
  }
}

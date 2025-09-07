import 'package:flutter/material.dart';

/// Represents a category in the navigation hierarchy
class Category {
  final String id;
  final String label;
  final IconData icon;
  final String? imagePath;
  final List<Category> subcategories;
  final VoidCallback? onTap;

  const Category({
    required this.id,
    required this.label,
    required this.icon,
    this.imagePath,
    this.subcategories = const [],
    this.onTap,
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
    );
  }

  @override
  String toString() => 'Category(id: $id, label: $label, hasSubcategories: $hasSubcategories)';
}

/// Predefined category data for the app
class CategoryData {
  // Anatomy categories that will be used for all animals
  static final List<Category> anatomyCategories = [
    Category(
      id: 'energy',
      label: 'Energy',
      icon: Icons.flash_on,
    ),
    Category(
      id: 'skeletal_system',
      label: 'Skeletal System',
      icon: Icons.accessibility,
    ),
    Category(
      id: 'muscular_system',
      label: 'Muscular System',
      icon: Icons.fitness_center,
    ),
    Category(
      id: 'organ_gland_system',
      label: 'Organ & Gland System',
      icon: Icons.favorite,
    ),
    Category(
      id: 'body_systems',
      label: 'Body Systems',
      icon: Icons.psychology,
    ),
    Category(
      id: 'sensory_external_structures',
      label: 'Sensory & External Structures',
      icon: Icons.visibility,
    ),
  ];

  static final List<Category> mainCategories = [
    Category(
      id: 'horse',
      label: 'Horse',
      icon: Icons.pets,
      imagePath: 'assets/images/horse_transparent.png',
      subcategories: anatomyCategories,
    ),
    Category(
      id: 'dog',
      label: 'Dog',
      icon: Icons.pets,
      imagePath: 'assets/images/dog_transparent.png',
      subcategories: anatomyCategories,
    ),
    Category(
      id: 'cat',
      label: 'Cat',
      icon: Icons.pets,
      imagePath: 'assets/images/cat_transparent.png',
      subcategories: anatomyCategories,
    ),
    Category(
      id: 'bird',
      label: 'Bird',
      icon: Icons.flutter_dash,
      imagePath: 'assets/images/bird_transparent.png',
      subcategories: anatomyCategories,
    ),
  ];

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
}

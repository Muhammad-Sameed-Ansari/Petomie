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
  // Energy subcategories for detailed energy anatomy
  static final List<Category> energyCategories = [
    Category(
      id: 'main_category',
      label: 'Main Category',
      icon: Icons.category,
    ),
    Category(
      id: 'chakras',
      label: 'Chakras',
      icon: Icons.brightness_7,
    ),
    Category(
      id: 'aura_energy_field',
      label: 'Aura & Energy Field',
      icon: Icons.blur_circular,
    ),
    Category(
      id: 'meridians',
      label: 'Meridians',
      icon: Icons.linear_scale,
    ),
    Category(
      id: 'life_force_vital_energy',
      label: 'Life Force / Vital Energy',
      icon: Icons.energy_savings_leaf,
    ),
    Category(
      id: 'energy_imbalances',
      label: 'Energy Imbalances',
      icon: Icons.balance,
    ),
    Category(
      id: 'energy_connections',
      label: 'Energy Connections',
      icon: Icons.device_hub,
    ),
    Category(
      id: 'sacred_geometry_vibrational_patterns',
      label: 'Sacred Geometry & Vibrational Patterns',
      icon: Icons.hexagon,
    ),
    Category(
      id: 'states_of_harmony',
      label: 'States of Harmony',
      icon: Icons.self_improvement,
    ),
    Category(
      id: 'energetic_influences',
      label: 'Energetic Influences',
      icon: Icons.waves,
    ),
    Category(
      id: 'negative_beliefs',
      label: 'Negative Beliefs',
      icon: Icons.psychology_alt,
    ),
    Category(
      id: 'unresolved_emotions',
      label: 'Unresolved Emotions',
      icon: Icons.sentiment_dissatisfied,
    ),
  ];

  // Mock subcategories for Skeletal System
  static final List<Category> skeletalSystemCategories = [
    Category(id: 'bones', label: 'Bones', icon: Icons.straighten),
    Category(id: 'joints', label: 'Joints', icon: Icons.join_inner),
    Category(id: 'cartilage', label: 'Cartilage', icon: Icons.layers),
    Category(id: 'bone_marrow', label: 'Bone Marrow', icon: Icons.circle),
    Category(id: 'skeletal_development', label: 'Skeletal Development', icon: Icons.trending_up),
  ];

  // Mock subcategories for Muscular System
  static final List<Category> muscularSystemCategories = [
    Category(id: 'skeletal_muscles', label: 'Skeletal Muscles', icon: Icons.fitness_center),
    Category(id: 'cardiac_muscle', label: 'Cardiac Muscle', icon: Icons.favorite),
    Category(id: 'smooth_muscle', label: 'Smooth Muscle', icon: Icons.waves),
    Category(id: 'muscle_fibers', label: 'Muscle Fibers', icon: Icons.linear_scale),
    Category(id: 'tendons_ligaments', label: 'Tendons & Ligaments', icon: Icons.link),
    Category(id: 'muscle_groups', label: 'Muscle Groups', icon: Icons.group_work),
  ];

  // Mock subcategories for Organ & Gland System
  static final List<Category> organGlandSystemCategories = [
    Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
    Category(id: 'lungs', label: 'Lungs', icon: Icons.air),
    Category(id: 'liver', label: 'Liver', icon: Icons.local_hospital),
    Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
    Category(id: 'digestive_organs', label: 'Digestive Organs', icon: Icons.restaurant),
    Category(id: 'endocrine_glands', label: 'Endocrine Glands', icon: Icons.scatter_plot),
    Category(id: 'reproductive_organs', label: 'Reproductive Organs', icon: Icons.family_restroom),
  ];

  // Mock subcategories for Body Systems
  static final List<Category> bodySystemsCategories = [
    Category(id: 'nervous_system', label: 'Nervous System', icon: Icons.psychology),
    Category(id: 'circulatory_system', label: 'Circulatory System', icon: Icons.bloodtype),
    Category(id: 'respiratory_system', label: 'Respiratory System', icon: Icons.air),
    Category(id: 'digestive_system', label: 'Digestive System', icon: Icons.restaurant),
    Category(id: 'immune_system', label: 'Immune System', icon: Icons.shield),
    Category(id: 'lymphatic_system', label: 'Lymphatic System', icon: Icons.water),
    Category(id: 'urinary_system', label: 'Urinary System', icon: Icons.opacity),
  ];

  // Mock subcategories for Sensory & External Structures
  static final List<Category> sensoryExternalCategories = [
    Category(id: 'eyes_vision', label: 'Eyes & Vision', icon: Icons.visibility),
    Category(id: 'ears_hearing', label: 'Ears & Hearing', icon: Icons.hearing),
    Category(id: 'nose_smell', label: 'Nose & Smell', icon: Icons.air),
    Category(id: 'tongue_taste', label: 'Tongue & Taste', icon: Icons.emoji_food_beverage),
    Category(id: 'skin_touch', label: 'Skin & Touch', icon: Icons.touch_app),
    Category(id: 'fur_hair', label: 'Fur & Hair', icon: Icons.brush),
    Category(id: 'claws_hooves', label: 'Claws & Hooves', icon: Icons.pets),
    Category(id: 'tail_ears', label: 'Tail & Ears', icon: Icons.pets),
  ];

  // Anatomy categories that will be used for all animals
  static final List<Category> anatomyCategories = [
    Category(
      id: 'energy',
      label: 'Energy',
      icon: Icons.flash_on,
      subcategories: energyCategories,
    ),
    Category(
      id: 'skeletal_system',
      label: 'Skeletal System',
      icon: Icons.accessibility,
      subcategories: skeletalSystemCategories,
    ),
    Category(
      id: 'muscular_system',
      label: 'Muscular System',
      icon: Icons.fitness_center,
      subcategories: muscularSystemCategories,
    ),
    Category(
      id: 'organ_gland_system',
      label: 'Organ & Gland System',
      icon: Icons.favorite,
      subcategories: organGlandSystemCategories,
    ),
    Category(
      id: 'body_systems',
      label: 'Body Systems',
      icon: Icons.psychology,
      subcategories: bodySystemsCategories,
    ),
    Category(
      id: 'sensory_external_structures',
      label: 'Sensory & External Structures',
      icon: Icons.visibility,
      subcategories: sensoryExternalCategories,
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

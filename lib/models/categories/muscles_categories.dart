import 'package:flutter/material.dart';
import '../category.dart';

class MusclesCategories {
  /// Get muscles categories for a specific animal
  static List<Category> getMusclesCategoriesForAnimal(String animalId) {
    String animal = animalId.toLowerCase();
    
    switch (animal) {
      case 'horse':
        return _getHorseMusclesCategories();
      case 'dog':
        return _getDogMusclesCategories();
      case 'cat':
        return _getCatMusclesCategories();
      case 'bird':
        return _getBirdMusclesCategories();
      default:
        return _getDefaultMusclesCategories(animalId);
    }
  }

  // Horse muscles categories based on actual folder structure
  static List<Category> _getHorseMusclesCategories() {
    return [
      // Abdominal
      Category(
        id: 'abdominal',
        label: 'Abdominal',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/abdominal.webp'),
          Category(id: 'deep_layer', label: 'Deep Layer', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/abdominal.webp'),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/abdominal.webp'),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/abdominal.webp'),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/abdominal.webp'),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/back.webp',
        subcategories: [
          Category(id: 'deep_layer_core_stability', label: 'Deep Layer Core Stability', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/back.webp'),
          Category(id: 'epaxial_muscles', label: 'Epaxial Muscles', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/back.webp'),
          Category(id: 'hypaxial_muscles', label: 'Hypaxial Muscles', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/back.webp'),
          Category(id: 'intermediate_layer_force_transmission', label: 'Intermediate Layer Force Transmission', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/back.webp'),
          Category(id: 'superficial_layer_movement_power', label: 'Superficial Layer Movement Power', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/back.webp'),
        ],
      ),
      // Cutaneous (single file)
      Category(
        id: 'cutaneous',
        label: 'Cutaneous',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/stay_apparatus.webp',
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/forelimb.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
          Category(id: 'deltoid_group', label: 'Deltoid Group', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
          Category(id: 'pronator_muscles', label: 'Pronator Muscles', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
          Category(id: 'supinator_muscle', label: 'Supinator Muscle', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/forelimb.webp'),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/horse/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
          Category(id: 'laryngeal', label: 'Laryngeal', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
          Category(id: 'pharyngeal', label: 'Pharyngeal', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
          Category(id: 'throat', label: 'Throat', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
          Category(id: 'tongue', label: 'Tongue', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/head_neck.webp'),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/hindlimb.webp'),
          Category(id: 'gluteal', label: 'Gluteal', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/hindlimb.webp'),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/hindlimb.webp'),
          Category(id: 'medial_thigh', label: 'Medial Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/hindlimb.webp'),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/hindlimb.webp'),
          Category(id: 'popliteus', label: 'Popliteus', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/hindlimb.webp'),
        ],
      ),
      // Pectoral
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/pectoral.webp',
        subcategories: [
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/pectoral.webp'),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/pectoral.webp'),
        ],
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'anal_sphincters', label: 'Anal Sphincters', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/pelvic.webp'),
          Category(id: 'anus', label: 'Anus', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/pelvic.webp'),
          Category(id: 'perineal', label: 'Perineal', icon: Icons.fitness_center, imagePath: 'assets/images/horse/muscles/pelvic.webp'),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/horse/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            imagePath: 'assets/images/horse/muscles/respiration.webp',
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            imagePath: 'assets/images/horse/muscles/respiration.webp',
            subcategories: [
              Category(id: 'diaphragm', label: 'Diaphragm', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air, imagePath: 'assets/images/horse/muscles/respiration.webp'),
            ],
          ),
        ],
      ),
      // Stay Apparatus (single file)
      Category(
        id: 'stay_apparatus',
        label: 'Stay Apparatus',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/horse/muscles/stay_apparatus.webp',
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/horse/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets, imagePath: 'assets/images/horse/muscles/tail.webp'),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets, imagePath: 'assets/images/horse/muscles/tail.webp'),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets, imagePath: 'assets/images/horse/muscles/tail.webp'),
        ],
      ),
    ];
  }

  // Dog muscles categories based on actual folder structure
  static List<Category> _getDogMusclesCategories() {
    return [
      // Abdominal
      Category(
        id: 'abdominal',
        label: 'Abdominal',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/dog/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/abdominal.webp'),
          Category(id: 'deep_layer', label: 'Deep Layer', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/abdominal.webp'),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/abdominal.webp'),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/abdominal.webp'),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/abdominal.webp'),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/dog/muscles/back.webp',
        subcategories: [
          Category(id: 'deep_layer_core_stability', label: 'Deep Layer Core Stability', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/back.webp'),
          Category(id: 'epaxial_muscles', label: 'Epaxial Muscles', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/back.webp'),
          Category(id: 'hypaxial_muscles', label: 'Hypaxial Muscles', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/back.webp'),
          Category(id: 'intermediate_layer_force_transmission', label: 'Intermediate Layer Force Transmission', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/back.webp'),
          Category(id: 'superficial_layer_movement_power', label: 'Superficial Layer Movement Power', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/back.webp'),
        ],
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/dog/muscles/forelimb.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'deltoid_group', label: 'Deltoid Group', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'pronator_muscles', label: 'Pronator Muscles', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'supinator_muscle', label: 'Supinator Muscle', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
          Category(id: 'trapezius', label: 'Trapezius', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/forelimb.webp'),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/dog/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
          Category(id: 'laryngeal', label: 'Laryngeal', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
          Category(id: 'pharyngeal', label: 'Pharyngeal', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
          Category(id: 'throat', label: 'Throat', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
          Category(id: 'tongue', label: 'Tongue', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/head_neck.webp'),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/dog/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/hindlimb.webp'),
          Category(id: 'gluteal', label: 'Gluteal', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/hindlimb.webp'),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/hindlimb.webp'),
          Category(id: 'medial_thigh', label: 'Medial Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/hindlimb.webp'),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/hindlimb.webp'),
          Category(id: 'popliteus', label: 'Popliteus', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/hindlimb.webp'),
        ],
      ),
      // Pectoral
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/dog/muscles/pectoral.webp',
        subcategories: [
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/pectoral.webp'),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/pectoral.webp'),
        ],
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/dog/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'anal_sphincters', label: 'Anal Sphincters', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/pelvic.webp'),
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/pelvic.webp'),
          Category(id: 'perineal', label: 'Perineal', icon: Icons.fitness_center, imagePath: 'assets/images/dog/muscles/pelvic.webp'),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/dog/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            imagePath: 'assets/images/dog/muscles/respiration.webp',
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            imagePath: 'assets/images/dog/muscles/respiration.webp',
            subcategories: [
              Category(id: 'diaphragm', label: 'Diaphragm', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air, imagePath: 'assets/images/dog/muscles/respiration.webp'),
            ],
          ),
        ],
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/dog/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets, imagePath: 'assets/images/dog/muscles/tail.webp'),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets, imagePath: 'assets/images/dog/muscles/tail.webp'),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets, imagePath: 'assets/images/dog/muscles/tail.webp'),
        ],
      ),
    ];
  }

  // Cat muscles categories based on actual folder structure
  static List<Category> _getCatMusclesCategories() {
    return [
      // Abdominal
      Category(
        id: 'abdominal',
        label: 'Abdominal',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/cat/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/abdominal.webp'),
          Category(id: 'deep_layer', label: 'Deep Layer', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/abdominal.webp'),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/abdominal.webp'),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/abdominal.webp'),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/abdominal.webp'),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/cat/muscles/back.webp',
        subcategories: [
          Category(id: 'deep_layer_core_stability', label: 'Deep Layer Core Stability', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/back.webp'),
          Category(id: 'epaxial', label: 'Epaxial', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/back.webp'),
          Category(id: 'hypaxial', label: 'Hypaxial', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/back.webp'),
          Category(id: 'intermediate_layer_force_transmission', label: 'Intermediate Layer Force Transmission', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/back.webp'),
          Category(id: 'superficial_layer_movement_power', label: 'Superficial Layer Movement Power', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/back.webp'),
        ],
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/cat/muscles/forelimb.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'deltoid', label: 'Deltoid', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'pronator', label: 'Pronator', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'supinator', label: 'Supinator', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
          Category(id: 'trapezius', label: 'Trapezius', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/forelimb.webp'),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/cat/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
          Category(id: 'laryngeal', label: 'Laryngeal', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
          Category(id: 'pharyngeal', label: 'Pharyngeal', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
          Category(id: 'throat', label: 'Throat', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
          Category(id: 'tongue', label: 'Tongue', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/head_neck.webp'),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/cat/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/hindlimb.webp'),
          Category(id: 'gluteal_region', label: 'Gluteal Region', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/hindlimb.webp'),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/hindlimb.webp'),
          Category(id: 'medial_thigh', label: 'Medial Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/hindlimb.webp'),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/hindlimb.webp'),
          Category(id: 'popliteus', label: 'Popliteus', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/hindlimb.webp'),
        ],
      ),
      // Pectoral
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/cat/muscles/pectoral.webp',
        subcategories: [
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/pectoral.webp'),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/pectoral.webp'),
        ],
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/cat/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'anal_sphincters', label: 'Anal Sphincters', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/pelvic.webp'),
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/pelvic.webp'),
          Category(id: 'perineal', label: 'Perineal', icon: Icons.fitness_center, imagePath: 'assets/images/cat/muscles/pelvic.webp'),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/cat/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            imagePath: 'assets/images/cat/muscles/respiration.webp',
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            imagePath: 'assets/images/cat/muscles/respiration.webp',
            subcategories: [
              Category(id: 'diaphragm', label: 'Diaphragm', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air, imagePath: 'assets/images/cat/muscles/respiration.webp'),
            ],
          ),
        ],
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/cat/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets, imagePath: 'assets/images/cat/muscles/tail.webp'),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets, imagePath: 'assets/images/cat/muscles/tail.webp'),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets, imagePath: 'assets/images/cat/muscles/tail.webp'),
        ],
      ),
    ];
  }

  // Bird muscles categories based on actual folder structure
  static List<Category> _getBirdMusclesCategories() {
    return [
      // Abdominal
      Category(
        id: 'abdominal',
        label: 'Abdominal',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/bird/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/abdominal.webp'),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/abdominal.webp'),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/abdominal.webp'),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/abdominal.webp'),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/bird/muscles/back.webp',
        subcategories: [
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
          Category(id: 'intermediate', label: 'Intermediate', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
          Category(
            id: 'spine',
            label: 'Spine',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/bird/muscles/back.webp',
            subcategories: [
              Category(id: 'intertransversarii', label: 'Intertransversarii', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
              Category(id: 'longissimus_dorsi', label: 'Longissimus Dorsi', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
              Category(id: 'multifidus', label: 'Multifidus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
              Category(id: 'spinalis', label: 'Spinalis', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
            ],
          ),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/back.webp'),
        ],
      ),
      // Flight
      Category(
        id: 'flight',
        label: 'Flight',
        icon: Icons.flight,
        imagePath: 'assets/images/bird/muscles/flight.webp',
        subcategories: [
          Category(id: 'primary_feather_depressors', label: 'Primary Feather Depressors', icon: Icons.flight, imagePath: 'assets/images/bird/muscles/flight.webp'),
          Category(id: 'primary_feather_erectors', label: 'Primary Feather Erectors', icon: Icons.flight, imagePath: 'assets/images/bird/muscles/flight.webp'),
          Category(id: 'propatagialis_brevis', label: 'Propatagialis Brevis', icon: Icons.flight, imagePath: 'assets/images/bird/muscles/flight.webp'),
          Category(id: 'propatagialis_longus', label: 'Propatagialis Longus', icon: Icons.flight, imagePath: 'assets/images/bird/muscles/flight.webp'),
          Category(id: 'tensor_propatagialis', label: 'Tensor Propatagialis', icon: Icons.flight, imagePath: 'assets/images/bird/muscles/flight.webp'),
          Category(id: 'ulnaris_propatagialis', label: 'Ulnaris Propatagialis', icon: Icons.flight, imagePath: 'assets/images/bird/muscles/flight.webp'),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/bird/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
          Category(
            id: 'throat',
            label: 'Throat',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/bird/muscles/head_neck.webp',
            subcategories: [
              Category(id: 'branchiomandibularis', label: 'Branchiomandibularis', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
              Category(id: 'genioglossus', label: 'Genioglossus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
              Category(id: 'hyoglossus', label: 'Hyoglossus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
              Category(id: 'serpihyoideus', label: 'Serpihyoideus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
              Category(id: 'sternohyoideus', label: 'Sternohyoideus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
              Category(id: 'sternotrachealis', label: 'Sternotrachealis', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
              Category(id: 'stylohyoideus', label: 'Stylohyoideus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/head_neck.webp'),
            ],
          ),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/bird/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/hindlimb.webp'),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/hindlimb.webp'),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/hindlimb.webp'),
        ],
      ),
      // Pectoral (single file)
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/bird/muscles/flight.webp',
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/bird/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'iliacus', label: 'Iliacus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/pelvic.webp'),
          Category(id: 'illiotrochantericus', label: 'Illiotrochantericus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/pelvic.webp'),
          Category(id: 'ischiotrochantericus', label: 'Ischiotrochantericus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/pelvic.webp'),
          Category(id: 'obturator', label: 'Obturator', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/pelvic.webp'),
          Category(id: 'psoas', label: 'Psoas', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles.webp'),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/bird/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            imagePath: 'assets/images/bird/muscles/respiration.webp',
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            imagePath: 'assets/images/bird/muscles/respiration.webp',
            subcategories: [
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
              Category(id: 'sternal_pump_air_sac_ventilation', label: 'Sternal Pump Air Sac Ventilation', icon: Icons.air, imagePath: 'assets/images/bird/muscles/respiration.webp'),
            ],
          ),
        ],
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/bird/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets, imagePath: 'assets/images/bird/muscles/tail.webp'),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets, imagePath: 'assets/images/bird/muscles/tail.webp'),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets, imagePath: 'assets/images/bird/muscles/tail.webp'),
        ],
      ),
      // Voice
      Category(
        id: 'voice',
        label: 'Voice',
        icon: Icons.record_voice_over,
        imagePath: 'assets/images/bird/muscles/voice.webp',
        subcategories: [
          Category(id: 'dorsal_syringeal', label: 'Dorsal Syringeal', icon: Icons.record_voice_over, imagePath: 'assets/images/bird/muscles/voice.webp'),
          Category(id: 'lateral_syringeal', label: 'Lateral Syringeal', icon: Icons.record_voice_over, imagePath: 'assets/images/bird/muscles/voice.webp'),
          Category(id: 'tracheobronchialis', label: 'Tracheobronchialis', icon: Icons.record_voice_over, imagePath: 'assets/images/bird/muscles/voice.webp'),
          Category(id: 'tracheolateralis', label: 'Tracheolateralis', icon: Icons.record_voice_over, imagePath: 'assets/images/bird/muscles/voice.webp'),
          Category(id: 'ventral_syringeal', label: 'Ventral Syringeal', icon: Icons.record_voice_over, imagePath: 'assets/images/bird/muscles/voice.webp'),
        ],
      ),
      // Wing
      Category(
        id: 'wing',
        label: 'Wing',
        icon: Icons.record_voice_over,
        imagePath: 'assets/images/bird/muscles/wing.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'latissimus_dorsi', label: 'Latissimus Dorsi', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'levator_scapulae', label: 'Levator Scapulae', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'rhomboideus', label: 'Rhomboideus', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'serratus_ventralis', label: 'Serratus Ventralis', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center, imagePath: 'assets/images/bird/muscles/wing.webp'),
        ],
      ),
    ];
  }

  // Default muscles categories for unknown animals
  static List<Category> _getDefaultMusclesCategories(String animalId) {
    return [];
  }
}

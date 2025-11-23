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
        imagePath: 'assets/images/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center),
          Category(id: 'deep_layer', label: 'Deep Layer', icon: Icons.fitness_center),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/back.webp',
        subcategories: [
          Category(id: 'deep_layer_core_stability', label: 'Deep Layer Core Stability', icon: Icons.fitness_center),
          Category(id: 'epaxial_muscles', label: 'Epaxial Muscles', icon: Icons.fitness_center),
          Category(id: 'hypaxial_muscles', label: 'Hypaxial Muscles', icon: Icons.fitness_center),
          Category(id: 'intermediate_layer_force_transmission', label: 'Intermediate Layer Force Transmission', icon: Icons.fitness_center),
          Category(id: 'superficial_layer_movement_power', label: 'Superficial Layer Movement Power', icon: Icons.fitness_center),
        ],
      ),
      // Cutaneous (single file)
      Category(
        id: 'cutaneous',
        label: 'Cutaneous',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/cutaneous.webp',
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/forelimb.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center),
          Category(id: 'deltoid_group', label: 'Deltoid Group', icon: Icons.fitness_center),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center),
          Category(id: 'pronator_muscles', label: 'Pronator Muscles', icon: Icons.fitness_center),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center),
          Category(id: 'supinator_muscle', label: 'Supinator Muscle', icon: Icons.fitness_center),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center),
          Category(id: 'laryngeal', label: 'Laryngeal', icon: Icons.fitness_center),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center),
          Category(id: 'pharyngeal', label: 'Pharyngeal', icon: Icons.fitness_center),
          Category(id: 'throat', label: 'Throat', icon: Icons.fitness_center),
          Category(id: 'tongue', label: 'Tongue', icon: Icons.fitness_center),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center),
          Category(id: 'gluteal', label: 'Gluteal', icon: Icons.fitness_center),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center),
          Category(id: 'medial_thigh', label: 'Medial Thigh', icon: Icons.fitness_center),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center),
          Category(id: 'popliteus', label: 'Popliteus', icon: Icons.fitness_center),
        ],
      ),
      // Pectoral
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pectoral.webp',
        subcategories: [
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center),
        ],
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'anal_sphincters', label: 'Anal Sphincters', icon: Icons.fitness_center),
          Category(id: 'anus', label: 'Anus', icon: Icons.fitness_center),
          Category(id: 'perineal', label: 'Perineal', icon: Icons.fitness_center),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'diaphragm', label: 'Diaphragm', icon: Icons.air),
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Stay Apparatus (single file)
      Category(
        id: 'stay_apparatus',
        label: 'Stay Apparatus',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/stay_apparatus.webp',
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets),
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
        imagePath: 'assets/images/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center),
          Category(id: 'deep_layer', label: 'Deep Layer', icon: Icons.fitness_center),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/back.webp',
        subcategories: [
          Category(id: 'deep_layer_core_stability', label: 'Deep Layer Core Stability', icon: Icons.fitness_center),
          Category(id: 'epaxial_muscles', label: 'Epaxial Muscles', icon: Icons.fitness_center),
          Category(id: 'hypaxial_muscles', label: 'Hypaxial Muscles', icon: Icons.fitness_center),
          Category(id: 'intermediate_layer_force_transmission', label: 'Intermediate Layer Force Transmission', icon: Icons.fitness_center),
          Category(id: 'superficial_layer_movement_power', label: 'Superficial Layer Movement Power', icon: Icons.fitness_center),
        ],
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/forelimb.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center),
          Category(id: 'deltoid_group', label: 'Deltoid Group', icon: Icons.fitness_center),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center),
          Category(id: 'pronator_muscles', label: 'Pronator Muscles', icon: Icons.fitness_center),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center),
          Category(id: 'supinator_muscle', label: 'Supinator Muscle', icon: Icons.fitness_center),
          Category(id: 'trapezius', label: 'Trapezius', icon: Icons.fitness_center),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center),
          Category(id: 'laryngeal', label: 'Laryngeal', icon: Icons.fitness_center),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center),
          Category(id: 'pharyngeal', label: 'Pharyngeal', icon: Icons.fitness_center),
          Category(id: 'throat', label: 'Throat', icon: Icons.fitness_center),
          Category(id: 'tongue', label: 'Tongue', icon: Icons.fitness_center),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center),
          Category(id: 'gluteal', label: 'Gluteal', icon: Icons.fitness_center),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center),
          Category(id: 'medial_thigh', label: 'Medial Thigh', icon: Icons.fitness_center),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center),
          Category(id: 'popliteus', label: 'Popliteus', icon: Icons.fitness_center),
        ],
      ),
      // Pectoral
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pectoral.webp',
        subcategories: [
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center),
        ],
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'anal_sphincters', label: 'Anal Sphincters', icon: Icons.fitness_center),
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.fitness_center),
          Category(id: 'perineal', label: 'Perineal', icon: Icons.fitness_center),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'diaphragm', label: 'Diaphragm', icon: Icons.air),
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets),
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
        imagePath: 'assets/images/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center),
          Category(id: 'deep_layer', label: 'Deep Layer', icon: Icons.fitness_center),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/back.webp',
        subcategories: [
          Category(id: 'deep_layer_core_stability', label: 'Deep Layer Core Stability', icon: Icons.fitness_center),
          Category(id: 'epaxial', label: 'Epaxial', icon: Icons.fitness_center),
          Category(id: 'hypaxial', label: 'Hypaxial', icon: Icons.fitness_center),
          Category(id: 'intermediate_layer_force_transmission', label: 'Intermediate Layer Force Transmission', icon: Icons.fitness_center),
          Category(id: 'superficial_layer_movement_power', label: 'Superficial Layer Movement Power', icon: Icons.fitness_center),
        ],
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/forelimb.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center),
          Category(id: 'deltoid', label: 'Deltoid', icon: Icons.fitness_center),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center),
          Category(id: 'pronator', label: 'Pronator', icon: Icons.fitness_center),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center),
          Category(id: 'supinator', label: 'Supinator', icon: Icons.fitness_center),
          Category(id: 'trapezius', label: 'Trapezius', icon: Icons.fitness_center),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center),
          Category(id: 'laryngeal', label: 'Laryngeal', icon: Icons.fitness_center),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center),
          Category(id: 'pharyngeal', label: 'Pharyngeal', icon: Icons.fitness_center),
          Category(id: 'throat', label: 'Throat', icon: Icons.fitness_center),
          Category(id: 'tongue', label: 'Tongue', icon: Icons.fitness_center),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center),
          Category(id: 'gluteal_region', label: 'Gluteal Region', icon: Icons.fitness_center),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center),
          Category(id: 'medial_thigh', label: 'Medial Thigh', icon: Icons.fitness_center),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center),
          Category(id: 'popliteus', label: 'Popliteus', icon: Icons.fitness_center),
        ],
      ),
      // Pectoral
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pectoral.webp',
        subcategories: [
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center),
        ],
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'anal_sphincters', label: 'Anal Sphincters', icon: Icons.fitness_center),
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.fitness_center),
          Category(id: 'perineal', label: 'Perineal', icon: Icons.fitness_center),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'diaphragm', label: 'Diaphragm', icon: Icons.air),
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets),
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
        imagePath: 'assets/images/muscles/abdominal.webp',
        subcategories: [
          Category(id: 'central', label: 'Central', icon: Icons.fitness_center),
          Category(id: 'middle_layer', label: 'Middle Layer', icon: Icons.fitness_center),
          Category(id: 'superficial_layer', label: 'Superficial Layer', icon: Icons.fitness_center),
          Category(id: 'ventral', label: 'Ventral', icon: Icons.fitness_center),
        ],
      ),
      // Back
      Category(
        id: 'back',
        label: 'Back',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/back.webp',
        subcategories: [
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.fitness_center),
          Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center),
          Category(id: 'intermediate', label: 'Intermediate', icon: Icons.fitness_center),
          Category(
            id: 'spine',
            label: 'Spine',
            icon: Icons.fitness_center,
            subcategories: [
              Category(id: 'intertransversarii', label: 'Intertransversarii', icon: Icons.fitness_center),
              Category(id: 'longissimus_dorsi', label: 'Longissimus Dorsi', icon: Icons.fitness_center),
              Category(id: 'multifidus', label: 'Multifidus', icon: Icons.fitness_center),
              Category(id: 'spinalis', label: 'Spinalis', icon: Icons.fitness_center),
            ],
          ),
          Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center),
        ],
      ),
      // Flight
      Category(
        id: 'flight',
        label: 'Flight',
        icon: Icons.flight,
        imagePath: 'assets/images/muscles/flight.webp',
        subcategories: [
          Category(id: 'primary_feather_depressors', label: 'Primary Feather Depressors', icon: Icons.flight),
          Category(id: 'primary_feather_erectors', label: 'Primary Feather Erectors', icon: Icons.flight),
          Category(id: 'propatagialis_brevis', label: 'Propatagialis Brevis', icon: Icons.flight),
          Category(id: 'propatagialis_longus', label: 'Propatagialis Longus', icon: Icons.flight),
          Category(id: 'tensor_propatagialis', label: 'Tensor Propatagialis', icon: Icons.flight),
          Category(id: 'ulnaris_propatagialis', label: 'Ulnaris Propatagialis', icon: Icons.flight),
        ],
      ),
      // Head & Neck
      Category(
        id: 'head_neck',
        label: 'Head & Neck',
        icon: Icons.face,
        imagePath: 'assets/images/muscles/head_neck.webp',
        subcategories: [
          Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center),
          Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center),
          Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center),
          Category(
            id: 'throat',
            label: 'Throat',
            icon: Icons.fitness_center,
            subcategories: [
              Category(id: 'branchiomandibularis', label: 'Branchiomandibularis', icon: Icons.fitness_center),
              Category(id: 'genioglossus', label: 'Genioglossus', icon: Icons.fitness_center),
              Category(id: 'hyoglossus', label: 'Hyoglossus', icon: Icons.fitness_center),
              Category(id: 'serpihyoideus', label: 'Serpihyoideus', icon: Icons.fitness_center),
              Category(id: 'sternohyoideus', label: 'Sternohyoideus', icon: Icons.fitness_center),
              Category(id: 'sternotrachealis', label: 'Sternotrachealis', icon: Icons.fitness_center),
              Category(id: 'stylohyoideus', label: 'Stylohyoideus', icon: Icons.fitness_center),
            ],
          ),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/hindlimb.webp',
        subcategories: [
          Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center),
          Category(id: 'hip_thigh', label: 'Hip Thigh', icon: Icons.fitness_center),
          Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center),
        ],
      ),
      // Pectoral (single file)
      Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pectoral.webp',
      ),
      // Pelvic
      Category(
        id: 'pelvic',
        label: 'Pelvic',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pelvic.webp',
        subcategories: [
          Category(id: 'iliacus', label: 'Iliacus', icon: Icons.fitness_center),
          Category(id: 'illiotrochantericus', label: 'Illiotrochantericus', icon: Icons.fitness_center),
          Category(id: 'ischiotrochantericus', label: 'Ischiotrochantericus', icon: Icons.fitness_center),
          Category(id: 'obturator', label: 'Obturator', icon: Icons.fitness_center),
          Category(id: 'psoas', label: 'Psoas', icon: Icons.fitness_center),
        ],
      ),
      // Respiration
      Category(
        id: 'respiration',
        label: 'Respiration',
        icon: Icons.air,
        imagePath: 'assets/images/muscles/respiration.webp',
        subcategories: [
          Category(
            id: 'expiratory',
            label: 'Expiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'abdominal_muscles_respiration', label: 'Abdominal Muscles Respiration', icon: Icons.air),
              Category(id: 'internal_intercostal', label: 'Internal Intercostal', icon: Icons.air),
              Category(id: 'serratus_dorsalis_caudalis', label: 'Serratus Dorsalis Caudalis', icon: Icons.air),
              Category(id: 'transversus_thoracis', label: 'Transversus Thoracis', icon: Icons.air),
            ],
          ),
          Category(
            id: 'inspiratory',
            label: 'Inspiratory',
            icon: Icons.air,
            subcategories: [
              Category(id: 'external_intercostal', label: 'External Intercostal', icon: Icons.air),
              Category(id: 'rectus_thoracis', label: 'Rectus Thoracis', icon: Icons.air),
              Category(id: 'scalenus', label: 'Scalenus', icon: Icons.air),
              Category(id: 'serratus_dorsalis_cranialis', label: 'Serratus Dorsalis Cranialis', icon: Icons.air),
              Category(id: 'sternal_pump_air_sac_ventilation', label: 'Sternal Pump Air Sac Ventilation', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Tail
      Category(
        id: 'tail',
        label: 'Tail',
        icon: Icons.pets,
        imagePath: 'assets/images/muscles/tail.webp',
        subcategories: [
          Category(id: 'deep_muscles', label: 'Deep Muscles', icon: Icons.pets),
          Category(id: 'surface_muscles', label: 'Surface Muscles', icon: Icons.pets),
          Category(id: 'tail_muscles', label: 'Tail Muscles', icon: Icons.pets),
        ],
      ),
      // Voice
      Category(
        id: 'voice',
        label: 'Voice',
        icon: Icons.record_voice_over,
        imagePath: 'assets/images/muscles/voice.webp',
        subcategories: [
          Category(id: 'dorsal_syringeal', label: 'Dorsal Syringeal', icon: Icons.record_voice_over),
          Category(id: 'lateral_syringeal', label: 'Lateral Syringeal', icon: Icons.record_voice_over),
          Category(id: 'tracheobronchialis', label: 'Tracheobronchialis', icon: Icons.record_voice_over),
          Category(id: 'tracheolateralis', label: 'Tracheolateralis', icon: Icons.record_voice_over),
          Category(id: 'ventral_syringeal', label: 'Ventral Syringeal', icon: Icons.record_voice_over),
        ],
      ),
      // Wing
      Category(
        id: 'wing',
        label: 'Wing',
        icon: Icons.record_voice_over,
        imagePath: 'assets/images/muscles/wing.webp',
        subcategories: [
          Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center),
          Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center),
          Category(id: 'latissimus_dorsi', label: 'Latissimus Dorsi', icon: Icons.fitness_center),
          Category(id: 'levator_scapulae', label: 'Levator Scapulae', icon: Icons.fitness_center),
          Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center),
          Category(id: 'rhomboideus', label: 'Rhomboideus', icon: Icons.fitness_center),
          Category(id: 'serratus_ventralis', label: 'Serratus Ventralis', icon: Icons.fitness_center),
          Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center),
        ],
      ),
    ];
  }

  // Default muscles categories for unknown animals
  static List<Category> _getDefaultMusclesCategories(String animalId) {
    return [];
  }
}

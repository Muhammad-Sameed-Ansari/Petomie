import 'package:flutter/material.dart';

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
  // Helper function to generate energy categories for a specific animal
  static List<Category> getEnergyCategoriesForAnimal(String animalId) {
    // Define chakra subcategories for Horse, Dog, and Cat
    List<Category> chakraSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      chakraSubcategories = [
        Category(id: 'root_chakra', label: 'Root Chakra', icon: Icons.circle),
        Category(id: 'sacral_chakra', label: 'Sacral Chakra', icon: Icons.circle),
        Category(id: 'solar_plexus_chakra', label: 'Solar Plexus Chakra', icon: Icons.circle),
        Category(id: 'heart_chakra', label: 'Heart Chakra', icon: Icons.circle),
        Category(id: 'throat_chakra', label: 'Throat Chakra', icon: Icons.circle),
        Category(id: 'third_eye_chakra', label: 'Third Eye Chakra', icon: Icons.circle),
        Category(id: 'crown_chakra', label: 'Crown Chakra', icon: Icons.circle),
        Category(id: 'brachial_shoulder_chakra', label: 'Brachial/Shoulder Chakra', icon: Icons.circle),
        Category(id: 'paw_chakra', label: 'Paw Chakra', icon: Icons.circle),
        Category(id: 'whisker_vibrissae_tail_ear_chakras', label: 'Whisker/Vibrissae, Tail, Ear Chakras', icon: Icons.circle),
      ];
    }

    // Define aura & energy field subcategories for Horse, Dog, and Cat
    List<Category> auraEnergyFieldSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      auraEnergyFieldSubcategories = [
        Category(id: 'aura_layers', label: 'Aura Layers (etheric, emotional, mental, spiritual)', icon: Icons.layers),
        Category(id: 'field_strength_weakness', label: 'Field Strength / Weakness', icon: Icons.flash_on),
        Category(id: 'protection_permeability', label: 'Protection & Permeability', icon: Icons.shield),
      ];
    }

    // Define meridians subcategories for Horse, Dog, and Cat
    List<Category> meridiansSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      meridiansSubcategories = [
        Category(
          id: 'paired_meridians', 
          label: 'Paired Meridians', 
          icon: Icons.call_split,
          subcategories: [
            Category(id: 'lung_meridian', label: 'Lung (LU)', icon: Icons.air),
            Category(id: 'large_intestine_meridian', label: 'Large Intestine (LI)', icon: Icons.restaurant),
            Category(id: 'stomach_meridian', label: 'Stomach (ST)', icon: Icons.restaurant),
            Category(id: 'spleen_meridian', label: 'Spleen (SP)', icon: Icons.scatter_plot),
            Category(id: 'heart_meridian', label: 'Heart (HT)', icon: Icons.favorite),
            Category(id: 'small_intestine_meridian', label: 'Small Intestine (SI)', icon: Icons.restaurant),
            Category(id: 'bladder_meridian', label: 'Bladder (BL)', icon: Icons.water_drop),
            Category(id: 'kidney_meridian', label: 'Kidney (KI)', icon: Icons.water_drop),
            Category(id: 'pericardium_meridian', label: 'Pericardium (PC)', icon: Icons.favorite_border),
            Category(id: 'triple_heater_meridian', label: 'Triple Heater / Triple Burner (TH / TB / SJ)', icon: Icons.whatshot),
            Category(id: 'gall_bladder_meridian', label: 'Gall Bladder (GB)', icon: Icons.local_hospital),
            Category(id: 'liver_meridian', label: 'Liver (LV)', icon: Icons.local_hospital),
          ],
        ),
        Category(
          id: 'unpaired_meridians', 
          label: 'Unpaired Meridians', 
          icon: Icons.linear_scale,
          subcategories: [
            Category(id: 'governing_vessel', label: 'Governing Vessel', icon: Icons.vertical_split),
            Category(id: 'conception_vessel', label: 'Conception Vessel', icon: Icons.horizontal_split),
          ],
        ),
        Category(
          id: 'energy_balance_in_body',
          label: 'Energy Balance in the Body',
          icon: Icons.balance,
          subcategories: [
            Category(id: 'yin_yang_balance', label: 'Yin–Yang Balance', icon: Icons.yard),
          ],
        ),
      ];
    }

    // Define life force / vital energy subcategories for Horse, Dog, and Cat
    List<Category> lifeForceSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      lifeForceSubcategories = [
        Category(id: 'general_energy_level', label: 'General Energy Level', icon: Icons.battery_full),
        Category(id: 'flow_vs_stagnation', label: 'Flow vs. Stagnation', icon: Icons.waves),
        Category(id: 'overload_vs_depletion', label: 'Overload vs. Depletion', icon: Icons.scale),
      ];
    }

    // Define energy imbalances subcategories for Horse, Dog, and Cat
    List<Category> energyImbalancesSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      energyImbalancesSubcategories = [
        Category(id: 'stress_overwhelm', label: 'Stress & Overwhelm', icon: Icons.warning),
        Category(id: 'energy_leaks', label: 'Energy Leaks', icon: Icons.leak_remove),
        Category(
          id: 'environmental_impacts', 
          label: 'Environmental Impacts', 
          icon: Icons.eco,
          subcategories: [
            Category(id: 'electromagnetic_fields_emfs_technology', label: 'Electromagnetic Fields (EMFs) & Technology', icon: Icons.wifi),
            Category(id: 'chemicals_toxins', label: 'Chemicals & Toxins', icon: Icons.science),
            Category(id: 'noise_vibrations', label: 'Noise & Vibrations', icon: Icons.volume_up),
            Category(id: 'human_emotional_energy', label: 'Human Emotional Energy', icon: Icons.sentiment_very_dissatisfied),
            Category(id: 'weather_natural_forces', label: 'Weather & Natural Forces', icon: Icons.cloud),
            Category(id: 'housing_surroundings', label: 'Housing & Surroundings', icon: Icons.home),
            Category(id: 'diet_water_quality_external_input', label: 'Diet & Water Quality (external input)', icon: Icons.restaurant_menu),
          ],
        ),
      ];
    }

    // Define energy connections subcategories for Horse, Dog, and Cat
    List<Category> energyConnectionsSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      energyConnectionsSubcategories = [
        Category(id: 'cord_with_humans', label: 'Cord with Humans', icon: Icons.people),
        Category(id: 'cord_with_other_animals', label: 'Cord with Other Animals', icon: Icons.pets),
        Category(id: 'connection_to_nature_earth', label: 'Connection to Nature/Earth', icon: Icons.terrain),
        Category(id: 'spiritual_connection', label: 'Spiritual Connection', icon: Icons.spa),
      ];
    }

    // Define sacred geometry & vibrational patterns subcategories for Horse, Dog, and Cat
    List<Category> sacredGeometrySubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      sacredGeometrySubcategories = [
        Category(id: 'flower_of_life', label: 'Flower of Life (unity, interconnectedness)', icon: Icons.blur_on),
        Category(id: 'seed_of_life', label: 'Seed of Life (beginnings, regeneration)', icon: Icons.grain),
        Category(id: 'metatrons_cube', label: 'Metatron\'s Cube (structure, balance)', icon: Icons.hexagon),
        Category(id: 'spiral', label: 'Spiral (growth, evolution, healing flow)', icon: Icons.rotate_right),
      ];
    }

    // Define states of harmony subcategories for Horse, Dog, and Cat
    List<Category> statesOfHarmonySubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      statesOfHarmonySubcategories = [
        Category(id: 'balance_homeostasis', label: 'Balance (homeostasis)', icon: Icons.balance),
        Category(id: 'disharmony_chaotic_field', label: 'Disharmony (chaotic field)', icon: Icons.warning_amber),
      ];
    }

    // Define energetic influences subcategories for Horse, Dog, and Cat
    List<Category> energeticInfluencesSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      energeticInfluencesSubcategories = [
        Category(id: 'karmic_patterns', label: 'Karmic Patterns', icon: Icons.replay_circle_filled),
        Category(id: 'contracts_vows', label: 'Contracts & Vows', icon: Icons.description),
        Category(id: 'portals_environmental_energy_gateways', label: 'Portals & Environmental Energy Gateways', icon: Icons.meeting_room),
        Category(id: 'energy_parasites_attachments', label: 'Energy Parasites / Attachments', icon: Icons.bug_report),
        Category(id: 'unresolved_trauma_imprints', label: 'Unresolved Trauma Imprints', icon: Icons.psychology),
        Category(id: 'entities_spirit_attachments', label: 'Entities & Spirit Attachments', icon: Icons.visibility_off),
      ];
    }

    // Define negative beliefs subcategories for Horse, Dog, and Cat
    List<Category> negativeBeliefsSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      negativeBeliefsSubcategories = [
        Category(id: 'safety_survival_beliefs', label: 'Safety & Survival Beliefs', icon: Icons.security),
        Category(id: 'trust_relationship_beliefs', label: 'Trust & Relationship Beliefs', icon: Icons.handshake),
        Category(id: 'performance_expectation_beliefs', label: 'Performance & Expectation Beliefs', icon: Icons.star),
        Category(id: 'self_worth_beliefs', label: 'Self-Worth Beliefs', icon: Icons.self_improvement),
        Category(id: 'physical_body_beliefs', label: 'Physical & Body Beliefs', icon: Icons.accessibility),
        Category(id: 'freedom_autonomy_beliefs', label: 'Freedom & Autonomy Beliefs', icon: Icons.flight),
      ];
    }

    // Define unresolved emotions subcategories for Horse, Dog, and Cat
    List<Category> unresolvedEmotionsSubcategories = [];
    if (['horse', 'dog', 'cat'].contains(animalId.toLowerCase())) {
      unresolvedEmotionsSubcategories = [
        Category(id: 'fear_anxiety', label: 'Fear / Anxiety', icon: Icons.warning),
        Category(id: 'sadness_grief', label: 'Sadness / Grief', icon: Icons.sentiment_very_dissatisfied),
        Category(id: 'anger_frustration', label: 'Anger / Frustration', icon: Icons.sentiment_very_dissatisfied),
        Category(id: 'shame_guilt', label: 'Shame / Guilt', icon: Icons.sentiment_dissatisfied),
        Category(id: 'stress_pressure', label: 'Stress / Pressure', icon: Icons.warning_amber),
        Category(id: 'relationship_wounds', label: 'Relationship Wounds', icon: Icons.heart_broken),
        Category(id: 'self_image_identity', label: 'Self-Image / Identity', icon: Icons.person),
        Category(id: 'spiritual_existential', label: 'Spiritual / Existential', icon: Icons.spa),
      ];
    }

    return [
      Category(
        id: 'main_category',
        label: 'Main Category',
        icon: Icons.category,
      ),
      Category(
        id: 'chakras',
        label: 'Chakras',
        icon: Icons.brightness_7,
        subcategories: chakraSubcategories,
      ),
      Category(
        id: 'aura_energy_field',
        label: 'Aura & Energy Field',
        icon: Icons.blur_circular,
        imagePath: 'assets/images/$animalId/Energy/aura_&_energy_field.png',
        subcategories: auraEnergyFieldSubcategories,
      ),
      Category(
        id: 'meridians',
        label: 'Meridians',
        icon: Icons.linear_scale,
        imagePath: 'assets/images/$animalId/Energy/meridians.png',
        subcategories: meridiansSubcategories,
      ),
      Category(
        id: 'life_force_vital_energy',
        label: 'Life Force / Vital Energy',
        icon: Icons.energy_savings_leaf,
        subcategories: lifeForceSubcategories,
      ),
      Category(
        id: 'energy_imbalances',
        label: 'Energy Imbalances',
        icon: Icons.balance,
        subcategories: energyImbalancesSubcategories,
      ),
      Category(
        id: 'energy_connections',
        label: 'Energy Connections',
        icon: Icons.device_hub,
        subcategories: energyConnectionsSubcategories,
      ),
      Category(
        id: 'sacred_geometry_vibrational_patterns',
        label: 'Sacred Geometry & Vibrational Patterns',
        icon: Icons.hexagon,
        subcategories: sacredGeometrySubcategories,
      ),
      Category(
        id: 'states_of_harmony',
        label: 'States of Harmony',
        icon: Icons.self_improvement,
        subcategories: statesOfHarmonySubcategories,
      ),
      Category(
        id: 'energetic_influences',
        label: 'Energetic Influences',
        icon: Icons.waves,
        subcategories: energeticInfluencesSubcategories,
      ),
      Category(
        id: 'negative_beliefs',
        label: 'Negative Beliefs',
        icon: Icons.psychology_alt,
        subcategories: negativeBeliefsSubcategories,
      ),
      Category(
        id: 'unresolved_emotions',
        label: 'Unresolved Emotions',
        icon: Icons.sentiment_dissatisfied,
        subcategories: unresolvedEmotionsSubcategories,
      ),
    ];
  }

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

  // Helper function to generate anatomy categories for a specific animal
  static List<Category> getAnatomyCategoriesForAnimal(String animalId) {
    return [
      Category(
        id: 'energy',
        label: 'Energy',
        icon: Icons.flash_on,
        imagePath: 'assets/images/$animalId/energy.png',
        subcategories: getEnergyCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'skeletal_system',
        label: 'Skeletal System',
        icon: Icons.accessibility,
        imagePath: 'assets/images/$animalId/skeletal_system.png',
        subcategories: skeletalSystemCategories,
      ),
      Category(
        id: 'muscular_system',
        label: 'Muscular System',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/$animalId/muscular_system.png',
        subcategories: muscularSystemCategories,
      ),
      Category(
        id: 'organ_gland_system',
        label: 'Organ & Gland System',
        icon: Icons.favorite,
        imagePath: 'assets/images/$animalId/oragn_&_gland.png',
        subcategories: organGlandSystemCategories,
      ),
      Category(
        id: 'body_systems',
        label: 'Body Systems',
        icon: Icons.psychology,
        imagePath: 'assets/images/$animalId/body_systems.png',
        subcategories: bodySystemsCategories,
      ),
      Category(
        id: 'sensory_external_structures',
        label: 'Sensory & External Structures',
        icon: Icons.visibility,
        imagePath: 'assets/images/$animalId/sensory_&_external.png',
        subcategories: sensoryExternalCategories,
      ),
    ];
  }

  static List<Category> get mainCategories {
    return [
      Category(
        id: 'horse',
        label: 'Horse',
        icon: Icons.pets,
        imagePath: 'assets/images/horse.png',
        subcategories: getAnatomyCategoriesForAnimal('horse'),
      ),
      Category(
        id: 'dog',
        label: 'Dog',
        icon: Icons.pets,
        imagePath: 'assets/images/dog.png',
        subcategories: getAnatomyCategoriesForAnimal('dog'),
      ),
      Category(
        id: 'cat',
        label: 'Cat',
        icon: Icons.pets,
        imagePath: 'assets/images/cat.png',
        subcategories: getAnatomyCategoriesForAnimal('cat'),
      ),
      Category(
        id: 'bird',
        label: 'Bird',
        icon: Icons.flutter_dash,
        imagePath: 'assets/images/bird.png',
        subcategories: getAnatomyCategoriesForAnimal('bird'),
      ),
      Category(
        id: 'cow',
        label: 'Cow',
        icon: Icons.pets,
        imagePath: 'assets/images/cow.png',
        subcategories: getAnatomyCategoriesForAnimal('cow'),
        isComingSoon: true,
      ),
      Category(
        id: 'guineapig',
        label: 'Guinea Pig',
        icon: Icons.pets,
        imagePath: 'assets/images/guineapig.png',
        subcategories: getAnatomyCategoriesForAnimal('guineapig'),
        isComingSoon: true,
      ),
      Category(
        id: 'rabbit',
        label: 'Rabbit',
        icon: Icons.pets,
        imagePath: 'assets/images/rabbit.png',
        subcategories: getAnatomyCategoriesForAnimal('rabbit'),
        isComingSoon: true,
      ),
    ];
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
}

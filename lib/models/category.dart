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
  // Cache for generated subcategories to avoid regeneration
  static final Map<String, List<Category>> _anatomyCache = {};
  static final Map<String, List<Category>> _energyCache = {};
  /// Get energy categories for a specific animal with caching
  static List<Category> getEnergyCategoriesForAnimal(String animalId) {
    print("sameed - getEnergyCategoriesForAnimal - animalId: $animalId");
    
    // Check cache first
    if (_energyCache.containsKey(animalId)) {
      print("sameed - returning cached energy categories for $animalId");
      return _energyCache[animalId]!;
    }
    // Define chakra subcategories for Horse, Dog, Cat, and Bird
    List<Category> chakraSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      chakraSubcategories = [
        Category(
          id: 'main_chakra',
          label: 'Main Chakra',
          icon: Icons.circle,
          imagePath: 'assets/images/energy/chakras/main_chakra.webp',
          subcategories: [
            Category(
              id: 'root_chakra',
              label: 'Root Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/root_chakra.webp',
            ),
            Category(
              id: 'sacral_chakra',
              label: 'Sacral Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/sacral_chakra.webp',
            ),
            Category(
              id: 'solar_plexus_chakra',
              label: 'Solar Plexus Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/solar_plexus_chakra.webp',
            ),
            Category(
              id: 'heart_chakra',
              label: 'Heart Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/heart_chakra.webp',
            ),
            Category(
              id: 'throat_chakra',
              label: 'Throat Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/throat_chakra.webp',
            ),
            Category(
              id: 'third_eye_chakra',
              label: 'Third Eye Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/third_eye_chakra.webp',
            ),
            Category(
              id: 'crown_chakra',
              label: 'Crown Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/crown_chakra.webp',
            ),
            Category(
              id: 'brachial_shoulder_chakra',
              label: 'Brachial/Shoulder Chakra',
              icon: Icons.circle,
              imagePath: 'assets/images/energy/chakras/main_chakra/brachial_shoulder_chakra.webp',
            ),
          ],
        ),
      ];

      String animal = animalId.toLowerCase();
      List<Category> secondarySubs = [];
      if (animal == 'horse') {
        secondarySubs = [
          Category(
            id: 'hoof_chakras',
            label: 'Hoof Chakras (4)',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/hoof_chakras.webp',
          ),
          Category(
            id: 'tail_chakra',
            label: 'Tail Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_chakra.webp',
          ),
          Category(
            id: 'nose_muzzle_chakra',
            label: 'Nose/Muzzle Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/nose_chakra.webp',
          ),
          Category(
            id: 'ear_chakra',
            label: 'Ear Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/ear_chakra.webp',
          ),
          Category(
            id: 'flank_chakras',
            label: 'Flank Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/flank_chakras.webp',
          ),
          Category(
            id: 'whorl_chakra',
            label: 'Whorl Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whorl_chakra.webp',
          ),
          Category(
            id: 'spleen_chakra',
            label: 'Spleen Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/spleen_chakra.webp',
          ),
        ];
      } else if (animal == 'dog') {
        secondarySubs = [
          Category(
            id: 'paw_chakras',
            label: 'Paw Chakras (4)',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/paw_chakras.webp',
          ),
          Category(
            id: 'tail_chakra',
            label: 'Tail Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_chakra.webp',
          ),
          Category(
            id: 'ear_chakra',
            label: 'Ear Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/ear_chakra.webp',
          ),
          Category(
            id: 'nose_chakra',
            label: 'Nose Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/nose_chakra.webp',
          ),
          Category(
            id: 'spleen_chakra',
            label: 'Spleen Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/spleen_chakra.webp',
          ),
        ];
      } else if (animal == 'cat') {
        secondarySubs = [
          Category(
            id: 'paw_chakras',
            label: 'Paw Chakras (4)',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/paw_chakras.webp',
          ),
          Category(
            id: 'tail_chakra',
            label: 'Tail Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_chakra.webp',
          ),
          Category(
            id: 'spleen_chakra',
            label: 'Spleen Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/spleen_chakra.webp',
          ),
          Category(
            id: 'whisker_chakras',
            label: 'Whisker Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whisker_chakras.webp',
          ),
          Category(
            id: 'ear_chakra',
            label: 'Ear Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/ear_chakra.webp',
          ),
        ];
      } else if (animal == 'bird') {
        secondarySubs = [
          Category(
            id: 'wing_chakras',
            label: 'Wing Chakras (2)',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/wing_chakras.webp',
          ),
          Category(
            id: 'beak_chakra',
            label: 'Beak Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/beak_chakra.webp',
          ),
          Category(
            id: 'feet_chakras',
            label: 'Feet Chakras (2)',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/feet_chakras.webp',
          ),
          Category(
            id: 'ear_side_head_chakras',
            label: 'Ear/Side Head Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/ear_chakra.webp',
          ),
          Category(
            id: 'tail_feather_chakra',
            label: 'Tail Feather Chakra', 
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_feather_chakra.webp',
          ),
        ];
      }

      if (secondarySubs.isNotEmpty) {
        chakraSubcategories.add(
          Category(
            id: 'secondary_chakra',
            label: 'Secondary Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra.webp',
            subcategories: secondarySubs,
          ),
        );
      }
    }

    // Define aura & energy field subcategories for Horse, Dog, and Cat
    List<Category> auraEnergyFieldSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      auraEnergyFieldSubcategories = [
        Category(id: 'aura_layers', label: 'Aura Layers (etheric, emotional, mental, spiritual)', icon: Icons.layers),
        Category(id: 'field_strength_weakness', label: 'Field Strength / Weakness', icon: Icons.flash_on),
        Category(id: 'protection_permeability', label: 'Protection & Permeability', icon: Icons.shield),
      ];
    }

    // Define meridians subcategories for Horse, Dog, and Cat
    List<Category> meridiansSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      meridiansSubcategories = [
        Category(
          id: 'primary_meridian', 
          label: 'Primary Meridian', 
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
          ],
        ),
        Category(
          id: 'extraordinary_meridian', 
          label: 'Extraordinary Meridian', 
          icon: Icons.linear_scale,
          subcategories: [
            Category(id: 'liver_meridian', label: 'Liver (LV)', icon: Icons.local_hospital),
            Category(id: 'conception_vessel', label: 'Conception Vessel', icon: Icons.horizontal_split),
            Category(id: 'governing_vessel', label: 'Governing Vessel', icon: Icons.vertical_split),
            Category(id: 'chong_mai', label: 'Chong Mai', icon: Icons.vertical_split),
            Category(id: 'dai_mai_belt_vessel', label: 'Dai Mai (Belt Vessel)', icon: Icons.vertical_split),
            Category(id: 'yin_qiao_mai_yin_heel_vessel', label: 'Yin Qiao Mai (Yin Heel Vessel)', icon: Icons.vertical_split),
            Category(id: 'yang_qiao_mai_yang_heel_vessel', label: 'Yang Qiao Mai (Yang Heel Vessel)', icon: Icons.vertical_split),
            Category(id: 'yin_wei_mai_yin_linking_vessel', label: 'Yin Wei Mai (Yin Linking Vessel)', icon: Icons.vertical_split),
            Category(id: 'yang_wei_mai_yang_linking_vessel', label: 'Yang Wei Mai (Yang Linking Vessel)', icon: Icons.vertical_split),
          ],
        ),
        Category(
          id: 'energy_balance_in_the_body',
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
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      lifeForceSubcategories = [
        Category(id: 'general_energy_level', label: 'General Energy Level', icon: Icons.battery_full),
        Category(id: 'flow_vs_stagnation', label: 'Flow vs. Stagnation', icon: Icons.waves),
        Category(id: 'overload_vs_depletion', label: 'Overload vs. Depletion', icon: Icons.scale),
      ];
    }

    // Define energy imbalances subcategories for Horse, Dog, and Cat
    List<Category> energyImbalancesSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
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
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      energyConnectionsSubcategories = [
        Category(id: 'cord_with_humans', label: 'Cord with Humans', icon: Icons.people),
        Category(id: 'cord_with_other_animals', label: 'Cord with Other Animals', icon: Icons.pets),
        Category(id: 'connection_to_nature_earth', label: 'Connection to Nature/Earth', icon: Icons.terrain),
        Category(id: 'spiritual_connection', label: 'Spiritual Connection', icon: Icons.spa),
      ];
    }

    // Define sacred geometry & vibrational patterns subcategories for Horse, Dog, and Cat
    List<Category> sacredGeometrySubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      sacredGeometrySubcategories = [
        Category(id: 'flower_of_life', label: 'Flower of Life (unity, interconnectedness)', icon: Icons.blur_on),
        Category(id: 'seed_of_life', label: 'Seed of Life (beginnings, regeneration)', icon: Icons.grain),
        Category(id: 'metatrons_cube', label: 'Metatron\'s Cube (structure, balance)', icon: Icons.hexagon),
        Category(id: 'spiral', label: 'Spiral (growth, evolution, healing flow)', icon: Icons.rotate_right),
      ];
    }

    // Define states of harmony subcategories for Horse, Dog, and Cat
    List<Category> statesOfHarmonySubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      statesOfHarmonySubcategories = [
        Category(id: 'balance_homeostasis', label: 'Balance (homeostasis)', icon: Icons.balance),
        Category(id: 'disharmony_chaotic_field', label: 'Disharmony (chaotic field)', icon: Icons.warning_amber),
      ];
    }

    // Define energetic influences subcategories for Horse, Dog, and Cat
    List<Category> energeticInfluencesSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
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
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
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
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
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

    // Generate energy categories and cache them
    final categories = [
      Category(
        id: 'chakras',
        label: 'Chakras',
        icon: Icons.brightness_7,
        imagePath: 'assets/images/energy/chakras.webp',
        subcategories: chakraSubcategories,
      ),
      Category(
        id: 'aura_energy_field',
        label: 'Aura & Energy Field',
        icon: Icons.blur_circular,
        imagePath: 'assets/images/$animalId/energy/aura_&_energy_field.webp',
        subcategories: auraEnergyFieldSubcategories,
      ),
      Category(
        id: 'meridians',
        label: 'Meridians',
        icon: Icons.linear_scale,
        imagePath: 'assets/images/$animalId/energy/meridians.webp',
        subcategories: meridiansSubcategories,
      ),
      Category(
        id: 'life_force_vital_energy',
        label: 'Life Force / Vital Energy',
        icon: Icons.energy_savings_leaf,
        imagePath: 'assets/images/energy/life_force_vital_energy.webp',
        subcategories: lifeForceSubcategories,
      ),
      Category(
        id: 'energy_imbalances',
        label: 'Energy Imbalances',
        icon: Icons.balance,
        imagePath: 'assets/images/energy/energy_imbalances.webp',
        subcategories: energyImbalancesSubcategories,
      ),
      Category(
        id: 'energy_connections',
        label: 'Energy Connections',
        icon: Icons.device_hub,
        imagePath: 'assets/images/energy/energy_connections.webp',
        subcategories: energyConnectionsSubcategories,
      ),
      Category(
        id: 'sacred_geometry_vibrational_patterns',
        label: 'Sacred Geometry & Vibrational Patterns',
        icon: Icons.hexagon,
        imagePath: 'assets/images/energy/sacred_geometry_vibrational_patterns.webp',
        subcategories: sacredGeometrySubcategories,
      ),
      Category(
        id: 'states_of_harmony',
        label: 'States of Harmony',
        icon: Icons.self_improvement,
        imagePath: 'assets/images/energy/states_of_harmony.webp',
        subcategories: statesOfHarmonySubcategories,
      ),
      Category(
        id: 'energetic_influences',
        label: 'Energetic Influences',
        icon: Icons.waves,
        imagePath: 'assets/images/$animalId/energy/energetic_influences.webp',
        subcategories: energeticInfluencesSubcategories,
      ),
      Category(
        id: 'negative_beliefs',
        label: 'Negative Beliefs',
        icon: Icons.psychology_alt,
        imagePath: 'assets/images/energy/negative_beliefs.webp',
        subcategories: negativeBeliefsSubcategories,
      ),
      Category(
        id: 'unresolved_emotions',
        label: 'Unresolved Emotions',
        icon: Icons.sentiment_dissatisfied,
        imagePath: 'assets/images/$animalId/energy/unresolved_emotions.webp',
        subcategories: unresolvedEmotionsSubcategories,
      ),
    ];
    
    _energyCache[animalId] = categories;
    return categories;
  }

  // Get muscular system categories for a specific animal
  static List<Category> getMuscularSystemCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'head_neck',
          label: 'Head & Neck',
          icon: Icons.face,
          subcategories: [
            Category(id: 'masseter', label: 'Masseter', icon: Icons.fitness_center),
          ],
        ),
        Category(
          id: 'throat',
          label: 'Throat',
          icon: Icons.restaurant,
          subcategories: [
            Category(id: 'hyoid_muscles', label: 'Hyoid Muscles', icon: Icons.fitness_center),
            Category(id: 'pharyngeal_muscles', label: 'Pharyngeal Muscles', icon: Icons.fitness_center),
            Category(
              id: 'laryngeal_muscles',
              label: 'Laryngeal Muscles',
              icon: Icons.fitness_center,
              subcategories: [
                Category(id: 'abductors_tensors', label: 'Abductors & Tensors', icon: Icons.fitness_center),
                Category(id: 'adductors_relaxers', label: 'Adductors & Relaxers', icon: Icons.fitness_center),
              ],
            ),
          ],
        ),
        Category(
          id: 'thoracic_limb_muscles',
          label: 'Thoracic Limb Muscles',
          icon: Icons.accessibility,
          subcategories: [
            Category(
              id: 'shoulder_muscles',
              label: 'Shoulder Muscles',
              icon: Icons.fitness_center,
              subcategories: [
                Category(id: 'lateral_group', label: 'Lateral Group', icon: Icons.fitness_center),
                Category(id: 'medial_group', label: 'Medial Group', icon: Icons.fitness_center),
              ],
            ),
            Category(
              id: 'antebrachium_paw_muscles',
              label: 'Antebrachium & Paw Muscles',
              icon: Icons.fitness_center,
              subcategories: [
                Category(id: 'extensors_supinators', label: 'Extensors & Supinators', icon: Icons.fitness_center),
                Category(id: 'flexors_pronators', label: 'Flexors & Pronators', icon: Icons.fitness_center),
              ],
            ),
          ],
        ),
        Category(
          id: 'pectoral_muscles',
          label: 'Pectoral Muscles',
          icon: Icons.fitness_center,
          subcategories: [
            Category(id: 'superficial', label: 'Superficial', icon: Icons.fitness_center),
            Category(id: 'deep', label: 'Deep', icon: Icons.fitness_center),
          ],
        ),
        Category(
          id: 'hip_thigh_muscles',
          label: 'Hip & Thigh Muscles',
          icon: Icons.fitness_center,
          subcategories: [
            Category(id: 'gluteal_hamstring_muscles', label: 'Gluteal & Hamstring Muscles', icon: Icons.fitness_center),
            Category(id: 'medial_cranial_thigh_muscles', label: 'Medial & Cranial Thigh Muscles', icon: Icons.fitness_center),
          ],
        ),
        Category(
          id: 'crus_pes_muscles',
          label: 'Crus & Pes Muscles',
          icon: Icons.fitness_center,
          subcategories: [
            Category(id: 'caudal_flexor_group', label: 'Caudal (Flexor) Group', icon: Icons.fitness_center),
            Category(id: 'cranial_lateral_extensor_group', label: 'Cranial & Lateral (Extensor) Group', icon: Icons.fitness_center),
          ],
        ),
        Category(
          id: 'axial_muscle',
          label: 'Axial Muscle',
          icon: Icons.fitness_center,
          subcategories: [
            Category(id: 'epaxial_muscles', label: 'Epaxial Muscles', icon: Icons.fitness_center),
            Category(id: 'hypaxial_abdominal_muscles', label: 'Hypaxial & Abdominal Muscles', icon: Icons.fitness_center),
          ],
        ),
        Category(
          id: 'muscles_of_respiration',
          label: 'Muscles of Respiration',
          icon: Icons.air,
          subcategories: [
            Category(id: 'inspiratory', label: 'Inspiratory', icon: Icons.fitness_center),
            Category(id: 'expiratory', label: 'Expiratory', icon: Icons.fitness_center),
          ],
        ),
        Category(
          id: 'tail_muscles',
          label: 'Tail Muscles',
          icon: Icons.pets,
          subcategories: [
            Category(id: 'dorsal_group', label: 'Dorsal Group', icon: Icons.fitness_center),
            Category(id: 'ventral_group', label: 'Ventral Group', icon: Icons.fitness_center),
            Category(id: 'intrinsic_group', label: 'Intrinsic Group', icon: Icons.fitness_center),
          ],
        ),
      ];
    }
    
    // Default muscular system categories for other animals
    return muscularSystemCategories;
  }

  // Get body systems categories for a specific animal
  static List<Category> getBodySystemsCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'cardiovascular_system',
          label: 'Cardiovascular System',
          icon: Icons.bloodtype,
          subcategories: [
            Category(
              id: 'heart_vessels',
              label: 'Heart & Vessels',
              icon: Icons.favorite,
              subcategories: [
                Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
                Category(id: 'valves', label: 'Valves', icon: Icons.check_circle),
                Category(id: 'major_vessels', label: 'Major Vessels', icon: Icons.linear_scale),
              ],
            ),
          ],
        ),
        Category(
          id: 'respiratory_system',
          label: 'Respiratory System',
          icon: Icons.air,
          imagePath: 'assets/images/body_systems/respiratory_system.webp',
          subcategories: [
            Category(
              id: 'upper_airways',
              label: 'Upper Airways',
              icon: Icons.air,
              subcategories: [
                Category(id: 'nasal_cavity_turbinates', label: 'Nasal Cavity & Turbinates', icon: Icons.air),
              ],
            ),
          ],
        ),
        Category(
          id: 'digestive_system',
          label: 'Digestive System',
          icon: Icons.restaurant,
          subcategories: [
            Category(id: 'oral_cavity', label: 'Oral Cavity', icon: Icons.emoji_food_beverage),
          ],
        ),
        Category(
          id: 'urinary_system',
          label: 'Urinary System',
          icon: Icons.water_drop,
          subcategories: [
            Category(id: 'kidneys_cortex_medulla_pelvis', label: 'Kidneys (Cortex, Medulla, Pelvis)', icon: Icons.water_drop),
            Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
            Category(id: 'urinary_bladder', label: 'Urinary Bladder', icon: Icons.opacity),
            Category(id: 'urethra', label: 'Urethra', icon: Icons.linear_scale),
          ],
        ),
        Category(
          id: 'reproductive_system_male',
          label: 'Reproductive System (Male)',
          icon: Icons.male,
          imagePath: 'assets/images/body_systems/reproductive_system_male.webp',
          subcategories: [
            Category(
              id: 'testes',
              label: 'Testes',
              icon: Icons.circle,
              subcategories: [
                Category(id: 'testes_epididymides', label: 'Testes & Epididymides', icon: Icons.circle),
              ],
            ),
            Category(
              id: 'duct_system',
              label: 'Duct System',
              icon: Icons.linear_scale,
              subcategories: [
                Category(id: 'ductus_deferens', label: 'Ductus Deferens', icon: Icons.linear_scale),
              ],
            ),
            Category(
              id: 'accessory_glands',
              label: 'Accessory Glands',
              icon: Icons.scatter_plot,
              subcategories: [
                Category(id: 'prostate_gland', label: 'Prostate Gland', icon: Icons.scatter_plot),
              ],
            ),
            Category(
              id: 'copulatory_organ',
              label: 'Copulatory Organ',
              icon: Icons.straighten,
              subcategories: [
                Category(id: 'penis', label: 'Penis', icon: Icons.straighten),
              ],
            ),
          ],
        ),
        Category(
          id: 'reproductive_system_female',
          label: 'Reproductive System (Female)',
          icon: Icons.female,
          imagePath: 'assets/images/body_systems/reproductive_system_female.webp',
          subcategories: [
            Category(id: 'ovaries', label: 'Ovaries', icon: Icons.circle),
            Category(id: 'uterine_tubes', label: 'Uterine Tubes', icon: Icons.linear_scale),
            Category(id: 'uterus_horns_body_cervix', label: 'Uterus (horns, body, cervix)', icon: Icons.favorite),
            Category(id: 'vagina_vestibule', label: 'Vagina & Vestibule', icon: Icons.linear_scale),
            Category(
              id: 'external_genitalia',
              label: 'External Genitalia',
              icon: Icons.crop_portrait,
              subcategories: [
                Category(id: 'clitoris_vulva', label: 'Clitoris & Vulva', icon: Icons.crop_portrait),
              ],
            ),
          ],
        ),
        Category(
          id: 'endocrine_system',
          label: 'Endocrine System',
          icon: Icons.scatter_plot,
          subcategories: [
            Category(
              id: 'glands',
              label: 'Glands',
              icon: Icons.scatter_plot,
              subcategories: [
                Category(id: 'pituitary_hypophysis', label: 'Pituitary (Hypophysis)', icon: Icons.scatter_plot),
                Category(id: 'pineal_gland', label: 'Pineal Gland', icon: Icons.scatter_plot),
                Category(id: 'thyroid_gland', label: 'Thyroid Gland', icon: Icons.scatter_plot),
                Category(id: 'parathyroid_glands', label: 'Parathyroid Glands', icon: Icons.scatter_plot),
                Category(id: 'adrenal_glands_cortex_medulla', label: 'Adrenal Glands (cortex/medulla)', icon: Icons.scatter_plot),
                Category(id: 'pancreatic_islets', label: 'Pancreatic Islets', icon: Icons.scatter_plot),
                Category(id: 'gonads', label: 'Gonads', icon: Icons.scatter_plot),
                Category(id: 'thymus', label: 'Thymus', icon: Icons.scatter_plot),
              ],
            ),
          ],
        ),
        Category(
          id: 'lymphatic_system',
          label: 'Lymphatic System',
          icon: Icons.water,
          subcategories: [
            Category(id: 'organs_ducts', label: 'Organs & Ducts', icon: Icons.water),
          ],
        ),
        Category(
          id: 'regional_lymph_nodes',
          label: 'Regional Lymph Nodes',
          icon: Icons.scatter_plot,
          subcategories: [
            Category(id: 'major_lymph_nodes', label: 'Major Lymph Nodes', icon: Icons.scatter_plot),
          ],
        ),
        Category(
          id: 'nervous_system_cns',
          label: 'Nervous System (CNS)',
          icon: Icons.psychology,
          subcategories: [
            Category(
              id: 'brain',
              label: 'Brain',
              icon: Icons.psychology,
              subcategories: [
                Category(id: 'cerebrum', label: 'Cerebrum', icon: Icons.psychology),
                Category(id: 'basal_nuclei', label: 'Basal Nuclei', icon: Icons.psychology),
                Category(id: 'diencephalon', label: 'Diencephalon', icon: Icons.psychology),
                Category(id: 'cerebellum_vermis_hemispheres', label: 'Cerebellum (vermis, hemispheres)', icon: Icons.psychology),
              ],
            ),
            Category(
              id: 'brainstem',
              label: 'Brainstem',
              icon: Icons.psychology,
              subcategories: [
                Category(id: 'midbrain', label: 'Midbrain', icon: Icons.psychology),
                Category(id: 'pons', label: 'Pons', icon: Icons.psychology),
                Category(id: 'medulla_oblongata', label: 'Medulla Oblongata', icon: Icons.psychology),
              ],
            ),
            Category(id: 'spinal_cord', label: 'Spinal Cord', icon: Icons.psychology),
          ],
        ),
        Category(
          id: 'peripheral_nervous_system_pns',
          label: 'Peripheral Nervous System (PNS)',
          icon: Icons.scatter_plot,
          subcategories: [
            Category(id: 'cranial_nerves', label: 'Cranial Nerves', icon: Icons.scatter_plot),
            Category(id: 'spinal_nerves', label: 'Spinal Nerves', icon: Icons.scatter_plot),
            Category(id: 'sensory_nerves', label: 'Sensory Nerves', icon: Icons.scatter_plot),
            Category(id: 'motor_nerves', label: 'Motor Nerves', icon: Icons.scatter_plot),
          ],
        ),
        Category(
          id: 'brachial_plexus_c6_t2',
          label: 'Brachial Plexus (C6-T2)',
          icon: Icons.linear_scale,
        ),
        Category(
          id: 'lumbosacral_plexus_l4_s3',
          label: 'Lumbosacral Plexus (L4-S3)',
          icon: Icons.linear_scale,
        ),
        Category(
          id: 'autonomic',
          label: 'Autonomic',
          icon: Icons.settings,
          subcategories: [
            Category(id: 'sympathetic', label: 'Sympathetic', icon: Icons.settings),
            Category(id: 'parasympathetic', label: 'Parasympathetic', icon: Icons.settings),
          ],
        ),
      ];
    }
    
    // Default body systems categories for other animals
    return bodySystemsCategories;
  }

  // Get skeletal system categories for a specific animal
  static List<Category> getSkeletalSystemCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'skull', 
          label: 'Skull', 
          icon: Icons.psychology,
          imagePath: 'assets/images/$animalId/skeletal_system/skull.webp',
          subcategories: [
            Category(id: 'cranial_bones', label: 'Cranial Bones', icon: Icons.psychology),
            Category(id: 'facial_bones', label: 'Facial Bones', icon: Icons.face),
            Category(id: 'mandible', label: 'Mandible', icon: Icons.architecture),
            Category(id: 'hyoid_apparatus', label: 'Hyoid Apparatus', icon: Icons.straighten),
            Category(id: 'auditory_ossicles', label: 'Auditory Ossicles', icon: Icons.hearing),
          ],
        ),
        Category(
          id: 'spine', 
          label: 'Spine', 
          icon: Icons.view_column,
          subcategories: [
            Category(id: 'cervical_vertebrae', label: 'Cervical Vertebrae', icon: Icons.view_column),
            Category(id: 'thoracic_vertebrae', label: 'Thoracic Vertebrae', icon: Icons.view_column),
            Category(id: 'lumbar_vertebrae', label: 'Lumbar Vertebrae', icon: Icons.view_column),
            Category(id: 'sacral_vertebrae', label: 'Sacral Vertebrae', icon: Icons.view_column),
            Category(id: 'caudal_vertebrae', label: 'Caudal Vertebrae', icon: Icons.view_column),
          ],
        ),
        Category(
          id: 'ribcage', 
          label: 'Ribcage', 
          icon: Icons.border_all,
          subcategories: [
            Category(id: 'true_rib', label: 'True Rib', icon: Icons.border_all),
            Category(id: 'false_rib', label: 'False Rib', icon: Icons.border_all),
            Category(id: 'floating_rib_13', label: 'Floating Rib 13', icon: Icons.border_all),
            Category(id: 'sternum', label: 'Sternum', icon: Icons.straighten),
          ],
        ),
        Category(
          id: 'shoulder_girdle', 
          label: 'Shoulder Girdle', 
          icon: Icons.accessibility,
          subcategories: [
            Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
          ],
        ),
        Category(
          id: 'forelimb', 
          label: 'Forelimb', 
          icon: Icons.accessibility,
          subcategories: [
            Category(
              id: 'arm',
              label: 'Arm',
              icon: Icons.accessibility,
              subcategories: [
                Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'forearm',
              label: 'Forearm',
              icon: Icons.accessibility,
              subcategories: [
                Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
                Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'carpus_proximal_row',
              label: 'Carpus (Proximal Row)',
              icon: Icons.grid_view,
              subcategories: [
                Category(id: 'intermedioradial_carpal', label: 'Intermedioradial Carpal', icon: Icons.accessibility),
                Category(id: 'ulnar_carpal', label: 'Ulnar Carpal', icon: Icons.accessibility),
                Category(id: 'accessory_carpal', label: 'Accessory Carpal', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'carpus_distal_row',
              label: 'Carpus (Distal Row)',
              icon: Icons.grid_view,
              subcategories: [
                Category(id: 'carpal_i_iv', label: 'Carpal I-IV', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'manus',
              label: 'Manus',
              icon: Icons.pan_tool,
              subcategories: [
                Category(id: 'metacarpal_i_v', label: 'Metacarpal I-V', icon: Icons.accessibility),
                Category(id: 'proximal_phalanges_i_v', label: 'Proximal Phalanges (I-V)', icon: Icons.accessibility),
                Category(id: 'middle_phalanges_ii_v', label: 'Middle Phalanges (II-V)', icon: Icons.accessibility),
                Category(id: 'distal_phalanges_i_v', label: 'Distal Phalanges (I-V)', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'sesamoids',
              label: 'Sesamoids',
              icon: Icons.circle,
              subcategories: [
                Category(id: 'proximal_sesamoids_ii_v', label: 'Proximal Sesamoids (II-V)', icon: Icons.accessibility),
                Category(id: 'dorsal_sesamoids_ii_v', label: 'Dorsal Sesamoids (II-V)', icon: Icons.accessibility),
              ],
            ),
          ],
        ),
        Category(
          id: 'pelvis',
          label: 'Pelvis',
          icon: Icons.accessibility,
          subcategories: [
            Category(id: 'ilium', label: 'Ilium', icon: Icons.accessibility),
            Category(id: 'ischium', label: 'Ischium', icon: Icons.accessibility),
            Category(id: 'pubis', label: 'Pubis', icon: Icons.accessibility),
            Category(id: 'acetabular_bone', label: 'Acetabular Bone', icon: Icons.accessibility),
          ],
        ),
        Category(
          id: 'hindlimb', 
          label: 'Hindlimb', 
          icon: Icons.grid_view,
          subcategories: [
            Category(
              id: 'thigh',
              label: 'Thigh',
              icon: Icons.straighten,
              subcategories: [
                Category(id: 'femur', label: 'Femur', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'stifle',
              label: 'Stifle',
              icon: Icons.join_inner,
              subcategories: [
                Category(id: 'patella', label: 'Patella', icon: Icons.accessibility),
                Category(id: 'fabellae_medial_lateral', label: 'Fabellae (medial/lateral)', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'leg',
              label: 'Leg',
              icon: Icons.straighten,
              subcategories: [
                Category(id: 'tibia', label: 'Tibia', icon: Icons.accessibility),
                Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'tarsus',
              label: 'Tarsus',
              icon: Icons.grid_view,
              subcategories: [
                Category(id: 'talus', label: 'Talus', icon: Icons.accessibility),
                Category(id: 'calcaneus', label: 'Calcaneus', icon: Icons.accessibility),
                Category(id: 'central_tarsal', label: 'Central Tarsal', icon: Icons.accessibility),
                Category(id: 'tarsal_i_iv', label: 'Tarsal I-IV', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'hindpaw',
              label: 'Hindpaw',
              icon: Icons.pan_tool,
              subcategories: [
                Category(id: 'metacarpals_i_v', label: 'Metacarpals I-V', icon: Icons.accessibility),
                Category(id: 'metatarsals_ii_v', label: 'Metatarsals II-V', icon: Icons.accessibility),
                Category(id: 'proximal_phalanges_ii_v', label: 'Proximal Phalanges (II-V)', icon: Icons.accessibility),
                Category(id: 'middle_phalanges_ii_v', label: 'Middle Phalanges (II-V)', icon: Icons.accessibility),
                Category(id: 'distal_phalanges_ii_v', label: 'Distal Phalanges (II-V)', icon: Icons.accessibility),
                Category(id: 'proximal_sesamoids_ii_v', label: 'Proximal Sesamoids (II-V)', icon: Icons.accessibility),
                Category(id: 'dorsal_sesamoids_ii_v', label: 'Dorsal Sesamoids (II-V)', icon: Icons.accessibility),
              ],
            ),
          ],
        ),
        Category(
          id: 'special_bones', 
          label: 'Special Bones', 
          icon: Icons.star,
          subcategories: [
            Category(id: 'os_penis_baculum', label: 'Os Penis (Baculum)', icon: Icons.star),
          ],
        ),
        Category(
          id: 'dentition', 
          label: 'Dentition', 
          icon: Icons.emoji_food_beverage,
          subcategories: [
            Category(id: 'incisor_upper', label: 'Incisor - Upper', icon: Icons.crop_square),
            Category(id: 'canine_upper', label: 'Canine - Upper', icon: Icons.change_history),
            Category(id: 'premolar_upper', label: 'Premolar - Upper', icon: Icons.crop_3_2),
            Category(id: 'molar_upper', label: 'Molar - Upper', icon: Icons.crop_7_5),
            Category(id: 'incisor_lower', label: 'Incisor - Lower', icon: Icons.crop_square),
            Category(id: 'canine_lower', label: 'Canine - Lower', icon: Icons.change_history),
            Category(id: 'premolar_lower', label: 'Premolar - Lower', icon: Icons.crop_3_2),
            Category(id: 'molar_lower', label: 'Molar - Lower', icon: Icons.crop_7_5),
          ],
        ),
      ];
    }
    
    // Default skeletal system categories for other animals
    return [
      Category(id: 'bones', label: 'Bones', icon: Icons.straighten),
      Category(id: 'joints', label: 'Joints', icon: Icons.join_inner),
      Category(id: 'cartilage', label: 'Cartilage', icon: Icons.layers),
      Category(id: 'bone_marrow', label: 'Bone Marrow', icon: Icons.circle),
      Category(id: 'skeletal_development', label: 'Skeletal Development', icon: Icons.trending_up),
    ];
  }

  // Mock subcategories for Muscular System
  static final List<Category> muscularSystemCategories = [
    Category(id: 'skeletal_muscles', label: 'Skeletal Muscles', icon: Icons.fitness_center),
    Category(id: 'cardiac_muscle', label: 'Cardiac Muscle', icon: Icons.favorite),
    Category(id: 'smooth_muscle', label: 'Smooth Muscle', icon: Icons.waves),
    Category(id: 'muscle_fibers', label: 'Muscle Fibers', icon: Icons.linear_scale),
    Category(id: 'tendons_ligaments', label: 'Tendons & Ligaments', icon: Icons.link),
    Category(id: 'muscle_groups', label: 'Muscle Groups', icon: Icons.group_work),
  ];

  // Mock subcategories for Organs
  static final List<Category> organsCategories = [
    Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
    Category(id: 'lungs', label: 'Lungs', icon: Icons.air),
    Category(id: 'liver', label: 'Liver', icon: Icons.local_hospital),
    Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
    Category(id: 'digestive_organs', label: 'Digestive Organs', icon: Icons.restaurant),
    Category(id: 'reproductive_organs', label: 'Reproductive Organs', icon: Icons.family_restroom),
  ];

  // Mock subcategories for Glands
  static final List<Category> glandsCategories = [
    Category(id: 'endocrine_glands', label: 'Endocrine Glands', icon: Icons.scatter_plot),
    Category(id: 'exocrine_glands', label: 'Exocrine Glands', icon: Icons.opacity),
    Category(id: 'salivary_glands', label: 'Salivary Glands', icon: Icons.restaurant_menu),
    Category(id: 'sweat_glands', label: 'Sweat Glands', icon: Icons.water_drop),
  ];

  // Mock subcategories for Connective Tissue
  static final List<Category> connectiveTissueCategories = [
    Category(id: 'cartilage', label: 'Cartilage', icon: Icons.layers),
    Category(id: 'bone', label: 'Bone', icon: Icons.straighten),
    Category(id: 'blood', label: 'Blood', icon: Icons.bloodtype),
    Category(id: 'adipose_tissue', label: 'Adipose Tissue', icon: Icons.circle),
    Category(id: 'dense_connective_tissue', label: 'Dense Connective Tissue', icon: Icons.grid_on),
    Category(id: 'loose_connective_tissue', label: 'Loose Connective Tissue', icon: Icons.blur_on),
  ];

  // Mock subcategories for Organ & Gland System (deprecated - kept for backward compatibility)
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

  // Get sensory & external structure categories for a specific animal
  static List<Category> getSensoryExternalCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'vision',
          label: 'Vision',
          icon: Icons.visibility,
          subcategories: [
            Category(id: 'structures', label: 'Structures', icon: Icons.visibility),
            Category(id: 'accessory_structures', label: 'Accessory Structures', icon: Icons.visibility_off),
          ],
        ),
        Category(
          id: 'hearing_balance',
          label: 'Hearing & Balance',
          icon: Icons.hearing,
          subcategories: [
            Category(id: 'auditory_structures', label: 'Auditory Structures', icon: Icons.hearing),
            Category(id: 'vestibular_structures', label: 'Vestibular Structures', icon: Icons.balance),
          ],
        ),
        Category(
          id: 'smell_taste',
          label: 'Smell & Taste',
          icon: Icons.air,
          subcategories: [
            Category(id: 'smell', label: 'Smell', icon: Icons.air),
            Category(id: 'taste', label: 'Taste', icon: Icons.emoji_food_beverage),
          ],
        ),
        Category(
          id: 'touch',
          label: 'Touch',
          icon: Icons.touch_app,
          subcategories: [
            Category(id: 'cutaneous_structures', label: 'Cutaneous Structures', icon: Icons.touch_app),
            Category(id: 'proprioceptive_structures', label: 'Proprioceptive Structures', icon: Icons.sensors),
          ],
        ),
      ];
    }
    
    // Default sensory & external structure categories for other animals
    return sensoryExternalCategories;
  }

  // Get connective tissue categories for a specific animal
  static List<Category> getConnectiveTissueCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'fascia',
          label: 'Fascia',
          icon: Icons.layers,
          subcategories: [
            Category(id: 'superficial', label: 'Superficial', icon: Icons.layers),
            Category(id: 'deep_myofascia', label: 'Deep (Myofascia)', icon: Icons.layers),
          ],
        ),
        Category(
          id: 'tendons',
          label: 'Tendons',
          icon: Icons.link,
          subcategories: [
            Category(id: 'forelimb', label: 'Forelimb', icon: Icons.accessibility),
            Category(id: 'hindlimb', label: 'Hindlimb', icon: Icons.accessibility),
          ],
        ),
        Category(
          id: 'ligaments',
          label: 'Ligaments',
          icon: Icons.link,
          subcategories: [
            Category(id: 'forelimb', label: 'Forelimb', icon: Icons.accessibility),
            Category(id: 'hindlimb', label: 'Hindlimb', icon: Icons.accessibility),
          ],
        ),
        Category(
          id: 'cartilage',
          label: 'Cartilage',
          icon: Icons.layers,
          subcategories: [
            Category(id: 'axial', label: 'Axial', icon: Icons.layers),
            Category(id: 'appendicular', label: 'Appendicular', icon: Icons.layers),
          ],
        ),
        Category(
          id: 'adipose_tissue',
          label: 'Adipose Tissue',
          icon: Icons.circle,
          subcategories: [
            Category(id: 'superficial', label: 'Superficial', icon: Icons.circle),
            Category(id: 'visceral', label: 'Visceral', icon: Icons.circle),
          ],
        ),
        Category(id: 'blood', label: 'Blood', icon: Icons.bloodtype),
        Category(id: 'lymph', label: 'Lymph', icon: Icons.water),
      ];
    }
    
    // Default connective tissue categories for other animals
    return connectiveTissueCategories;
  }

  // Get organs categories for a specific animal
  static List<Category> getOrgansCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'head',
          label: 'Head',
          icon: Icons.face,
          subcategories: [
            Category(id: 'eye', label: 'Eye', icon: Icons.visibility),
            Category(id: 'ear', label: 'Ear', icon: Icons.hearing),
          ],
        ),
        Category(
          id: 'head_neck',
          label: 'Head/Neck',
          icon: Icons.restaurant,
          subcategories: [
            Category(id: 'larynx', label: 'Larynx', icon: Icons.mic),
          ],
        ),
        Category(
          id: 'thorax',
          label: 'Thorax',
          icon: Icons.accessibility,
          subcategories: [
            Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
            Category(id: 'lungs_lobes', label: 'Lungs (lobes)', icon: Icons.air),
          ],
        ),
        Category(
          id: 'abdomen',
          label: 'Abdomen',
          icon: Icons.restaurant,
          subcategories: [
            Category(id: 'liver_lobes_processes', label: 'Liver (lobes & processes)', icon: Icons.local_hospital),
            Category(id: 'gallbladder', label: 'Gallbladder', icon: Icons.opacity),
            Category(id: 'stomach', label: 'Stomach', icon: Icons.restaurant),
            Category(id: 'pancreas', label: 'Pancreas', icon: Icons.scatter_plot),
            Category(id: 'spleen', label: 'Spleen', icon: Icons.scatter_plot),
            Category(id: 'small_intestine', label: 'Small Intestine', icon: Icons.linear_scale),
            Category(id: 'large_intestine', label: 'Large Intestine', icon: Icons.linear_scale),
          ],
        ),
        Category(
          id: 'urinary',
          label: 'Urinary',
          icon: Icons.water_drop,
          subcategories: [
            Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
            Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
            Category(id: 'urinary_bladder', label: 'Urinary Bladder', icon: Icons.opacity),
          ],
        ),
      ];
    }
    
    // Default organs categories for other animals
    return organsCategories;
  }

  // Get glands categories for a specific animal
  static List<Category> getGlandsCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'salivary',
          label: 'Salivary',
          icon: Icons.scatter_plot,
          subcategories: [
            Category(id: 'parotid_gland', label: 'Parotid Gland', icon: Icons.scatter_plot),
            Category(id: 'mandibular_gland', label: 'Mandibular Gland', icon: Icons.scatter_plot),
            Category(id: 'sublingual_gland', label: 'Sublingual Gland (mono/polystomatic)', icon: Icons.scatter_plot),
            Category(id: 'zygomatic_gland', label: 'Zygomatic Gland', icon: Icons.scatter_plot),
          ],
        ),
        Category(
          id: 'ocular',
          label: 'Ocular',
          icon: Icons.visibility,
          subcategories: [
            Category(id: 'lacrimal_gland', label: 'Lacrimal Gland', icon: Icons.visibility),
            Category(id: 'gland_of_the_third_eyelid', label: 'Gland of the Third Eyelid', icon: Icons.visibility),
            Category(id: 'meibomian_tarsal_glands', label: 'Meibomian (Tarsal) Glands', icon: Icons.visibility),
          ],
        ),
        Category(
          id: 'dermal',
          label: 'Dermal',
          icon: Icons.layers,
          subcategories: [
            Category(id: 'sebaceous_glands', label: 'Sebaceous Glands', icon: Icons.layers),
            Category(id: 'apocrine_sweat_glands', label: 'Apocrine Sweat Glands', icon: Icons.layers),
            Category(id: 'merocrine_eccrine_glands', label: 'Merocrine (Eccrine) Glands', icon: Icons.layers),
          ],
        ),
        Category(
          id: 'perianal',
          label: 'Perianal',
          icon: Icons.scatter_plot,
          subcategories: [
            Category(id: 'anal_sacs_apocrine_glands', label: 'Anal Sacs (Apocrine Glands)', icon: Icons.scatter_plot),
            Category(id: 'circumanal_perianal_glands', label: 'Circumanal (Perianal) Glands', icon: Icons.scatter_plot),
          ],
        ),
        Category(
          id: 'mammary',
          label: 'Mammary',
          icon: Icons.scatter_plot,
          subcategories: [
            Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
          ],
        ),
      ];
    }
    
    // Default glands categories for other animals
    return glandsCategories;
  }

  // Mock subcategories for Sensory & External Structures (default for non-dog animals)
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
        id: 'skeletal_system',
        label: 'Skeletal System',
        icon: Icons.accessibility,
        imagePath: 'assets/images/$animalId/skeletal_system.webp',
        subcategories: getSkeletalSystemCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'muscular_system',
        label: 'Muscular System',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/$animalId/muscular_system.webp',
        subcategories: getMuscularSystemCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'connective_tissue',
        label: 'Connective Tissue',
        icon: Icons.layers,
        imagePath: 'assets/images/$animalId/connective_tissue.webp',
        subcategories: getConnectiveTissueCategoriesForAnimal(animalId),
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
        id: 'body_systems',
        label: 'Body Systems',
        icon: Icons.psychology,
        imagePath: 'assets/images/$animalId/body_systems.webp',
        subcategories: getBodySystemsCategoriesForAnimal(animalId),
      ),
      Category(
        id: 'sensory_external_structures',
        label: 'Sensory & External Structures',
        icon: Icons.visibility,
        imagePath: 'assets/images/$animalId/sensory_&_external.webp',
        subcategories: getSensoryExternalCategoriesForAnimal(animalId),
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
}

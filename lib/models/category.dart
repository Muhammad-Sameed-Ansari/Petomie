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
    List<Category> auraSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      auraSubcategories = [
        Category(
          id: 'layers', 
          label: 'Layers', 
          icon: Icons.layers,
          imagePath: 'assets/images/$animalId/energy/aura/layers.webp',
        ),
        Category(
          id: 'magnitude', 
          label: 'Magnitude', 
          icon: Icons.flash_on,
          imagePath: 'assets/images/$animalId/energy/aura/magnitude.webp',
        ),
        Category(
          id: 'boundary', 
          label: 'Boundary', 
          icon: Icons.shield,
          imagePath: 'assets/images/$animalId/energy/aura/boundary.webp',
        ),
      ];
    }

    // Define meridians subcategories for Horse, Dog, Cat, and Bird
    List<Category> meridiansSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      String animal = animalId.toLowerCase();

      meridiansSubcategories = [
        Category(
          id: 'primary_meridian', 
          label: 'Primary Meridian', 
          icon: Icons.call_split,
          subcategories: [
            Category(
              id: 'lung', 
              label: 'Lung (LU)', 
              icon: Icons.air,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/lung.webp',
            ),
            Category(
              id: 'large_intestine', 
              label: 'Large Intestine (LI)', 
              icon: Icons.restaurant,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/large_intestine.webp',
            ),
            Category(
              id: 'stomach', 
              label: 'Stomach (ST)', 
              icon: Icons.restaurant,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/stomach.webp',
            ),
            Category(
              id: 'spleen', 
              label: 'Spleen (SP)', 
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/spleen.webp',
            ),
            Category(
              id: 'heart', 
              label: 'Heart (HT)', 
              icon: Icons.favorite,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/heart.webp',
            ),
            Category(
              id: 'small_intestine', 
              label: 'Small Intestine (SI)', 
              icon: Icons.restaurant,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/small_intestine.webp',
            ),
            Category(
              id: 'bladder', 
              label: 'Bladder (BL)', 
              icon: Icons.water_drop,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/bladder.webp',
            ),
            Category(
              id: 'kidney', 
              label: 'Kidney (KI)', 
              icon: Icons.water_drop,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/kidney.webp', 
            ),
            Category(
              id: 'pericardium', 
              label: 'Pericardium (PC)', 
              icon: Icons.favorite_border,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/pericardium.webp',
            ),
            Category(
              id: 'triple_heater', 
              label: 'Triple Heater', 
              icon: Icons.whatshot,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/triple_heater.webp',
            ),
            Category(
              id: 'gall_bladder', 
              label: 'Gall Bladder (GB)', 
              icon: Icons.local_hospital,
              imagePath: 'assets/images/$animal/energy/meridians/primary_meridian/gall_bladder.webp',
            ),
          ],
        ),
        Category(
          id: 'extraordinary_meridian', 
          label: 'Extraordinary Meridian', 
          icon: Icons.linear_scale,
          subcategories: [
            Category(
              id: 'liver', 
              label: 'Liver (LV)', 
              icon: Icons.local_hospital,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/liver.webp',
            ),
            Category(
              id: 'conception_vessel', 
              label: 'Conception Vessel', 
              icon: Icons.horizontal_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/conception_vessel.webp',
            ),
            Category(
              id: 'governing_vessel', 
              label: 'Governing Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/governing_vessel.webp', 
            ),
            Category(
              id: 'penetrating_vessel', 
              label: 'Penetrating Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/penetrating_vessel.webp',
            ),
            Category(
              id: 'girdling_vessel', 
              label: 'Girdling Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/girdling_vessel.webp',
            ),
            Category(
              id: 'yin_heel_vessel', 
              label: 'Yin Heel Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/yin_heel_vessel.webp',
            ),
            Category(
              id: 'yang_heel_vessel', 
              label: 'Yang Heel Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/yang_heel_vessel.webp',
            ),
            Category(
              id: 'yin_linking_vessel', 
              label: 'Yin Linking Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/yin_linking_vessel.webp',
            ),
            Category(
              id: 'yang_linking_vessel', 
              label: 'Yang Linking Vessel', 
              icon: Icons.vertical_split,
              imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian/yang_linking_vessel.webp',
            ),
          ],
        ),
        Category(
          id: 'energy_balance_in_the_body',
          label: 'Energy Balance in the Body',
          icon: Icons.balance,
          subcategories: [
            Category(id: 'yin_yang_balance', label: 'Yin-Yang Balance', icon: Icons.yard),
          ],
        ),
      ];
    }

    // Define life force / vital energy subcategories for Horse, Dog, and Cat
    List<Category> lifeForceSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      lifeForceSubcategories = [
        Category(
          id: 'heart_field', 
          label: 'Heart Field', 
          icon: Icons.battery_full,
          imagePath: 'assets/images/energy/life_force/heart_field.webp',
        ),
        Category(
          id: 'general_energy_level',
          label: 'General Energy Level',
          icon: Icons.battery_full,
          imagePath: 'assets/images/energy/life_force/general_energy_level.webp',
        ),
        Category(
          id: 'flow_vs_stagnation',
          label: 'Flow vs. Stagnation',
          icon: Icons.waves,
          imagePath: 'assets/images/energy/life_force/flow_vs_stagnation.webp',
        ),
        Category(
          id: 'overload_vs_depletion',
          label: 'Overload vs. Depletion',
          icon: Icons.scale,
          imagePath: 'assets/images/energy/life_force/overload_vs_depletion.webp',
        ),
      ];
    }

    // Define energy imbalances subcategories for Horse, Dog, and Cat
    List<Category> imbalancesSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      imbalancesSubcategories = [
        Category(
          id: 'stress_overwhelm', 
          label: 'Stress & Overwhelm', 
          icon: Icons.warning,
          imagePath: 'assets/images/energy/imbalances/stress_overwhelm.webp',
        ),
        Category(
          id: 'energy_leaks',
          label: 'Energy Leaks',
          icon: Icons.leak_remove,
          imagePath: 'assets/images/energy/imbalances/energy_leaks.webp',
        ),
        Category(
          id: 'environmental_impacts',
          label: 'Environmental Impacts',
          icon: Icons.eco,
          imagePath: 'assets/images/energy/imbalances/environmental_impacts.webp',
          subcategories: [
            Category(
              id: 'electromagnetic_fields', 
              label: 'Electromagnetic Fields', 
              icon: Icons.wifi,
              imagePath: 'assets/images/energy/imbalances/environmental_impacts/electromagnetic_fields.webp',
            ),
            Category(
              id: 'chemicals_toxins', 
              label: 'Chemicals & Toxins', 
              icon: Icons.science,
              imagePath: 'assets/images/energy/imbalances/environmental_impacts/chemicals_toxins.webp',
            ),
          ],
        ),
        Category(
          id: 'connections',
          label: 'Connections',
          icon: Icons.eco,
          imagePath: 'assets/images/energy/imbalances/connections.webp',
          subcategories: [
            Category(
              id: 'cord_with_humans', 
              label: 'Cord with Humans', 
              icon: Icons.wifi,
              imagePath: 'assets/images/energy/imbalances/connections/cord_with_humans.webp',
            ),
            Category(
              id: 'cord_with_other_animals', 
              label: 'Cord with Other Animals', 
              icon: Icons.pets,
              imagePath: 'assets/images/energy/imbalances/connections/cord_with_other_animals.webp',
            ),
            Category(
              id: 'connection_to_nature', 
              label: 'Connection to Nature', 
              icon: Icons.terrain,
              imagePath: 'assets/images/energy/imbalances/connections/connection_to_nature.webp',
            ),
            Category(
              id: 'spiritual_connection', 
              label: 'Spiritual Connection', 
              icon: Icons.spa,
              imagePath: 'assets/images/energy/imbalances/connections/spiritual_connection.webp',
            ),
          ],
        ),
      ];
    }

    // Define sacred symbols subcategories for Horse, Dog, and Cat
    List<Category> sacredSymbolsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      sacredSymbolsSubcategories = [
        Category(
          id: 'flower_of_life',
          label: 'Flower of Life',
          icon: Icons.blur_on,
          imagePath: 'assets/images/energy/sacred_symbols/flower_of_life.webp',
        ),
        Category(
          id: 'seed_of_life',
          label: 'Seed of Life',
          icon: Icons.grain,
          imagePath: 'assets/images/energy/sacred_symbols/seed_of_life.webp',
        ),
        Category(
          id: 'metatrons_cube',
          label: 'Metatron\'s Cube',
          icon: Icons.hexagon,
          imagePath: 'assets/images/energy/sacred_symbols/metatrons_cube.webp',
        ),
        Category(
          id: 'spiral',
          label: 'Spiral',
          icon: Icons.rotate_right,
          imagePath: 'assets/images/energy/sacred_symbols/spiral.webp',
        ),
        Category(
          id: 'om',
          label: 'Om',
          icon: Icons.rotate_right,
          imagePath: 'assets/images/energy/sacred_symbols/om.webp',
        ),
        Category(
          id: 'ying_yang',
          label: 'Ying Yang',
          icon: Icons.rotate_right,
          imagePath: 'assets/images/energy/sacred_symbols/ying_yang.webp',
        ),
        Category(
          id: 'ankh',
          label: 'Ankh',
          icon: Icons.rotate_right,
          imagePath: 'assets/images/energy/sacred_symbols/ankh.webp',
        ),
        Category(
          id: 'hamsa_hand',
          label: 'Hamsa Hand',
          icon: Icons.rotate_right,
          imagePath: 'assets/images/energy/sacred_symbols/hamsa_hand.webp',
        ),
      ];
    }

    // Define states of harmony subcategories for Horse, Dog, and Cat
    List<Category> statesOfHarmonySubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      statesOfHarmonySubcategories = [
        Category(
          id: 'balance',
          label: 'Balance',
          icon: Icons.balance,
          imagePath: 'assets/images/energy/states_of_harmony/balance.webp',
        ),
        Category(
          id: 'disharmony',
          label: 'Disharmony',
          icon: Icons.warning_amber,
          imagePath: 'assets/images/energy/states_of_harmony/disharmony.webp',
        ),
      ];
    }

    // Define energetic influences subcategories for Horse, Dog, and Cat
    List<Category> energeticInfluencesSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      energeticInfluencesSubcategories = [
        Category(
          id: 'karmic_patterns',
          label: 'Karmic Patterns',
          icon: Icons.replay_circle_filled,
          imagePath: 'assets/images/energy/energetic_influences/karmic_patterns.webp',
        ),
        Category(
          id: 'contracts_vows',
          label: 'Contracts & Vows',
          icon: Icons.description,
          imagePath: 'assets/images/energy/energetic_influences/contracts_vows.webp',
        ),
        Category(
          id: 'portals_energy_gateways',
          label: 'Portals & Energy Gateways',
          icon: Icons.meeting_room,
          imagePath: 'assets/images/energy/energetic_influences/portals_energy_gateways.webp',
        ),
        Category(
          id: 'energy_attachments',
          label: 'Energy Attachments',
          icon: Icons.bug_report,
          imagePath: 'assets/images/energy/energetic_influences/energy_attachments.webp',
        ),
        Category(
          id: 'trauma_imprints',
          label: 'Trauma Imprints',
          icon: Icons.psychology,
          imagePath: 'assets/images/energy/energetic_influences/trauma_imprints.webp',
        ),
        Category(
          id: 'entities_spirit_attachments',
          label: 'Entities & Spirit Attachments',
          icon: Icons.visibility_off,
          imagePath: 'assets/images/energy/energetic_influences/entities_spirit_attachments.webp',
        ),
      ];
    }

    // Define negative beliefs subcategories for Horse, Dog, and Cat
    List<Category> negativeBeliefsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      negativeBeliefsSubcategories = [
        Category(
          id: 'safety_survival_beliefs',
          label: 'Safety & Survival Beliefs',
          icon: Icons.security,
          imagePath: 'assets/images/energy/negative_beliefs/safety_survival_beliefs.webp',
        ),
        Category(
          id: 'trust_relationship_beliefs',
          label: 'Trust & Relationship Beliefs',
          icon: Icons.handshake,
          imagePath: 'assets/images/energy/negative_beliefs/trust_relationship_beliefs.webp',
        ),
        Category(
          id: 'performance_expectation_beliefs',
          label: 'Performance & Expectation Beliefs',
          icon: Icons.star,
          imagePath: 'assets/images/energy/negative_beliefs/performance_expectation_beliefs.webp',
        ),
        Category(
          id: 'self_worth_beliefs',
          label: 'Self-Worth Beliefs',
          icon: Icons.self_improvement,
          imagePath: 'assets/images/energy/negative_beliefs/self_worth_beliefs.webp',
        ),
        Category(
          id: 'body_physical_beliefs',
          label: 'Body & Physical Beliefs',
          icon: Icons.accessibility,
          imagePath: 'assets/images/energy/negative_beliefs/body_physical_beliefs.webp',
        ),
        Category(
          id: 'freedom_autonomy_beliefs',
          label: 'Freedom & Autonomy Beliefs',
          icon: Icons.flight,
          imagePath: 'assets/images/energy/negative_beliefs/freedom_autonomy_beliefs.webp',
        ),
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
        id: 'aura',
        label: 'Aura',
        icon: Icons.blur_circular,
        imagePath: 'assets/images/$animalId/energy/aura.webp',
        subcategories: auraSubcategories,
      ),
      Category(
        id: 'meridians',
        label: 'Meridians',
        icon: Icons.linear_scale,
        imagePath: 'assets/images/$animalId/energy/meridians.webp',
        subcategories: meridiansSubcategories,
      ),
      Category(
        id: 'life_force',
        label: 'Life Force',
        icon: Icons.energy_savings_leaf,
        imagePath: 'assets/images/energy/life_force.webp',
        subcategories: lifeForceSubcategories,
      ),
      Category(
        id: 'imbalances',
        label: 'Imbalances',
        icon: Icons.balance,
        imagePath: 'assets/images/energy/imbalances.webp',
        subcategories: imbalancesSubcategories,
      ),
      Category(
        id: 'sacred_symbols',
        label: 'Sacred Symbols',
        icon: Icons.hexagon,
        imagePath: 'assets/images/energy/sacred_symbols.webp',
        subcategories: sacredSymbolsSubcategories,
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

  // Get muscles categories for a specific animal
  static List<Category> getMusclesCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'dog') {
      return [
        Category(
          id: 'head_neck',
          label: 'Head & Neck',
          icon: Icons.face,
          subcategories: [
            Category(id: 'fascial', label: 'Fascial', icon: Icons.fitness_center),
            Category(id: 'mastication', label: 'Mastication', icon: Icons.fitness_center),
            Category(id: 'neck', label: 'Neck', icon: Icons.fitness_center),
          ],
        ),
        Category(id: 'throat', label: 'Throat', icon: Icons.restaurant),
        Category(
          id: 'thoracic_limb_muscles',
          label: 'Thoracic Limb Muscles',
          icon: Icons.accessibility,
          subcategories: [
            Category(id: 'manus', label: 'Manus', icon: Icons.fitness_center),
            Category(id: 'brachium', label: 'Brachium', icon: Icons.fitness_center),
            Category(id: 'antebrachium', label: 'Antebrachium', icon: Icons.fitness_center),
            Category(id: 'shoulder', label: 'Shoulder', icon: Icons.fitness_center),
          ],
        ),
        Category(id: 'pectoral', label: 'Pectoral', icon: Icons.fitness_center),
        Category(
          id: 'hindlimb',
          label: 'Hindlimb',
          icon: Icons.fitness_center,
          subcategories: [
            Category(id: 'hip_thigh', label: 'Hip & Thigh', icon: Icons.fitness_center),
            Category(id: 'crus', label: 'Crus', icon: Icons.fitness_center),
            Category(id: 'pes', label: 'Pes', icon: Icons.fitness_center),
          ],
        ),
        Category(id: 'back', label: 'Back', icon: Icons.air),
        Category(id: 'abdominal', label: 'Abdominal', icon: Icons.air),
        Category(id: 'respiration', label: 'Respiration', icon: Icons.air),
        Category(id: 'tail', label: 'Tail', icon: Icons.pets),
        Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.pets),
      ];
    }
    
    // Default muscular system categories for other animals
    return muscularSystemCategories;
  }

  // Get body systems categories for a specific animal
  static List<Category> getSystemsCategoriesForAnimal(String animalId) {
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      return [
        Category(
          id: 'cardiovascular_system',
          label: 'Cardiovascular System',
          icon: Icons.bloodtype,
          imagePath: 'assets/images/systems/cardiovascular_system.webp',
          subcategories: [
            Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
            Category(id: 'arteries', label: 'Arteries', icon: Icons.check_circle),
            Category(id: 'veins', label: 'Veins', icon: Icons.linear_scale),
            Category(id: 'capillaries', label: 'Capillaries', icon: Icons.linear_scale),
          ],
        ),
        Category(
          id: 'respiratory_system',
          label: 'Respiratory System',
          icon: Icons.air,
          imagePath: 'assets/images/systems/respiratory_system.webp',
          subcategories: [
            Category(id: 'upper_airways', label: 'Upper Airways', icon: Icons.air),
            Category(id: 'lower_airways', label: 'Lower Airways', icon: Icons.air),
          ],
        ),
        Category(
          id: 'digestive_system',
          label: 'Digestive System',
          icon: Icons.restaurant,
          imagePath: 'assets/images/systems/digestive_system.webp',
          subcategories: [
            Category(
              id: 'upper_tract',
              label: 'Upper Tract',
              icon: Icons.emoji_food_beverage,
              subcategories: [
                Category(id: 'mouth', label: 'Mouth', icon: Icons.air),
                Category(id: 'teeth', label: 'Teeth', icon: Icons.air),
                Category(id: 'salivary_glands', label: 'Salivary Glands', icon: Icons.air),
                Category(id: 'pharynx', label: 'Pharynx', icon: Icons.air),
                Category(id: 'esophagus', label: 'Esophagus', icon: Icons.air),
                Category(id: 'stomach', label: 'Stomach', icon: Icons.air),
                Category(id: 'small_intestine', label: 'Small Intestine', icon: Icons.air),
                Category(id: 'large_intestine', label: 'Large Intestine', icon: Icons.air),
                Category(id: 'rectum', label: 'Rectum', icon: Icons.air),
              ]
            ),
            Category(
              id: 'lower_tract',
              label: 'Lower Tract',
              icon: Icons.emoji_food_beverage,
              subcategories: [
                Category(id: 'anus', label: 'Anus', icon: Icons.air),
                Category(id: 'liver', label: 'Liver', icon: Icons.air),
                Category(id: 'gallbladder', label: 'Gallbladder', icon: Icons.air),
                Category(id: 'pancreas', label: 'Pancreas', icon: Icons.air),
              ]
            ),
          ],
        ),
        Category(
          id: 'urinary_system',
          label: 'Urinary System',
          icon: Icons.water_drop,
          imagePath: 'assets/images/systems/urinary_system.webp',
          subcategories: [
            Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
            Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
            Category(id: 'urinary_bladder', label: 'Urinary Bladder', icon: Icons.opacity),
            Category(id: 'urethra', label: 'Urethra', icon: Icons.linear_scale),
          ],
        ),
        Category(
          id: 'reproductive_system',
          label: 'Reproductive System',
          icon: Icons.water_drop,
          imagePath: 'assets/images/systems/reproductive_system.webp',
          subcategories: [
            Category(
              id: 'male',
              label: 'Male',
              icon: Icons.male,
              imagePath: 'assets/images/systems/reproductive_system/male.webp',
              subcategories: [
                Category(
                  id: 'testes',
                  label: 'Testes',
                  icon: Icons.circle,
                  imagePath: 'assets/images/organs/pelvis/male/testes.webp',
                ),
                Category(id: 'epididymides', label: 'Epididymides', icon: Icons.circle),
                Category(id: 'sperm_duct', label: 'Sperm Duct', icon: Icons.linear_scale),
                Category(id: 'accessory_glands', label: 'Accessory Glands', icon: Icons.scatter_plot),
                Category(
                  id: 'penis',
                  label: 'Penis',
                  icon: Icons.scatter_plot,
                  imagePath: 'assets/images/systems/reproductive_system/male/penis.webp',
                ),
                Category(id: 'sheath', label: 'Sheath', icon: Icons.scatter_plot),
                Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              ],
            ),
            Category(
              id: 'female',
              label: 'Female',
              icon: Icons.female,
              imagePath: 'assets/images/systems/reproductive_system/female.webp',
              subcategories: [
                Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.circle),
                Category(id: 'ovaries', label: 'Ovaries', icon: Icons.circle),
                Category(id: 'uterine_tubes', label: 'Uterine Tubes', icon: Icons.linear_scale),
                Category(id: 'uterus', label: 'Uterus', icon: Icons.favorite),
                Category(id: 'vagina', label: 'Vagina', icon: Icons.linear_scale),
                Category(id: 'external_genitalia', label: 'External Genitalia', icon: Icons.crop_portrait),
              ],
            ),
          ],
        ),
        Category(
          id: 'endocrine_system',
          label: 'Endocrine System',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/systems/endocrine_system.webp',
          subcategories: [
            Category(
              id: 'pituitary',
              label: 'Pituitary',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/pituitary.webp',
            ),
            Category(
              id: 'pineal_gland', 
              label: 'Pineal Gland', 
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/pineal_gland.webp',
            ),
            Category(
              id: 'thyroid_gland',
              label: 'Thyroid Gland',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/thyroid_gland.webp',
            ),
            Category(
              id: 'parathyroid_glands',
              label: 'Parathyroid Glands',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/parathyroid_glands.webp',
            ),
            Category(
              id: 'adrenal_glands', 
              label: 'Adrenal Glands', 
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/adrenal_glands.webp',
            ),
            Category(
              id: 'pancreatic_islets',
              label: 'Pancreatic Islets',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/pancreatic_islets.webp',
            ),
            Category(
              id: 'gonads',
              label: 'Gonads',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/endocrine_system/gonads.webp',
            ),
            Category(
              id: 'thymus',
              label: 'Thymus',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/organs/thorax/thymus.webp'
            ),
            Category(id: 'endocrine_axis', label: 'Endocrine Axis', icon: Icons.scatter_plot),
          ],
        ),
        Category(
          id: 'lymphatic_system',
          label: 'Lymphatic System',
          imagePath: 'assets/images/systems/lymphatic_system.webp',
          icon: Icons.water,
          subcategories: [
            Category(
              id: 'thymus',
              label: 'Thymus',
              icon: Icons.water,
              imagePath: 'assets/images/organs/thorax/thymus.webp'
            ),
            Category(id: 'spleen', label: 'Spleen', icon: Icons.water),
            Category(id: 'tonsils', label: 'Tonsils', icon: Icons.water),
            Category(id: 'lymph_fluid', label: 'Lymph Fluid', icon: Icons.water),
            Category(id: 'lymphatic_vessel', label: 'Lymphatic Vessel', icon: Icons.water),
            Category(id: 'lymph_nodes', label: 'Lymph Nodes', icon: Icons.water),
          ],
        ),
        Category(
          id: 'nervous_system',
          label: 'Nervous System',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/systems/nervous_system.webp',
          subcategories: [
            Category(
              id: 'nervous_system_cns',
              label: 'Nervous System (CNS)',
              icon: Icons.psychology,
              imagePath: 'assets/images/systems/nervous_system/nervous_system_cns.webp',
              subcategories: [
                Category(id: 'brain', label: 'Brain', icon: Icons.psychology),
                Category(id: 'spinal_cord', label: 'Spinal Cord', icon: Icons.psychology),
                Category(id: 'meninges_ventricles', label: 'Meninges & Ventricles', icon: Icons.psychology),
              ],
            ),
            Category(
              id: 'peripheral_nervous_system_pns',
              label: 'Peripheral Nervous System (PNS)',
              icon: Icons.scatter_plot,
              imagePath: 'assets/images/systems/nervous_system/peripheral_nervous_system_pns.webp',
              subcategories: [
                Category(
                  id: 'cranial_nerves', 
                  label: 'Cranial Nerves', 
                  icon: Icons.scatter_plot,
                  imagePath: 'assets/images/systems/nervous_system/peripheral_nervous_system_pns/cranial_nerves.webp',
                ),
                Category(id: 'spinal_nerves', label: 'Spinal Nerves', icon: Icons.scatter_plot),
                Category(id: 'sensory_nerves', label: 'Sensory Nerves', icon: Icons.scatter_plot),
                Category(id: 'motor_nerves', label: 'Motor Nerves', icon: Icons.scatter_plot),
                Category(id: 'brachial_plexus', label: 'Brachial Plexus', icon: Icons.scatter_plot),
              ],
            ),
            Category(
              id: 'autonomic',
              label: 'Autonomic',
              icon: Icons.settings,
              imagePath: 'assets/images/systems/nervous_system/autonomic.webp',
              subcategories: [
                Category(id: 'sympathetic', label: 'Sympathetic', icon: Icons.settings),
                Category(id: 'parasympathetic', label: 'Parasympathetic', icon: Icons.settings),
                Category(id: 'enteric_nervous_system', label: 'Enteric Nervous System', icon: Icons.settings),
              ],
            ),
          ],
        ),
        Category(
          id: 'lumbosacral_plexus',
          label: 'Lumbosacral Plexus',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/systems/lumbosacral_plexus.webp',
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
          imagePath: 'assets/images/$animalId/skeleton/skull.webp',
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
              id: 'carpus',
              label: 'Carpus',
              icon: Icons.grid_view,
              subcategories: [
                Category(id: 'distal_row', label: 'Distal Row', icon: Icons.accessibility),
                Category(id: 'proximal_row', label: 'Proximal Row', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'antebrachium',
              label: 'Antebrachium',
              icon: Icons.grid_view,
              subcategories: [
                Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
                Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'brachium',
              label: 'Brachium',
              icon: Icons.grid_view,
              subcategories: [
                Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
              ],
            ),
            Category(
              id: 'manus',
              label: 'Manus',
              icon: Icons.pan_tool,
              subcategories: [
                Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
                Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
                Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
              ],
            ),
          ],
        ),
        Category(
          id: 'hindlimb', 
          label: 'Hindlimb', 
          icon: Icons.grid_view,
          subcategories: [
            Category(id: 'pelvis', label: 'Pelvis', icon: Icons.accessibility),
            Category(
              id: 'thigh',
              label: 'Thigh',
              icon: Icons.straighten,
              subcategories: [
                Category(id: 'femur', label: 'Femur', icon: Icons.accessibility),
                Category(id: 'patella', label: 'Patella', icon: Icons.accessibility),
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
                Category(id: 'metatarsals_i_v', label: 'Metatarsals I-V', icon: Icons.accessibility),
                Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
                Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
              ],
            ),
          ],
        ),
        Category(
          id: 'special_bones', 
          label: 'Special Bones', 
          icon: Icons.star,
          subcategories: [
            Category(id: 'os_penis_baculum', label: 'Os Penis', icon: Icons.star),
          ],
        ),
        Category(
          id: 'dentition', 
          label: 'Dentition', 
          icon: Icons.emoji_food_beverage,
          imagePath: 'assets/images/systems/dentition.webp',
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

  // Get sensory categories for a specific animal
  static List<Category> getSensoryCategoriesForAnimal(String animalId) {
    return [
      Category(
        id: 'vision',
        label: 'Vision',
        icon: Icons.visibility,
        subcategories: [
          Category(id: 'visual_system', label: 'Visual System', icon: Icons.visibility),
          Category(id: 'accessory_system', label: 'Accessory System', icon: Icons.visibility_off),
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
      Category(id: 'smell', label: 'Smell', icon: Icons.air),
      Category(id: 'taste', label: 'Taste', icon: Icons.emoji_food_beverage),
      Category(
        id: 'touch',
        label: 'Touch',
        icon: Icons.touch_app,
        subcategories: [
          Category(id: 'cutaneous', label: 'Cutaneous', icon: Icons.touch_app),
          Category(id: 'proprioceptive', label: 'Proprioceptive', icon: Icons.sensors),
        ],
      ),
    ];
  }

  // Get connective tissue categories for a specific animal
  static List<Category> getConnectiveTissueCategoriesForAnimal(String animalId) {
    return [
      Category(
        id: 'fascia',
        label: 'Fascia',
        icon: Icons.layers,
        imagePath: 'assets/images/connective_tissue/fascia.webp',
      ),
      Category(
        id: 'tendons',
        label: 'Tendons',
        icon: Icons.link,
        imagePath: 'assets/images/connective_tissue/tendons.webp',
      ),
      Category(
        id: 'ligaments',
        label: 'Ligaments',
        icon: Icons.link,
        imagePath: 'assets/images/connective_tissue/ligaments.webp',
      ),
      Category(
        id: 'cartilage',
        label: 'Cartilage',
        icon: Icons.layers,
        imagePath: 'assets/images/connective_tissue/cartilage.webp',
      ),
      Category(
        id: 'adipose_tissue',
        label: 'Adipose Tissue',
        icon: Icons.circle,
        imagePath: 'assets/images/connective_tissue/adipose_tissue.webp',
      ),
      Category(id: 'blood', label: 'Blood', icon: Icons.bloodtype),
      Category(id: 'lymph', label: 'Lymph', icon: Icons.water),
    ];
  }

  // Get organs categories for a specific animal
  static List<Category> getOrgansCategoriesForAnimal(String animalId) {
    return [
      Category(
        id: 'head',
        label: 'Head',
        icon: Icons.face,
        imagePath: 'assets/images/organs/head.webp',
        subcategories: [
          Category(
            id: 'eye',
            label: 'Eye',
            icon: Icons.visibility,
            imagePath: 'assets/images/organs/head/eye.webp',
          ),
          Category(
            id: 'ear',
            label: 'Ear',
            icon: Icons.hearing,
            imagePath: 'assets/images/organs/head/ear.webp',
          ),
          Category(
            id: 'nose',
            label: 'Nose',
            icon: Icons.hearing,
            imagePath: 'assets/images/organs/head/nose.webp',
          ),
          Category(
            id: 'brain',
            label: 'Brain',
            icon: Icons.hearing,
            imagePath: 'assets/images/organs/head/brain.webp',
          ),
        ],
      ),
      Category(
        id: 'neck',
        label: 'Neck',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/neck.webp',
        subcategories: [
          Category(
            id: 'pharynx',
            label: 'Pharynx',
            icon: Icons.mic,
            imagePath: 'assets/images/organs/neck/pharynx.webp',
          ),
          Category(
            id: 'larynx',
            label: 'Larynx',
            icon: Icons.mic,
            imagePath: 'assets/images/organs/neck/larynx.webp',
          ),
          Category(
            id: 'trachea',
            label: 'Trachea',
            icon: Icons.mic,
            imagePath: 'assets/images/organs/neck/trachea.webp',
          ),
          Category(
            id: 'esophagus',
            label: 'Esophagus',
            icon: Icons.mic,
            imagePath: 'assets/images/organs/neck/esophagus.webp',
          ),
        ],
      ),
      Category(
        id: 'thorax',
        label: 'Thorax',
        icon: Icons.accessibility,
        imagePath: 'assets/images/organs/thorax.webp',
        subcategories: [
          Category(
            id: 'thymus',
            label: 'Thymus',
            icon: Icons.favorite,
            imagePath: 'assets/images/organs/thorax/thymus.webp',
          ),
          Category(
            id: 'lungs',
            label: 'Lungs',
            icon: Icons.air,
            imagePath: 'assets/images/organs/thorax/lungs.webp',
          ),
          Category(
            id: 'diaphragm',
            label: 'Diaphragm',
            icon: Icons.air,
            imagePath: 'assets/images/organs/thorax/diaphragm.webp',
          ),
          Category(
            id: 'heart',
            label: 'Heart',
            icon: Icons.favorite,
            imagePath: 'assets/images/organs/thorax/heart.webp',
          ),
        ],
      ),
      Category(
        id: 'abdomen',
        label: 'Abdomen',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/abdomen.webp',
        subcategories: [
          Category(
            id: 'stomach',
            label: 'Stomach',
            icon: Icons.restaurant,
            imagePath: 'assets/images/organs/abdomen/stomach.webp',
          ),
          Category(
            id: 'gallbladder',
            label: 'Gallbladder',
            icon: Icons.opacity,
            imagePath: 'assets/images/organs/abdomen/gallbladder.webp',
          ),
          Category(
            id: 'liver',
            label: 'Liver',
            icon: Icons.local_hospital,
            imagePath: 'assets/images/organs/abdomen/liver.webp',
          ),
          Category(
            id: 'pancreas',
            label: 'Pancreas',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/abdomen/pancreas.webp',
          ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/abdomen/spleen.webp',
          ),
          Category(
            id: 'small_intestine',
            label: 'Small Intestine',
            icon: Icons.linear_scale,
            imagePath: 'assets/images/organs/abdomen/small_intestine.webp',
          ),
          Category(
            id: 'large_intestine',
            label: 'Large Intestine',
            icon: Icons.linear_scale,
            imagePath: 'assets/images/organs/abdomen/large_intestine.webp',
          ),
          Category(
            id: 'kidneys',
            label: 'Kidneys',
            icon: Icons.water_drop,
            imagePath: 'assets/images/organs/abdomen/kidneys.webp',
          ),
          Category(
            id: 'urinary_bladder',
            label: 'Urinary Bladder',
            icon: Icons.opacity,
            imagePath: 'assets/images/organs/abdomen/urinary_bladder.webp',
          ),
        ],
      ),
      Category(
        id: 'pelvis',
        label: 'Pelvis',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/pelvis.webp',
        subcategories: [
          Category(
            id: 'urethra',
            label: 'Urethra',
            icon: Icons.restaurant,
            imagePath: 'assets/images/organs/pelvis/urethra.webp',
          ),
          Category(
            id: 'anus',
            label: 'Anus',
            icon: Icons.opacity,
            imagePath: 'assets/images/organs/pelvis/anus.webp',
          ),
          Category(
            id: 'rectum',
            label: 'Rectum',
            icon: Icons.local_hospital,
            imagePath: 'assets/images/organs/pelvis/rectum.webp',
          ),
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/female.webp',
            subcategories: [
              Category(
                id: 'ovaries',
                label: 'Ovaries',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/ovaries.webp',
              ),
              Category(
                id: 'uterine_tubes',
                label: 'Uterine Tubes',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/uterine_tubes.webp',
              ),
              Category(
                id: 'uterus',
                label: 'Uterus',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/uterus.webp',
              ),
              Category(
                id: 'vagina',
                label: 'Vagina',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/male.webp',
            subcategories: [
              Category(
                id: 'sperm_duct',
                label: 'Sperm Duct',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/sperm_duct.webp',
              ),
              Category(
                id: 'epididymis',
                label: 'Epididymis',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/epididymis.webp',
              ),
              Category(
                id: 'testes',
                label: 'Testes',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/testes.webp',
              ),
            ],
          ),
        ],
      ),
    ];
  }

  // Get glands categories for a specific animal
  static List<Category> getGlandsCategoriesForAnimal(String animalId) {
    final categories = <Category>[];

    // Salivary glands
    List<Category> salivarySubcategories;
    if (animalId.toLowerCase() == 'dog') {
      salivarySubcategories = [
        Category(id: 'parotid_gland', label: 'Parotid Gland', icon: Icons.scatter_plot),
        Category(id: 'mandibular_gland', label: 'Mandibular Gland', icon: Icons.scatter_plot),
        Category(id: 'sublingual_gland', label: 'Sublingual Gland', icon: Icons.scatter_plot),
        Category(id: 'zygomatic_gland', label: 'Zygomatic Gland', icon: Icons.scatter_plot),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
      salivarySubcategories = [
        Category(id: 'parotid_gland', label: 'Parotid Gland', icon: Icons.scatter_plot),
        Category(id: 'mandibular_gland', label: 'Mandibular Gland', icon: Icons.scatter_plot),
        Category(id: 'sublingual_gland', label: 'Sublingual Gland', icon: Icons.scatter_plot),
        Category(id: 'buccal_gland', label: 'Buccal Gland', icon: Icons.scatter_plot),
      ];
    } else {
      salivarySubcategories = [
        Category(id: 'parotid_gland', label: 'Parotid Gland', icon: Icons.scatter_plot),
        Category(id: 'mandibular_gland', label: 'Mandibular Gland', icon: Icons.scatter_plot),
        Category(id: 'sublingual_gland', label: 'Sublingual Gland', icon: Icons.scatter_plot),
      ];
    }
    categories.add(Category(
      id: 'salivary',
      label: 'Salivary',
      icon: Icons.scatter_plot,
      subcategories: salivarySubcategories,
    ));

    // Ocular glands
    categories.add(Category(
      id: 'ocular',
      label: 'Ocular',
      icon: Icons.visibility,
      subcategories: [
        Category(id: 'lacrimal_gland', label: 'Lacrimal Gland', icon: Icons.visibility),
        Category(id: 'gland_of_the_third_eyelid', label: 'Gland of the Third Eyelid', icon: Icons.visibility),
        Category(id: 'meibomian_glands', label: 'Meibomian Glands', icon: Icons.visibility),
        Category(id: 'conjunctival_glands', label: 'Conjunctival Glands', icon: Icons.visibility),
      ],
    ));

    // Dermal glands
    categories.add(Category(
      id: 'dermal',
      label: 'Dermal',
      icon: Icons.layers,
      subcategories: [
        Category(id: 'sebaceous_glands', label: 'Sebaceous Glands', icon: Icons.layers),
        Category(id: 'sweat_glands', label: 'Sweat Glands', icon: Icons.layers),
        Category(id: 'eccrine_glands', label: 'Eccrine Glands', icon: Icons.layers),
      ],
    ));

    // Perianal glands (only for dog)
    if (animalId.toLowerCase() == 'dog') {
      categories.add(Category(
        id: 'perianal',
        label: 'Perianal',
        icon: Icons.scatter_plot,
        subcategories: [
          Category(id: 'anal_sacs', label: 'Anal Sacs', icon: Icons.scatter_plot),
          Category(id: 'perianal_glands', label: 'Perianal Glands', icon: Icons.scatter_plot),
        ],
      ));
    }

    // Mammary glands
    List<Category> mammarySubcategories;
    if (animalId.toLowerCase() == 'dog') {
      mammarySubcategories = [
        Category(id: 'bitch', label: 'Bitch', icon: Icons.scatter_plot),
        Category(id: 'dog', label: 'Dog', icon: Icons.scatter_plot),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
      mammarySubcategories = [
        Category(id: 'mare', label: 'Mare', icon: Icons.scatter_plot),
        Category(id: 'stallion', label: 'Stallion', icon: Icons.scatter_plot),
      ];
    } else {
      mammarySubcategories = [
        Category(id: 'female', label: 'Female', icon: Icons.scatter_plot),
        Category(id: 'male', label: 'Male', icon: Icons.scatter_plot),
      ];
    }
    categories.add(Category(
      id: 'mammary',
      label: 'Mammary',
      icon: Icons.scatter_plot,
      subcategories: mammarySubcategories,
    ));

    return categories;
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
        id: 'muscles',
        label: 'Muscles',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/$animalId/muscles.webp',
        subcategories: getMusclesCategoriesForAnimal(animalId),
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

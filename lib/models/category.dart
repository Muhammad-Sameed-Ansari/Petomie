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
          imagePath: 'assets/images/$animal/energy/meridians/primary_meridian.webp',
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
          imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian.webp',
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
    final categories = <Category>[];

    // Abdominal muscles - different for each animal
    List<Category> abdominalSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      abdominalSubcategories = [
        Category(
          id: 'central',
          label: 'Central',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/central.webp',
        ),
        Category(
          id: 'middle_layer',
          label: 'Middle Layer',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/middle_layer.webp',
        ),
        Category(
          id: 'superficial_layer',
          label: 'Superficial Layer',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/superficial_layer.webp',
        ),
        Category(
          id: 'ventral',
          label: 'Ventral',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/ventral.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      abdominalSubcategories = [
        Category(
          id: 'central',
          label: 'Central',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/central.webp',
        ),
        Category(
          id: 'deep_layer',
          label: 'Deep Layer',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/deep_layer.webp',
        ),
        Category(
          id: 'middle_layer',
          label: 'Middle Layer',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/middle_layer.webp',
        ),
        Category(
          id: 'superficial_layer',
          label: 'Superficial Layer',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/superficial_layer.webp',
        ),
        Category(
          id: 'ventral',
          label: 'Ventral',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/abdominal/ventral.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'abdominal',
      label: 'Abdominal',
      icon: Icons.fitness_center,
      imagePath: 'assets/images/muscles/abdominal.webp',
      subcategories: abdominalSubcategories,
    ));

    // Back muscles - different naming for bird
    List<Category> backSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      backSubcategories = [
        Category(
          id: 'deep',
          label: 'Deep',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/back/deep.webp',
        ),
        Category(
          id: 'intermediate',
          label: 'Intermediate',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/back/intermediate.webp',
        ),
        Category(
          id: 'superficial',
          label: 'Superficial',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/back/superficial.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      backSubcategories = [
        Category(
          id: 'deep_layer_core_stability',
          label: 'Deep Layer Core Stability',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/back/deep_layer_core_stability.webp',
        ),
        Category(
          id: 'intermediate_layer_force_transmission',
          label: 'Intermediate Layer Force Transmission',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/back/intermediate_layer_force_transmission.webp',
        ),
        Category(
          id: 'superficial_layer_movement_power',
          label: 'Superficial Layer Movement Power',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/back/superficial_layer_movement_power.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'back',
      label: 'Back',
      icon: Icons.fitness_center,
      imagePath: 'assets/images/muscles/back.webp',
      subcategories: backSubcategories,
    ));

    // Cutaneous muscles - single file for all animals
    categories.add(Category(
      id: 'cutaneous',
      label: 'Cutaneous',
      icon: Icons.fitness_center,
      imagePath: 'assets/images/muscles/cutaneous.webp',
    ));

    // Forelimb/Wing muscles - different for bird
    if (animalId.toLowerCase() == 'bird') {
      categories.add(Category(
        id: 'wing',
        label: 'Wing',
        icon: Icons.flight,
        imagePath: 'assets/images/muscles/wing.webp',
        subcategories: [
          Category(
            id: 'antebrachium_muscles',
            label: 'Antebrachium Muscles',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/wing/antebrachium_muscles.webp',
          ),
          Category(
            id: 'brachium_muscles',
            label: 'Brachium Muscles',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/wing/brachium_muscles.webp',
          ),
          Category(
            id: 'manus_muscles',
            label: 'Manus Muscles',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/wing/manus_muscles.webp',
          ),
          Category(
            id: 'shoulder_muscles',
            label: 'Shoulder Muscles',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/wing/shoulder_muscles.webp',
          ),
        ],
      ));
    } else {
      categories.add(Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/forelimb.webp',
        subcategories: [
          Category(
            id: 'antebrachium',
            label: 'Antebrachium',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/forelimb/antebrachium.webp',
          ),
          Category(
            id: 'brachium',
            label: 'Brachium',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/forelimb/brachium.webp',
          ),
          Category(
            id: 'manus',
            label: 'Manus',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/forelimb/manus.webp',
          ),
          Category(
            id: 'shoulder',
            label: 'Shoulder',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/forelimb/shoulder.webp',
          ),
        ],
      ));
    }

    // Head & Neck muscles - common for all animals
    categories.add(Category(
          id: 'head_neck',
          label: 'Head & Neck',
          icon: Icons.face,
      imagePath: 'assets/images/muscles/head_neck.webp',
          subcategories: [
        Category(
          id: 'fascial',
          label: 'Fascial',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/head_neck/fascial.webp',
        ),
        Category(
          id: 'mastication',
          label: 'Mastication',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/head_neck/mastication.webp',
        ),
        Category(
          id: 'neck',
          label: 'Neck',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/head_neck/neck.webp',
        ),
      ],
    ));

    // Hindlimb muscles - different files for different animals
    List<Category> hindlimbSubcategories;
    if (animalId.toLowerCase() == 'horse' || animalId.toLowerCase() == 'bird') {
      hindlimbSubcategories = [
        Category(
          id: 'crus',
          label: 'Crus',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/hindlimb/crus.webp',
        ),
        Category(
          id: 'hip_thigh',
          label: 'Hip & Thigh',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/hindlimb/hip_thigh.webp',
        ),
        Category(
          id: 'pes',
          label: 'Pes',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/hindlimb/pes.webp',
        ),
      ];
    } else {
      // Dog and cat have 'cess' instead of 'pes'
      hindlimbSubcategories = [
        Category(
          id: 'cess',
          label: 'Cess',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/hindlimb/cess.webp',
        ),
        Category(
          id: 'crus',
          label: 'Crus',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/hindlimb/crus.webp',
        ),
        Category(
          id: 'hip_thigh',
          label: 'Hip & Thigh',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/hindlimb/hip_thigh.webp',
        ),
      ];
    }
    categories.add(Category(
          id: 'hindlimb',
          label: 'Hindlimb',
          icon: Icons.fitness_center,
      imagePath: 'assets/images/muscles/hindlimb.webp',
      subcategories: hindlimbSubcategories,
    ));

    // Pectoral muscles - folder for most animals, single file for bird
    if (animalId.toLowerCase() == 'bird') {
      categories.add(Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pectoral.webp',
      ));
    } else {
      categories.add(Category(
        id: 'pectoral',
        label: 'Pectoral',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/pectoral.webp',
          subcategories: [
          Category(
            id: 'deep',
            label: 'Deep',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/pectoral/deep.webp',
          ),
          Category(
            id: 'superficial',
            label: 'Superficial',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/pectoral/superficial.webp',
          ),
        ],
      ));
    }

    // Perineal muscles - single file for horse, dog, and cat (not bird)
    if (animalId.toLowerCase() != 'bird') {
      categories.add(Category(
        id: 'perineal',
        label: 'Perineal',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/perineal.webp',
      ));
    }

    // Respiration muscles - common structure for all animals
    List<Category> respirationSubcategories = [
      Category(
        id: 'expiratory',
        label: 'Expiratory',
        icon: Icons.air,
        imagePath: 'assets/images/muscles/respiration/expiratory.webp',
        subcategories: [
          Category(
            id: 'abdominal_muscles_respiration',
            label: 'Abdominal Muscles Respiration',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/expiratory/abdominal_muscles_respiration.webp',
          ),
          Category(
            id: 'internal_intercostal',
            label: 'Internal Intercostal',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/expiratory/internal_intercostal.webp',
          ),
          Category(
            id: 'serratus_dorsalis_caudalis',
            label: 'Serratus Dorsalis Caudalis',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/expiratory/serratus_dorsalis_caudalis.webp',
          ),
          Category(
            id: 'transversus_thoracis',
            label: 'Transversus Thoracis',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/expiratory/transversus_thoracis.webp',
          ),
        ],
      ),
      Category(
        id: 'inspiratory',
        label: 'Inspiratory',
        icon: Icons.air,
        imagePath: 'assets/images/muscles/respiration/inspiratory.webp',
        subcategories: animalId.toLowerCase() == 'bird' ? [
          Category(
            id: 'external_intercostal',
            label: 'External Intercostal',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/external_intercostal.webp',
          ),
          Category(
            id: 'rectus_thoracis',
            label: 'Rectus Thoracis',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/rectus_thoracis.webp',
          ),
          Category(
            id: 'scalenus',
            label: 'Scalenus',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/scalenus.webp',
          ),
          Category(
            id: 'serratus_dorsalis_cranialis',
            label: 'Serratus Dorsalis Cranialis',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/serratus_dorsalis_cranialis.webp',
          ),
          Category(
            id: 'sternal_pump_air_sac_ventilation',
            label: 'Sternal Pump Air Sac Ventilation',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/sternal_pump_air_sac_ventilation.webp',
          ),
        ] : [
          Category(
            id: 'diaphragm',
            label: 'Diaphragm',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/diaphragm.webp',
          ),
          Category(
            id: 'external_intercostal',
            label: 'External Intercostal',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/external_intercostal.webp',
          ),
          Category(
            id: 'rectus_thoracis',
            label: 'Rectus Thoracis',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/rectus_thoracis.webp',
          ),
          Category(
            id: 'scalenus',
            label: 'Scalenus',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/scalenus.webp',
          ),
          Category(
            id: 'serratus_dorsalis_cranialis',
            label: 'Serratus Dorsalis Cranialis',
            icon: Icons.fitness_center,
            imagePath: 'assets/images/muscles/respiration/inspiratory/serratus_dorsalis_cranialis.webp',
          ),
        ],
      ),
    ];
    categories.add(Category(
      id: 'respiration',
      label: 'Respiration',
      icon: Icons.air,
      imagePath: 'assets/images/muscles/respiration.webp',
      subcategories: respirationSubcategories,
    ));

    // Stay apparatus - only for horse
    if (animalId.toLowerCase() == 'horse') {
      categories.add(Category(
        id: 'stay_apparatus',
        label: 'Stay Apparatus',
        icon: Icons.fitness_center,
        imagePath: 'assets/images/muscles/stay_apparatus.webp',
      ));
    }

    // Tail muscles - common for all animals
    categories.add(Category(
      id: 'tail',
      label: 'Tail',
      icon: Icons.pets,
      imagePath: 'assets/images/muscles/tail.webp',
      subcategories: [
        Category(
          id: 'deep_muscles',
          label: 'Deep Muscles',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/tail/deep_muscles.webp',
        ),
        Category(
          id: 'surface_muscles',
          label: 'Surface Muscles',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/tail/surface_muscles.webp',
        ),
        Category(
          id: 'tail_muscles',
          label: 'Tail Muscles',
          icon: Icons.fitness_center,
          imagePath: 'assets/images/muscles/tail/tail_muscles.webp',
        ),
      ],
    ));

    // Throat muscles - single file for all animals
    categories.add(Category(
      id: 'throat',
      label: 'Throat',
      icon: Icons.restaurant,
      imagePath: 'assets/images/muscles/throat.webp',
    ));

    return categories;
  }

  // Get body systems categories for a specific animal
  // Helper function to convert system ID to proper label
  static String _systemIdToLabel(String id) {
    final words = id.split('_');
    return words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  // Helper function to get icon for system type
  static IconData _getSystemIcon(String systemId) {
    switch (systemId) {
      case 'cardiovascular_system':
      case 'cariovascular_system':
      case 'cardiocascular_system':
        return Icons.bloodtype;
      case 'respiratory_system':
        return Icons.air;
      case 'digestive_system':
      case 'digestive _system':
        return Icons.restaurant;
      case 'urinary_system':
        return Icons.water_drop;
      case 'reproductive_system':
        return Icons.favorite;
      case 'endocrine_system':
      case 'endocrine _system':
        return Icons.scatter_plot;
      case 'lymphatic_system':
        return Icons.water;
      case 'nervous_system':
        return Icons.psychology;
      case 'integumentary_system':
        return Icons.layers;
      case 'hepatobiliary_system':
        return Icons.local_hospital;
      case 'lumbosacral_plexus':
        return Icons.linear_scale;
      case 'cranial_nerves':
        return Icons.psychology;
      case 'brachial_plexus_c6_t2':
        return Icons.linear_scale;
      case 'regional_lymph_nodes':
        return Icons.water;
      default:
        return Icons.category;
    }
  }

  static List<Category> getSystemsCategoriesForAnimal(String animalId) {
    switch (animalId.toLowerCase()) {
      case 'horse':
        return _getHorseSystemsCategories();
      case 'dog':
        return _getDogSystemsCategories();
      case 'cat':
        return _getCatSystemsCategories();
      case 'bird':
        return _getBirdSystemsCategories();
      default:
        // Default body systems categories for other animals
        return bodySystemsCategories;
    }
  }

  static List<Category> _getHorseSystemsCategories() {
    return [
      // Cardiovascular System
      Category(
        id: 'cardiovascular_system',
        label: 'Cardiovascular System',
        icon: Icons.bloodtype,
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: 'Arteries', icon: Icons.check_circle),
          Category(id: 'capillaries', label: 'Capillaries', icon: Icons.linear_scale),
          Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
          Category(id: 'veins', label: 'Veins', icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves (standalone)
      Category(
        id: 'cranial_nerves',
        label: 'Cranial Nerves',
        icon: Icons.psychology,
      ),
      // Digestive System
      Category(
        id: 'digestive _system',
        label: 'Digestive System',
        icon: Icons.restaurant,
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: 'Lower Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'anus', label: 'Anus', icon: Icons.air),
              Category(id: 'large_intestine', label: 'Large Intestine', icon: Icons.air),
              Category(id: 'liver', label: 'Liver', icon: Icons.air),
              Category(id: 'pancreas', label: 'Pancreas', icon: Icons.air),
              Category(id: 'rectum', label: 'Rectum', icon: Icons.air),
              Category(id: 'small_intestine', label: 'Small Intestine', icon: Icons.air),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: 'Upper Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'esophagus', label: 'Esophagus', icon: Icons.air),
              Category(id: 'mouth', label: 'Mouth', icon: Icons.air),
              Category(id: 'pharynx', label: 'Pharynx', icon: Icons.air),
              Category(id: 'salivary_glands', label: 'Salivary Glands', icon: Icons.air),
              Category(id: 'stomach', label: 'Stomach', icon: Icons.air),
              Category(id: 'teeth', label: 'Teeth', icon: Icons.air),
              Category(id: 'tongue', label: 'Tongue', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine _system',
        label: 'Endocrine System',
        icon: Icons.scatter_plot,
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: 'Adrenal Glands', icon: Icons.scatter_plot),
          Category(id: 'endocrine_axis', label: 'Endocrine Axis', icon: Icons.scatter_plot),
          Category(id: 'gonads', label: 'Gonads', icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: 'Hypothalamus', icon: Icons.scatter_plot),
          Category(id: 'pancreatic_islets', label: 'Pancreatic Islets', icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: 'Parathyroid Glands', icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: 'Pineal Gland', icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: 'Pituitary', icon: Icons.scatter_plot),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: 'Thyroid Gland', icon: Icons.scatter_plot),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: 'Hepatobiliary System',
        icon: Icons.local_hospital,
        subcategories: [
          Category(id: 'bile_ducts', label: 'Bile Ducts', icon: Icons.linear_scale),
          Category(id: 'duodenal_entry', label: 'Duodenal Entry', icon: Icons.air),
          Category(id: 'liver', label: 'Liver', icon: Icons.air),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: 'Integumentary System',
        icon: Icons.layers,
        subcategories: [
          Category(id: 'dermis', label: 'Dermis', icon: Icons.layers),
          Category(id: 'epidermis', label: 'Epidermis', icon: Icons.layers),
          Category(id: 'glands', label: 'Glands', icon: Icons.scatter_plot),
          Category(id: 'hair_coat', label: 'Hair Coat', icon: Icons.brush),
          Category(id: 'hair_follicle_receptors', label: 'Hair Follicle Receptors', icon: Icons.sensors),
          Category(id: 'hypodermis', label: 'Hypodermis', icon: Icons.layers),
          Category(id: 'mane_tail', label: 'Mane Tail', icon: Icons.brush),
          Category(id: 'pigmentation_color_patterns', label: 'Pigmentation Color Patterns', icon: Icons.palette),
          Category(id: 'protective_structures', label: 'Protective Structures', icon: Icons.shield),
          Category(id: 'whiskers_vibrissae', label: 'Whiskers Vibrissae', icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: 'Lumbosacral Plexus',
        icon: Icons.linear_scale,
        subcategories: [
          Category(id: 'lumbosacral_plexus', label: 'Lumbosacral Plexus', icon: Icons.linear_scale),
          Category(id: 'major_nerves_femoral_obturator_sciatic_pudendal', label: 'Major Nerves Femoral Obturator Sciatic Pudendal', icon: Icons.linear_scale),
          Category(id: 'sacral_plexus_l5_s5', label: 'Sacral Plexus L5 S5', icon: Icons.linear_scale),
        ],
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: 'Lymphatic System',
        icon: Icons.water,
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'lymph_fluid', label: 'Lymph Fluid', icon: Icons.water),
          Category(id: 'lymph_nodes', label: 'Lymph Nodes', icon: Icons.water),
          Category(id: 'lymphatic_vessel', label: 'Lymphatic Vessel', icon: Icons.water),
          Category(id: 'spleen', label: 'Spleen', icon: Icons.water),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.water),
          Category(id: 'tonsils', label: 'Tonsils', icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: 'Nervous System',
        icon: Icons.psychology,
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: 'Autonomic',
            icon: Icons.settings,
            subcategories: [
              Category(id: 'enteric_nervous_system', label: 'Enteric Nervous System', icon: Icons.settings),
              Category(id: 'parasympathetic', label: 'Parasympathetic', icon: Icons.settings),
              Category(id: 'sympathetic', label: 'Sympathetic', icon: Icons.settings),
            ],
          ),
          Category(
            id: 'nervous_system_cns',
            label: 'Nervous System (CNS)',
            icon: Icons.psychology,
            subcategories: [
              Category(id: 'brain', label: 'Brain', icon: Icons.psychology),
              Category(id: 'meninges_ventricles', label: 'Meninges Ventricles', icon: Icons.psychology),
              Category(id: 'spinal_cord', label: 'Spinal Cord', icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'peripheral_nervous_system_pns',
            label: 'Peripheral Nervous System (PNS)',
            icon: Icons.scatter_plot,
            subcategories: [
              Category(id: 'brachial_plexus', label: 'Brachial Plexus', icon: Icons.scatter_plot),
              Category(id: 'cranial_nerves', label: 'Cranial Nerves', icon: Icons.scatter_plot),
              Category(id: 'motor_nerves', label: 'Motor Nerves', icon: Icons.scatter_plot),
              Category(id: 'sensory_nerves', label: 'Sensory Nerves', icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: 'Spinal Nerves', icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: 'Reproductive System',
        icon: Icons.favorite,
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(id: 'cervix', label: 'Cervix', icon: Icons.circle),
              Category(id: 'external_genitalia', label: 'External Genitalia', icon: Icons.crop_portrait),
              Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              Category(id: 'ovaries', label: 'Ovaries', icon: Icons.circle),
              Category(id: 'Placenta_Horse', label: 'Placenta Horse', icon: Icons.favorite),
              Category(id: 'placenta', label: 'Placenta', icon: Icons.favorite),
              Category(id: 'uterine_tubes', label: 'Uterine Tubes', icon: Icons.linear_scale),
              Category(id: 'uterus', label: 'Uterus', icon: Icons.favorite),
              Category(id: 'vagina', label: 'Vagina', icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(id: 'accessory_glands', label: 'Accessory Glands', icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: 'Epididymis', icon: Icons.circle),
              Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              Category(id: 'penis', label: 'Penis', icon: Icons.scatter_plot),
              Category(id: 'prepuce', label: 'Prepuce', icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: 'Sperm Duct', icon: Icons.linear_scale),
              Category(id: 'testes', label: 'Testes', icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: 'Respiratory System',
        icon: Icons.air,
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(id: 'lower_airways', label: 'Lower Airways', icon: Icons.air),
          Category(id: 'upper_airways', label: 'Upper Airways', icon: Icons.air),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: 'Urinary System',
        icon: Icons.water_drop,
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
          Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
          Category(id: 'urethra', label: 'Urethra', icon: Icons.linear_scale),
          Category(id: 'urinary_bladder', label: 'Urinary Bladder', icon: Icons.opacity),
        ],
      ),
    ];
  }

  static List<Category> _getDogSystemsCategories() {
    return [
      // Brachial Plexus (standalone)
      Category(
        id: 'brachial_plexus_c6_t2',
        label: 'Brachial Plexus C6 T2',
        icon: Icons.linear_scale,
      ),
      // Cardiovascular System
      Category(
        id: 'cardiovascular_system',
        label: 'Cardiovascular System',
        icon: Icons.bloodtype,
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: 'Arteries', icon: Icons.check_circle),
          Category(id: 'capillaries', label: 'Capillaries', icon: Icons.linear_scale),
          Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
          Category(id: 'veins', label: 'Veins', icon: Icons.linear_scale),
        ],
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: 'Digestive System',
        icon: Icons.restaurant,
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: 'Lower Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'anus', label: 'Anus', icon: Icons.air),
              Category(id: 'gallbladder', label: 'Gallbladder', icon: Icons.air),
              Category(id: 'liver', label: 'Liver', icon: Icons.air),
              Category(id: 'pancreas', label: 'Pancreas', icon: Icons.air),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: 'Upper Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'esophagus', label: 'Esophagus', icon: Icons.air),
              Category(id: 'large_intestine', label: 'Large Intestine', icon: Icons.air),
              Category(id: 'mouth', label: 'Mouth', icon: Icons.air),
              Category(id: 'pharynx', label: 'Pharynx', icon: Icons.air),
              Category(id: 'rectum', label: 'Rectum', icon: Icons.air),
              Category(id: 'salivary_glands', label: 'Salivary Glands', icon: Icons.air),
              Category(id: 'small_intestine', label: 'Small Intestine', icon: Icons.air),
              Category(id: 'stomach', label: 'Stomach', icon: Icons.air),
              Category(id: 'teeth', label: 'Teeth', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: 'Endocrine System',
        icon: Icons.scatter_plot,
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: 'Adrenal Glands', icon: Icons.scatter_plot),
          Category(id: 'endocrine_axis', label: 'Endocrine Axis', icon: Icons.scatter_plot),
          Category(id: 'gonads', label: 'Gonads', icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: 'Hypothalamus', icon: Icons.scatter_plot),
          Category(id: 'pancreatic_islets', label: 'Pancreatic Islets', icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: 'Parathyroid Glands', icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: 'Pineal Gland', icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: 'Pituitary', icon: Icons.scatter_plot),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: 'Thyroid Gland', icon: Icons.scatter_plot),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: 'Integumentary System',
        icon: Icons.layers,
        subcategories: [
          Category(id: 'dermis', label: 'Dermis', icon: Icons.layers),
          Category(id: 'epidermis', label: 'Epidermis', icon: Icons.layers),
          Category(id: 'glands', label: 'Glands', icon: Icons.scatter_plot),
          Category(id: 'hair_coat', label: 'Hair Coat', icon: Icons.brush),
          Category(id: 'hair_follicle_receptors', label: 'Hair Follicle Receptors', icon: Icons.sensors),
          Category(id: 'hypodermis', label: 'Hypodermis', icon: Icons.layers),
          Category(id: 'pigmentation_color_patterns', label: 'Pigmentation Color Patterns', icon: Icons.palette),
          Category(id: 'protective_structures', label: 'Protective Structures', icon: Icons.shield),
          Category(id: 'whiskers_vibrissae', label: 'Whiskers Vibrissae', icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus (standalone)
      Category(
        id: 'lumbosacral_plexus',
        label: 'Lumbosacral Plexus',
        icon: Icons.linear_scale,
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: 'Lymphatic System',
        icon: Icons.water,
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'lymph_fluid', label: 'Lymph Fluid', icon: Icons.water),
          Category(id: 'lymph_nodes', label: 'Lymph Nodes', icon: Icons.water),
          Category(id: 'lymphatic_vessel', label: 'Lymphatic Vessel', icon: Icons.water),
          Category(id: 'spleen', label: 'Spleen', icon: Icons.water),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.water),
          Category(id: 'tonsils', label: 'Tonsils', icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: 'Nervous System',
        icon: Icons.psychology,
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: 'Autonomic',
            icon: Icons.settings,
            subcategories: [
              Category(id: 'enteric_nervous_system', label: 'Enteric Nervous System', icon: Icons.settings),
              Category(id: 'parasympathetic', label: 'Parasympathetic', icon: Icons.settings),
              Category(id: 'sympathetic', label: 'Sympathetic', icon: Icons.settings),
            ],
          ),
          Category(
            id: 'nervous_system_cns',
            label: 'Nervous System (CNS)',
            icon: Icons.psychology,
            subcategories: [
              Category(id: 'brain', label: 'Brain', icon: Icons.psychology),
              Category(id: 'meninges_ventricles', label: 'Meninges Ventricles', icon: Icons.psychology),
              Category(id: 'spinal_cord', label: 'Spinal Cord', icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'peripheral_nervous_system_pns',
            label: 'Peripheral Nervous System (PNS)',
            icon: Icons.scatter_plot,
            subcategories: [
              Category(id: 'brachial_plexus', label: 'Brachial Plexus', icon: Icons.scatter_plot),
              Category(id: 'cranial_nerves', label: 'Cranial Nerves', icon: Icons.scatter_plot),
              Category(id: 'motor_nerves', label: 'Motor Nerves', icon: Icons.scatter_plot),
              Category(id: 'sensory_nerves', label: 'Sensory Nerves', icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: 'Spinal Nerves', icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Regional Lymph Nodes (standalone)
      Category(
        id: 'regional_lymph_nodes',
        label: 'Regional Lymph Nodes',
        icon: Icons.water,
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: 'Reproductive System',
        icon: Icons.favorite,
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(id: 'cervix', label: 'Cervix', icon: Icons.circle),
              Category(id: 'external_genitalia', label: 'External Genitalia', icon: Icons.crop_portrait),
              Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              Category(id: 'ovaries', label: 'Ovaries', icon: Icons.circle),
              Category(id: 'placenta', label: 'Placenta', icon: Icons.favorite),
              Category(id: 'uterine_tubes', label: 'Uterine Tubes', icon: Icons.linear_scale),
              Category(id: 'uterus', label: 'Uterus', icon: Icons.favorite),
              Category(id: 'vagina', label: 'Vagina', icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(id: 'accessory_glands', label: 'Accessory Glands', icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: 'Epididymis', icon: Icons.circle),
              Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              Category(id: 'penis', label: 'Penis', icon: Icons.scatter_plot),
              Category(id: 'prepuce', label: 'Prepuce', icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: 'Sperm Duct', icon: Icons.linear_scale),
              Category(id: 'testes', label: 'Testes', icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: 'Respiratory System',
        icon: Icons.air,
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(id: 'lower_airways', label: 'Lower Airways', icon: Icons.air),
          Category(id: 'upper_airways', label: 'Upper Airways', icon: Icons.air),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: 'Urinary System',
        icon: Icons.water_drop,
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
          Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
          Category(id: 'urethra', label: 'Urethra', icon: Icons.linear_scale),
          Category(id: 'urinary_bladder', label: 'Urinary Bladder', icon: Icons.opacity),
        ],
      ),
    ];
  }

  static List<Category> _getCatSystemsCategories() {
    return [
      // Cardiovascular System (note: typo in folder name)
      Category(
        id: 'cariovascular_system',
        label: 'Cardiovascular System',
        icon: Icons.bloodtype,
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: 'Arteries', icon: Icons.check_circle),
          Category(id: 'capillaries', label: 'Capillaries', icon: Icons.linear_scale),
          Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
          Category(id: 'veins', label: 'Veins', icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves (standalone)
      Category(
        id: 'cranial_nerves',
        label: 'Cranial Nerves',
        icon: Icons.psychology,
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: 'Digestive System',
        icon: Icons.restaurant,
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: 'Lower Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'anus', label: 'Anus', icon: Icons.air),
              Category(id: 'esophagus', label: 'Esophagus', icon: Icons.air),
              Category(id: 'gallbladder', label: 'Gallbladder', icon: Icons.air),
              Category(id: 'large_intestine', label: 'Large Intestine', icon: Icons.air),
              Category(id: 'liver', label: 'Liver', icon: Icons.air),
              Category(id: 'mouth', label: 'Mouth', icon: Icons.air),
              Category(id: 'pancreas', label: 'Pancreas', icon: Icons.air),
              Category(id: 'pharynx', label: 'Pharynx', icon: Icons.air),
              Category(id: 'rectum', label: 'Rectum', icon: Icons.air),
              Category(id: 'salivary_glands', label: 'Salivary Glands', icon: Icons.air),
              Category(id: 'small_intestine', label: 'Small Intestine', icon: Icons.air),
              Category(id: 'stomach', label: 'Stomach', icon: Icons.air),
              Category(id: 'teeth', label: 'Teeth', icon: Icons.air),
              Category(id: 'tongue', label: 'Tongue', icon: Icons.air),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: 'Upper Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: 'Endocrine System',
        icon: Icons.scatter_plot,
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: 'Adrenal Glands', icon: Icons.scatter_plot),
          Category(id: 'endocrine_axis', label: 'Endocrine Axis', icon: Icons.scatter_plot),
          Category(id: 'gonads', label: 'Gonads', icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: 'Hypothalamus', icon: Icons.scatter_plot),
          Category(id: 'pancreatic_islets', label: 'Pancreatic Islets', icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: 'Parathyroid Glands', icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: 'Pineal Gland', icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: 'Pituitary', icon: Icons.scatter_plot),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: 'Thyroid Gland', icon: Icons.scatter_plot),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: 'Integumentary System',
        icon: Icons.layers,
        subcategories: [
          Category(id: 'dermis', label: 'Dermis', icon: Icons.layers),
          Category(id: 'epidermis', label: 'Epidermis', icon: Icons.layers),
          Category(id: 'glands', label: 'Glands', icon: Icons.scatter_plot),
          Category(id: 'hair_coat', label: 'Hair Coat', icon: Icons.brush),
          Category(id: 'hair_follicle_receptors', label: 'Hair Follicle Receptors', icon: Icons.sensors),
          Category(id: 'hypodermis', label: 'Hypodermis', icon: Icons.layers),
          Category(id: 'pigmentation_color_patterns', label: 'Pigmentation Color Patterns', icon: Icons.palette),
          Category(id: 'protective_structures', label: 'Protective Structures', icon: Icons.shield),
          Category(id: 'whiskers_vibrissae', label: 'Whiskers Vibrissae', icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus (standalone)
      Category(
        id: 'lumbosacral_plexus',
        label: 'Lumbosacral Plexus',
        icon: Icons.linear_scale,
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: 'Lymphatic System',
        icon: Icons.water,
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'lymph_fluid', label: 'Lymph Fluid', icon: Icons.water),
          Category(id: 'lymph_nodes', label: 'Lymph Nodes', icon: Icons.water),
          Category(id: 'lymphatic_vessel', label: 'Lymphatic Vessel', icon: Icons.water),
          Category(id: 'spleen', label: 'Spleen', icon: Icons.water),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.water),
          Category(id: 'tonsils', label: 'Tonsils', icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: 'Nervous System',
        icon: Icons.psychology,
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: 'Autonomic',
            icon: Icons.settings,
            subcategories: [
              Category(id: 'enteric_nervous_system', label: 'Enteric Nervous System', icon: Icons.settings),
              Category(id: 'parasympathetic', label: 'Parasympathetic', icon: Icons.settings),
              Category(id: 'sympathetic', label: 'Sympathetic', icon: Icons.settings),
            ],
          ),
          Category(
            id: 'nervous_system_cns',
            label: 'Nervous System (CNS)',
            icon: Icons.psychology,
            subcategories: [
              Category(id: 'brain', label: 'Brain', icon: Icons.psychology),
              Category(id: 'meninges_ventricles', label: 'Meninges Ventricles', icon: Icons.psychology),
              Category(id: 'spinal_cord', label: 'Spinal Cord', icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'peripheral_nervous_system_pns',
            label: 'Peripheral Nervous System (PNS)',
            icon: Icons.scatter_plot,
            subcategories: [
              Category(id: 'brachial_plexus', label: 'Brachial Plexus', icon: Icons.scatter_plot),
              Category(id: 'cranial_nerves', label: 'Cranial Nerves', icon: Icons.scatter_plot),
              Category(id: 'motor_nerves', label: 'Motor Nerves', icon: Icons.scatter_plot),
              Category(id: 'sensory_nerves', label: 'Sensory Nerves', icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: 'Spinal Nerves', icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: 'Reproductive System',
        icon: Icons.favorite,
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(id: 'cervix', label: 'Cervix', icon: Icons.circle),
              Category(id: 'external_genitalia', label: 'External Genitalia', icon: Icons.crop_portrait),
              Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              Category(id: 'ovaries', label: 'Ovaries', icon: Icons.circle),
              Category(id: 'placenta', label: 'Placenta', icon: Icons.favorite),
              Category(id: 'uterine_tubes', label: 'Uterine Tubes', icon: Icons.linear_scale),
              Category(id: 'uterus', label: 'Uterus', icon: Icons.favorite),
              Category(id: 'vagina', label: 'Vagina', icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(id: 'accessory_glands', label: 'Accessory Glands', icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: 'Epididymis', icon: Icons.circle),
              Category(id: 'mammary_glands', label: 'Mammary Glands', icon: Icons.scatter_plot),
              Category(id: 'penis', label: 'Penis', icon: Icons.scatter_plot),
              Category(id: 'prepuce', label: 'Prepuce', icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: 'Sperm Duct', icon: Icons.linear_scale),
              Category(id: 'testes', label: 'Testes', icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: 'Respiratory System',
        icon: Icons.air,
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(id: 'lower_airways', label: 'Lower Airways', icon: Icons.air),
          Category(id: 'upper_airways', label: 'Upper Airways', icon: Icons.air),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: 'Urinary System',
        icon: Icons.water_drop,
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
          Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
          Category(id: 'urethra', label: 'Urethra', icon: Icons.linear_scale),
          Category(id: 'urinary_bladder', label: 'Urinary Bladder', icon: Icons.opacity),
        ],
      ),
    ];
  }

  static List<Category> _getBirdSystemsCategories() {
    return [
      // Cardiovascular System (note: typo in folder name)
      Category(
        id: 'cardiocascular_system',
        label: 'Cardiovascular System',
        icon: Icons.bloodtype,
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: 'Arteries', icon: Icons.check_circle),
          Category(id: 'capillaries', label: 'Capillaries', icon: Icons.linear_scale),
          Category(id: 'heart', label: 'Heart', icon: Icons.favorite),
          Category(id: 'veins', label: 'Veins', icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves (standalone)
      Category(
        id: 'cranial_nerves',
        label: 'Cranial Nerves',
        icon: Icons.psychology,
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: 'Digestive System',
        icon: Icons.restaurant,
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: 'Lower Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'ceca', label: 'Ceca', icon: Icons.air),
              Category(id: 'cloaca', label: 'Cloaca', icon: Icons.air),
              Category(id: 'crop', label: 'Crop', icon: Icons.air),
              Category(id: 'duodenum', label: 'Duodenum', icon: Icons.air),
              Category(id: 'esophagus', label: 'Esophagus', icon: Icons.air),
              Category(id: 'gizzard', label: 'Gizzard', icon: Icons.air),
              Category(id: 'jejunum_ileum', label: 'Jejunum Ileum', icon: Icons.air),
              Category(id: 'large_intestine', label: 'Large Intestine', icon: Icons.air),
              Category(id: 'proventriculus', label: 'Proventriculus', icon: Icons.air),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: 'Upper Tract',
            icon: Icons.emoji_food_beverage,
            subcategories: [
              Category(id: 'beak', label: 'Beak', icon: Icons.air),
              Category(id: 'choana', label: 'Choana', icon: Icons.air),
              Category(id: 'oral_cavity', label: 'Oral Cavity', icon: Icons.air),
              Category(id: 'pharynx', label: 'Pharynx', icon: Icons.air),
              Category(id: 'salivary_glands', label: 'Salivary Glands', icon: Icons.air),
              Category(id: 'tongue', label: 'Tongue', icon: Icons.air),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: 'Endocrine System',
        icon: Icons.scatter_plot,
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: 'Adrenal Glands', icon: Icons.scatter_plot),
          Category(id: 'bursa_of_fabricius', label: 'Bursa Of Fabricius', icon: Icons.scatter_plot),
          Category(id: 'gonads', label: 'Gonads', icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: 'Hypothalamus', icon: Icons.scatter_plot),
          Category(id: 'pancreatic_islets', label: 'Pancreatic Islets', icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: 'Parathyroid Glands', icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: 'Pineal Gland', icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: 'Pituitary', icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: 'Thyroid Gland', icon: Icons.scatter_plot),
          Category(id: 'ultimobranchial_glands', label: 'Ultimobranchial Glands', icon: Icons.scatter_plot),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: 'Integumentary System',
        icon: Icons.layers,
        subcategories: [
          Category(id: 'dermis', label: 'Dermis', icon: Icons.layers),
          Category(id: 'epidermis', label: 'Epidermis', icon: Icons.layers),
          Category(id: 'feathers', label: 'Feathers', icon: Icons.brush),
          Category(id: 'glands', label: 'Glands', icon: Icons.scatter_plot),
          Category(id: 'hypodermis', label: 'Hypodermis', icon: Icons.layers),
          Category(id: 'pigmentation_color_patterns', label: 'Pigmentation Color Patterns', icon: Icons.palette),
          Category(id: 'scales_beak', label: 'Scales Beak', icon: Icons.layers),
          Category(id: 'sensory_feathers', label: 'Sensory Feathers', icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: 'Lumbosacral Plexus',
        icon: Icons.linear_scale,
        subcategories: [
          Category(id: 'lumbosacral_plexus', label: 'Lumbosacral Plexus', icon: Icons.linear_scale),
          Category(id: 'pudendal_plexus', label: 'Pudendal Plexus', icon: Icons.linear_scale),
          Category(id: 'sciatic_nerve', label: 'Sciatic Nerve', icon: Icons.linear_scale),
        ],
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: 'Lymphatic System',
        icon: Icons.water,
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'bursa_of_fabricius', label: 'Bursa Of Fabricius', icon: Icons.water),
          Category(id: 'lymph_hearts', label: 'Lymph Hearts', icon: Icons.water),
          Category(id: 'lymph_vessels', label: 'Lymph Vessels', icon: Icons.water),
          Category(id: 'lymphoid_tissue', label: 'Lymphoid Tissue', icon: Icons.water),
          Category(id: 'spleen', label: 'Spleen', icon: Icons.water),
          Category(id: 'thymus', label: 'Thymus', icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: 'Nervous System',
        icon: Icons.psychology,
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: 'Autonomic',
            icon: Icons.settings,
            subcategories: [
              Category(id: 'autonomic_system', label: 'Autonomic System', icon: Icons.settings),
              Category(id: 'enteric_plexuses', label: 'Enteric Plexuses', icon: Icons.settings),
              Category(id: 'sympathetic_chain', label: 'Sympathetic Chain', icon: Icons.settings),
              Category(id: 'vagus_nerve', label: 'Vagus Nerve', icon: Icons.settings),
            ],
          ),
          Category(
            id: 'nervous_system_cns',
            label: 'Nervous System (CNS)',
            icon: Icons.psychology,
            subcategories: [
              Category(id: 'brain_meninges', label: 'Brain Meninges', icon: Icons.psychology),
              Category(id: 'brain', label: 'Brain', icon: Icons.psychology),
              Category(id: 'spinal_cord', label: 'Spinal Cord', icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'peripheral_nervous_system_pns',
            label: 'Peripheral Nervous System (PNS)',
            icon: Icons.scatter_plot,
            subcategories: [
              Category(id: 'cranial_nerves', label: 'Cranial Nerves', icon: Icons.scatter_plot),
              Category(id: 'peripheral_ganglia', label: 'Peripheral Ganglia', icon: Icons.scatter_plot),
              Category(id: 'sensory_receptors', label: 'Sensory Receptors', icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: 'Spinal Nerves', icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: 'Reproductive System',
        icon: Icons.favorite,
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(id: 'cloacal_region', label: 'Cloacal Region', icon: Icons.circle),
              Category(id: 'infundibulum', label: 'Infundibulum', icon: Icons.circle),
              Category(id: 'isthmus', label: 'Isthmus', icon: Icons.circle),
              Category(id: 'magnum', label: 'Magnum', icon: Icons.circle),
              Category(id: 'ovary', label: 'Ovary', icon: Icons.circle),
              Category(id: 'oviduct', label: 'Oviduct', icon: Icons.linear_scale),
              Category(id: 'shell_gland_uterus', label: 'Shell Gland Uterus', icon: Icons.favorite),
              Category(id: 'sperm_storage_tubules_bird_female_accurate', label: 'Sperm Storage Tubules Bird Female Accurate', icon: Icons.linear_scale),
              Category(id: 'vagina', label: 'Vagina', icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(id: 'cloaca', label: 'Cloaca', icon: Icons.scatter_plot),
              Category(id: 'copulatory_organ', label: 'Copulatory Organ', icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: 'Epididymis', icon: Icons.circle),
              Category(id: 'phallus', label: 'Phallus', icon: Icons.scatter_plot),
              Category(id: 'seminal_glomus', label: 'Seminal Glomus', icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: 'Sperm Duct', icon: Icons.linear_scale),
              Category(id: 'testes', label: 'Testes', icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: 'Respiratory System',
        icon: Icons.air,
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(id: 'lower_airways', label: 'Lower Airways', icon: Icons.air),
          Category(id: 'upper_airways', label: 'Upper Airways', icon: Icons.air),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: 'Urinary System',
        icon: Icons.water_drop,
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'cloacal_urodeum', label: 'Cloacal Urodeum', icon: Icons.water_drop),
          Category(id: 'kidneys', label: 'Kidneys', icon: Icons.water_drop),
          Category(id: 'ureters', label: 'Ureters', icon: Icons.linear_scale),
        ],
      ),
    ];
  }

  // Get skeletal system categories for a specific animal
  static List<Category> getSkeletalSystemCategoriesForAnimal(String animalId) {
    String animal = animalId.toLowerCase();
    
    if (['dog', 'horse', 'cat', 'bird'].contains(animal)) {
      List<Category> categories = [];

      // Skull - common structure for all animals
      categories.add(
        Category(
          id: 'skull', 
          label: 'Skull', 
          icon: Icons.psychology,
          imagePath: 'assets/images/$animalId/skeleton/skull.webp',
          subcategories: [
            Category(
              id: 'cranial_bones',
              label: 'Cranial Bones',
              icon: Icons.psychology,
              subcategories: [
                Category(id: 'ethmoid', label: 'Ethmoid', icon: Icons.psychology),
                Category(id: 'frontal', label: 'Frontal', icon: Icons.psychology),
                Category(id: 'occipital', label: 'Occipital', icon: Icons.psychology),
                Category(id: 'parietal', label: 'Parietal', icon: Icons.psychology),
                Category(id: 'sphenoid', label: 'Sphenoid', icon: Icons.psychology),
                Category(id: 'temporal', label: 'Temporal', icon: Icons.psychology),
              ],
            ),
            Category(
              id: 'facial_bones',
              label: 'Facial Bones',
              icon: Icons.face,
              subcategories: [
                Category(id: 'incisive', label: 'Incisive', icon: Icons.face),
                Category(id: 'lacrimal', label: 'Lacrimal', icon: Icons.face),
                Category(id: 'maxilla', label: 'Maxilla', icon: Icons.face),
                Category(id: 'nasal', label: 'Nasal', icon: Icons.face),
                Category(id: 'palatine', label: 'Palatine', icon: Icons.face),
                Category(id: 'vomer', label: 'Vomer', icon: Icons.face),
                Category(id: 'zygomatic', label: 'Zygomatic', icon: Icons.face),
              ],
            ),
            Category(id: 'mandible', label: 'Mandible', icon: Icons.architecture),
            Category(id: 'hyoid_apparatus', label: 'Hyoid Apparatus', icon: Icons.straighten),
            Category(id: 'auditory_ossicles', label: 'Auditory Ossicles', icon: Icons.hearing),
          ],
        ),
      );

      // Spine - common for all animals
      categories.add(
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
      );

      // Ribcage - common for all animals
      categories.add(
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
      );

      // Shoulder Girdle - different for birds
      if (animal == 'bird') {
        categories.add(
          Category(
            id: 'shoulder_girdle', 
            label: 'Shoulder Girdle', 
            icon: Icons.accessibility,
            subcategories: [
              Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
              Category(id: 'clavicle', label: 'Clavicle', icon: Icons.accessibility),
              Category(id: 'coracoid', label: 'Coracoid', icon: Icons.accessibility),
            ],
          ),
        );
      } else {
        categories.add(
          Category(
            id: 'shoulder_girdle', 
            label: 'Shoulder Girdle', 
            icon: Icons.accessibility,
            subcategories: [
              Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
            ],
          ),
        );
      }

      // Forelimb/Wing - birds have wings, others have forelimbs
      if (animal == 'bird') {
        categories.add(
          Category(
            id: 'wing', 
            label: 'Wing', 
            icon: Icons.flight,
            subcategories: [
              Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
              Category(
                id: 'carpus',
                label: 'Carpus',
                icon: Icons.grid_view,
                subcategories: [
                  Category(id: 'distal_tarsals', label: 'Distal Tarsals', icon: Icons.accessibility),
                  Category(id: 'proximal_tarsals', label: 'Proximal Tarsals', icon: Icons.accessibility),
                ],
              ),
              Category(
                id: 'manus',
                label: 'Manus',
                icon: Icons.pan_tool,
                subcategories: [
                  Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
                  Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
                  Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
                ],
              ),
            ],
          ),
        );
      } else {
        categories.add(
          Category(
            id: 'forelimb', 
            label: 'Forelimb', 
            icon: Icons.accessibility,
            subcategories: [
              Category(
                id: 'brachium',
                label: 'Brachium',
                icon: Icons.grid_view,
                subcategories: [
                  Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
                ],
              ),
              Category(
                id: 'antebrachium',
                label: 'Antebrachium',
                icon: Icons.grid_view,
                subcategories: [
                  Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
                  Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
                ],
              ),
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
                id: 'manus',
                label: 'Manus',
                icon: Icons.pan_tool,
                subcategories: [
                  Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
                  Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
                  Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
                ],
              ),
            ],
          ),
        );
      }

      // Hindlimb - different structures for different animals
      List<Category> hindlimbSubcategories = [
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
          subcategories: animal == 'bird' ? [
            Category(id: 'tibiotarsus', label: 'Tibiotarsus', icon: Icons.accessibility),
            Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
          ] : [
            Category(id: 'tibia', label: 'Tibia', icon: Icons.accessibility),
            Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
          ],
        ),
        Category(
          id: 'hock',
          label: 'Hock',
          icon: Icons.grid_view,
          subcategories: [
            Category(id: 'calcaneus', label: 'Calcaneus', icon: Icons.accessibility),
            Category(id: 'central_tarsal', label: 'Central Tarsal', icon: Icons.accessibility),
            Category(id: 'talus', label: 'Talus', icon: Icons.accessibility),
            Category(id: 'tarsals', label: 'Tarsals', icon: Icons.accessibility),
          ],
        ),
      ];

      // Add foot/paw based on animal type
      if (animal == 'horse') {
        hindlimbSubcategories.add(
          Category(
            id: 'hindhoof',
            label: 'Hindhoof',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metatarsals_i_v', label: 'Metatarsals I-V', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        );
      } else if (animal == 'bird') {
        hindlimbSubcategories.add(
          Category(
            id: 'foot',
            label: 'Foot',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metatarsals', label: 'Metatarsals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        );
      } else { // dog and cat
        hindlimbSubcategories.add(
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
        );
      }

      categories.add(
        Category(
          id: 'hindlimb', 
          label: 'Hindlimb', 
          icon: Icons.grid_view,
          subcategories: hindlimbSubcategories,
        ),
      );

      // Special Bones - different for each animal
      if (animal == 'dog' || animal == 'cat') {
        categories.add(
          Category(
            id: 'special_bones', 
            label: 'Special Bones', 
            icon: Icons.star,
            subcategories: [
              Category(id: 'os_penis_baculum', label: 'Os Penis Baculum', icon: Icons.star),
            ],
          ),
        );
      } else if (animal == 'bird') {
        categories.add(
          Category(
            id: 'special_bones', 
            label: 'Special Bones', 
            icon: Icons.star,
            subcategories: [
              Category(id: 'furcula', label: 'Furcula', icon: Icons.star),
              Category(id: 'pygostyle', label: 'Pygostyle', icon: Icons.star),
              Category(id: 'synsacrum', label: 'Synsacrum', icon: Icons.star),
              Category(id: 'uncinate_processes', label: 'Uncinate Processes', icon: Icons.star),
            ],
          ),
        );
      }

      // Dentition - common for horse, dog, cat (birds don't have teeth)
      if (animal != 'bird') {
        categories.add(
          Category(
            id: 'dentition', 
            label: 'Dentition', 
            icon: Icons.emoji_food_beverage,
            imagePath: 'assets/images/systems/dentition.webp',
            subcategories: [
              Category(
                id: 'upper', 
                label: 'Upper', 
                icon: Icons.star,
                subcategories: [
                  Category(id: 'left', label: 'Left', icon: Icons.star),
                  Category(id: 'right', label: 'Right', icon: Icons.star),
                ],
              ),
              Category(
                id: 'lower', 
                label: 'Lower', 
                icon: Icons.star,
                subcategories: [
                  Category(id: 'left', label: 'Left', icon: Icons.star),
                  Category(id: 'right', label: 'Right', icon: Icons.star),
                ],
              ),
            ],
          ),
        );
      }

      return categories;
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
    final categories = <Category>[];

    // Hearing & Balance - different for each animal
    List<Category> hearingBalanceSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      hearingBalanceSubcategories = [
        Category(
          id: 'external_ear',
          label: 'External Ear',
          icon: Icons.hearing,
          imagePath: 'assets/images/sensory/hearing_balance/external_ear.webp',
        ),
        Category(
          id: 'inner_ear_cochlea',
          label: 'Inner Ear Cochlea',
          icon: Icons.hearing,
          imagePath: 'assets/images/sensory/hearing_balance/inner_ear_cochlea.webp',
        ),
        Category(
          id: 'middle_ear',
          label: 'Middle Ear',
          icon: Icons.hearing,
          imagePath: 'assets/images/sensory/hearing_balance/middle_ear.webp',
        ),
        Category(
          id: 'vestibular_system',
          label: 'Vestibular System',
          icon: Icons.balance,
          imagePath: 'assets/images/sensory/hearing_balance/vestibular_system.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      hearingBalanceSubcategories = [
        Category(
          id: 'auditory_structures',
          label: 'Auditory Structures',
          icon: Icons.hearing,
          imagePath: 'assets/images/sensory/hearing_balance/auditory_structures.webp',
        ),
        Category(
          id: 'vestibular_structures',
          label: 'Vestibular Structures',
          icon: Icons.balance,
          imagePath: 'assets/images/sensory/hearing_balance/vestibular_structures.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'hearing_balance',
      label: 'Hearing & Balance',
      icon: Icons.hearing,
      imagePath: 'assets/images/sensory/hearing_balance.webp',
      subcategories: hearingBalanceSubcategories,
    ));

    // Smell - single file for all animals
    categories.add(Category(
      id: 'smell',
      label: 'Smell',
      icon: Icons.air,
      imagePath: 'assets/images/sensory/smell.webp',
    ));

    // Taste - single file for all animals
    categories.add(Category(
      id: 'taste',
      label: 'Taste',
      icon: Icons.emoji_food_beverage,
      imagePath: 'assets/images/sensory/taste.webp',
    ));

    // Touch - different for each animal
    List<Category> touchSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      touchSubcategories = [
        Category(
          id: 'beak_and_tongue_sensors',
          label: 'Beak and Tongue Sensors',
          icon: Icons.touch_app,
          imagePath: 'assets/images/sensory/touch/beak_and_tongue_sensors.webp',
        ),
        Category(
          id: 'feather_mechanoreceptors',
          label: 'Feather Mechanoreceptors',
          icon: Icons.touch_app,
          imagePath: 'assets/images/sensory/touch/feather_mechanoreceptors.webp',
        ),
        Category(
          id: 'skin_receptors',
          label: 'Skin Receptors',
          icon: Icons.sensors,
          imagePath: 'assets/images/sensory/touch/skin_receptors.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      touchSubcategories = [
        Category(
          id: 'cutaneous',
          label: 'Cutaneous',
          icon: Icons.touch_app,
          imagePath: 'assets/images/sensory/touch/cutaneous.webp',
        ),
        Category(
          id: 'proprioceptive',
          label: 'Proprioceptive',
          icon: Icons.sensors,
          imagePath: 'assets/images/sensory/touch/proprioceptive.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'touch',
      label: 'Touch',
      icon: Icons.touch_app,
      imagePath: 'assets/images/sensory/touch.webp',
      subcategories: touchSubcategories,
    ));

    // Vision - different for each animal
    List<Category> visionSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      visionSubcategories = [
        Category(
          id: 'eyes',
          label: 'Eyes',
          icon: Icons.visibility,
          imagePath: 'assets/images/sensory/vision/eyes.webp',
        ),
        Category(
          id: 'optic_nerve',
          label: 'Optic Nerve',
          icon: Icons.visibility,
          imagePath: 'assets/images/sensory/vision/optic_nerve.webp',
        ),
        Category(
          id: 'pecten_oculi',
          label: 'Pecten Oculi',
          icon: Icons.visibility,
          imagePath: 'assets/images/sensory/vision/pecten_oculi.webp',
        ),
        Category(
          id: 'retina',
          label: 'Retina',
          icon: Icons.visibility,
          imagePath: 'assets/images/sensory/vision/retina.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      visionSubcategories = [
        Category(
          id: 'accessory_system',
          label: 'Accessory System',
          icon: Icons.visibility_off,
          imagePath: 'assets/images/sensory/vision/accessory_system.webp',
        ),
        Category(
          id: 'visual_system',
          label: 'Visual System',
          icon: Icons.visibility,
          imagePath: 'assets/images/sensory/vision/visual_system.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'vision',
      label: 'Vision',
      icon: Icons.visibility,
      imagePath: 'assets/images/sensory/vision.webp',
      subcategories: visionSubcategories,
    ));

    return categories;
  }

  // Get connective tissue categories for a specific animal
  static List<Category> getConnectiveTissueCategoriesForAnimal(String animalId) {
    // Common connective tissue categories for horse, dog, and cat
    List<Category> commonCategories = [
      Category(
        id: 'adipose_tissue',
        label: 'Adipose Tissue',
        icon: Icons.circle,
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

    // Bird has additional connective tissue types
    if (animalId == 'bird') {
      return [
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

    // Return common categories for horse, dog, and cat
    return commonCategories;
  }

  // Get organs categories for a specific animal
  static List<Category> getOrgansCategoriesForAnimal(String animalId) {
    final categories = <Category>[];

    // Abdomen organs - different for each animal
    List<Category> abdominalSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      abdominalSubcategories = [
        Category(
          id: 'gallbladder',
          label: 'Gallbladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/gallbladder.webp',
        ),
        Category(
          id: 'intestines',
          label: 'Intestines',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/intestines.webp',
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
          id: 'stomach',
          label: 'Stomach',
          icon: Icons.restaurant,
          imagePath: 'assets/images/organs/abdomen/stomach.webp',
        ),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
      abdominalSubcategories = [
        Category(
          id: 'kidneys',
          label: 'Kidneys',
          icon: Icons.water_drop,
          imagePath: 'assets/images/organs/abdomen/kidneys.webp',
      ),
      Category(
        id: 'large_intestine',
        label: 'Large Intestine',
        icon: Icons.linear_scale,
        imagePath: 'assets/images/organs/abdomen/large_intestine.webp',
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
          id: 'small_intestine',
          label: 'Small Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/small_intestine.webp',
        ),
        Category(
          id: 'spleen',
          label: 'Spleen',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/spleen.webp',
        ),
        Category(
          id: 'stomach',
          label: 'Stomach',
          icon: Icons.restaurant,
          imagePath: 'assets/images/organs/abdomen/stomach.webp',
        ),
        Category(
          id: 'urinary_bladder',
          label: 'Urinary Bladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/urinary_bladder.webp',
        ),
      ];
    } else {
      // Dog and cat have identical abdomen organs
      abdominalSubcategories = [
        Category(
          id: 'gallbladder',
          label: 'Gallbladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/gallbladder.webp',
        ),
      Category(
        id: 'kidneys',
        label: 'Kidneys',
        icon: Icons.water_drop,
        imagePath: 'assets/images/organs/abdomen/kidneys.webp',
      ),
        Category(
          id: 'large_intestine',
          label: 'Large Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/large_intestine.webp',
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
          id: 'small_intestine',
          label: 'Small Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/small_intestine.webp',
        ),
        Category(
          id: 'spleen',
          label: 'Spleen',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/spleen.webp',
        ),
        Category(
          id: 'stomach',
          label: 'Stomach',
          icon: Icons.restaurant,
          imagePath: 'assets/images/organs/abdomen/stomach.webp',
        ),
      Category(
        id: 'urinary_bladder',
        label: 'Urinary Bladder',
        icon: Icons.opacity,
        imagePath: 'assets/images/organs/abdomen/urinary_bladder.webp',
      ),
      ];
    }
    categories.add(Category(
      id: 'abdomen',
      label: 'Abdomen',
      icon: Icons.restaurant,
      imagePath: 'assets/images/organs/abdomen.webp',
      subcategories: abdominalSubcategories,
    ));

    // Head organs - different naming for bird
    List<Category> headSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      headSubcategories = [
      Category(
          id: 'brain',
          label: 'Brain',
          icon: Icons.psychology,
          imagePath: 'assets/images/organs/head/brain.webp',
          ),
          Category(
          id: 'ears',
          label: 'Ears',
            icon: Icons.hearing,
          imagePath: 'assets/images/organs/head/ears.webp',
        ),
        Category(
          id: 'eyes',
          label: 'Eyes',
          icon: Icons.visibility,
          imagePath: 'assets/images/organs/head/eyes.webp',
          ),
          Category(
            id: 'nose',
            label: 'Nose',
          icon: Icons.air,
            imagePath: 'assets/images/organs/head/nose.webp',
          ),
      ];
    } else {
      headSubcategories = [
          Category(
            id: 'brain',
            label: 'Brain',
          icon: Icons.psychology,
            imagePath: 'assets/images/organs/head/brain.webp',
      ),
      Category(
          id: 'ear',
          label: 'Ear',
          icon: Icons.hearing,
          imagePath: 'assets/images/organs/head/ear.webp',
          ),
          Category(
          id: 'eye',
          label: 'Eye',
            icon: Icons.visibility,
          imagePath: 'assets/images/organs/head/eye.webp',
      ),
      Category(
          id: 'nose',
          label: 'Nose',
          icon: Icons.air,
          imagePath: 'assets/images/organs/head/nose.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'head',
      label: 'Head',
      icon: Icons.face,
      imagePath: 'assets/images/organs/head.webp',
      subcategories: headSubcategories,
    ));

    // Neck organs - common for all animals
    categories.add(Category(
        id: 'neck',
        label: 'Neck',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/neck.webp',
        subcategories: [
          Category(
          id: 'esophagus',
          label: 'Esophagus',
            icon: Icons.mic,
          imagePath: 'assets/images/organs/neck/esophagus.webp',
          ),
          Category(
            id: 'larynx',
            label: 'Larynx',
            icon: Icons.mic,
            imagePath: 'assets/images/organs/neck/larynx.webp',
          ),
        Category(
          id: 'pharynx',
          label: 'Pharynx',
          icon: Icons.mic,
          imagePath: 'assets/images/organs/neck/pharynx.webp',
        ),
          Category(
            id: 'trachea',
            label: 'Trachea',
            icon: Icons.mic,
            imagePath: 'assets/images/organs/neck/trachea.webp',
          ),
      ],
    ));

    // Pelvis organs - only for horse, dog, and cat (not bird)
    if (animalId.toLowerCase() != 'bird') {
      categories.add(Category(
        id: 'pelvis',
        label: 'Pelvis',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/pelvis.webp',
        subcategories: [
          Category(
            id: 'anus',
            label: 'Anus',
            icon: Icons.opacity,
            imagePath: 'assets/images/organs/pelvis/anus.webp',
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
                id: 'epididymis',
                label: 'Epididymis',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/epididymis.webp',
          ),
          Category(
                id: 'sperm_duct',
                label: 'Sperm Duct',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes',
                label: 'Testes',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/testes.webp',
              ),
            ],
          ),
          Category(
            id: 'rectum',
            label: 'Rectum',
            icon: Icons.local_hospital,
            imagePath: 'assets/images/organs/pelvis/rectum.webp',
          ),
          Category(
            id: 'urethra',
            label: 'Urethra',
            icon: Icons.restaurant,
            imagePath: 'assets/images/organs/pelvis/urethra.webp',
          ),
        ],
      ));
    }

    // Reproductive organs - different for each animal
    List<Category> reproductiveSubcategories = [
          Category(
            id: 'female',
            label: 'Female',
        icon: Icons.visibility,
        imagePath: 'assets/images/organs/reproductive_organs/female.webp',
        subcategories: animalId.toLowerCase() == 'bird' ? [
          Category(
            id: 'cloaca',
            label: 'Cloaca',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/cloaca.webp',
          ),
          Category(
            id: 'infundibulum',
            label: 'Infundibulum',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/infundibulum.webp',
          ),
          Category(
            id: 'isthmus',
            label: 'Isthmus',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/isthmus.webp',
          ),
          Category(
            id: 'magnum',
            label: 'Magnum',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/magnum.webp',
          ),
          Category(
            id: 'ovary',
            label: 'Ovary',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/ovary.webp',
          ),
          Category(
            id: 'uterus_shell_gland',
            label: 'Uterus Shell Gland',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/uterus_shell_gland.webp',
          ),
          Category(
            id: 'vagina',
            label: 'Vagina',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/vagina.webp',
          ),
        ] : [
          Category(
            id: 'cervix',
            label: 'Cervix',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/cervix.webp',
          ),
              Category(
                id: 'ovaries',
                label: 'Ovaries',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/ovaries.webp',
              ),
              Category(
                id: 'uterine_tubes',
                label: 'Uterine Tubes',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/uterine_tubes.webp',
              ),
              Category(
                id: 'uterus',
                label: 'Uterus',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/uterus.webp',
              ),
              Category(
                id: 'vagina',
                label: 'Vagina',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
        icon: Icons.visibility,
        imagePath: 'assets/images/organs/reproductive_organs/male.webp',
        subcategories: animalId.toLowerCase() == 'bird' ? [
          Category(
            id: 'accessory_glands',
            label: 'Accessory Glands',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/accessory_glands.webp',
          ),
          Category(
            id: 'epididymis',
            label: 'Epididymis',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/epididymis.webp',
          ),
          Category(
            id: 'phallus',
            label: 'Phallus',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/phallus.webp',
          ),
          Category(
            id: 'sheath',
            label: 'Sheath',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/sheath.webp',
          ),
              Category(
                id: 'sperm_duct',
                label: 'Sperm Duct',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/sperm_duct.webp',
          ),
          Category(
            id: 'testes',
            label: 'Testes',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/testes.webp',
          ),
        ] : [
              Category(
                id: 'epididymis',
                label: 'Epididymis',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/epididymis.webp',
          ),
          Category(
            id: 'penis',
            label: 'Penis',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/penis.webp',
          ),
          Category(
            id: 'sperm_duct',
            label: 'Sperm Duct',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes',
                label: 'Testes',
                icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/reproductive_organs/male/testes.webp',
          ),
        ],
      ),
    ];
    categories.add(Category(
      id: 'reproductive_organs',
      label: 'Reproductive Organs',
      icon: Icons.face,
      imagePath: 'assets/images/organs/reproductive_organs.webp',
      subcategories: reproductiveSubcategories,
    ));

    // Thorax organs - common for all animals
    categories.add(Category(
      id: 'thorax',
      label: 'Thorax',
      icon: Icons.accessibility,
      imagePath: 'assets/images/organs/thorax.webp',
      subcategories: [
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
        Category(
          id: 'lungs',
          label: 'Lungs',
          icon: Icons.air,
          imagePath: 'assets/images/organs/thorax/lungs.webp',
        ),
        Category(
          id: 'thymus',
          label: 'Thymus',
          icon: Icons.favorite,
          imagePath: 'assets/images/organs/thorax/thymus.webp',
        ),
      ],
    ));

    return categories;
  }

  // Get glands categories for a specific animal
  static List<Category> getGlandsCategoriesForAnimal(String animalId) {
    final categories = <Category>[];

    // Dermal glands - different for each animal
    List<Category> dermalSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      dermalSubcategories = [
        Category(
          id: 'cere_gland',
          label: 'Cere Gland',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/cere_gland.webp',
        ),
        Category(
          id: 'cutaneous_glands',
          label: 'Cutaneous Glands',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/cutaneous_glands.webp',
        ),
        Category(
          id: 'sebaceous_glands',
          label: 'Sebaceous Glands',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/sebaceous_glands.webp',
        ),
        Category(
          id: 'uropygial_gland',
          label: 'Uropygial Gland',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/uropygial_gland.webp',
        ),
      ];
    } else {
      // Common dermal glands for horse, dog, and cat
      dermalSubcategories = [
        Category(
          id: 'eccrine_glands',
          label: 'Eccrine Glands',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/eccrine_glands.webp',
        ),
        Category(
          id: 'sebaceous_glands',
          label: 'Sebaceous Glands',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/sebaceous_glands.webp',
        ),
        Category(
          id: 'sweat_glands',
          label: 'Sweat Glands',
          icon: Icons.layers,
          imagePath: 'assets/images/glands/dermal/sweat_glands.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'dermal',
      label: 'Dermal',
      icon: Icons.layers,
      imagePath: 'assets/images/glands/dermal.webp',
      subcategories: dermalSubcategories,
    ));

    // Mammary glands - only for horse, dog, and cat (not bird)
    if (animalId.toLowerCase() != 'bird') {
      List<Category> mammarySubcategories;
      if (animalId.toLowerCase() == 'dog') {
        mammarySubcategories = [
          Category(
            id: 'bitch',
            label: 'Bitch',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/mammary/bitch.webp',
          ),
          Category(
            id: 'dog',
            label: 'Dog',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/mammary/dog.webp',
          ),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
        mammarySubcategories = [
          Category(
            id: 'mare',
            label: 'Mare',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/mammary/mare.webp',
          ),
          Category(
            id: 'stallion',
            label: 'Stallion',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/mammary/stallion.webp',
          ),
        ];
      } else if (animalId.toLowerCase() == 'cat') {
        mammarySubcategories = [
          Category(
            id: 'queen',
            label: 'Queen',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/mammary/queen.webp',
          ),
          Category(
            id: 'tom',
            label: 'Tom',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/mammary/tom.webp',
          ),
        ];
      } else {
        mammarySubcategories = [];
    }
    categories.add(Category(
        id: 'mammary',
        label: 'Mammary',
      icon: Icons.scatter_plot,
        imagePath: 'assets/images/glands/mammary.webp',
        subcategories: mammarySubcategories,
      ));
    }

    // Ocular glands - different for each animal
    List<Category> ocularSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      ocularSubcategories = [
        Category(
          id: 'gland_of_the_third_eyelid',
          label: 'Gland of the Third Eyelid',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/gland_of_the_third_eyelid.webp',
        ),
        Category(
          id: 'harderian_gland',
          label: 'Harderian Gland',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/harderian_gland.webp',
        ),
        Category(
          id: 'lacrimal_gland',
          label: 'Lacrimal Gland',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/lacrimal_gland.webp',
        ),
        Category(
          id: 'nictitating_membrane_gland',
          label: 'Nictitating Membrane Gland',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/nictitating_membrane_gland.webp',
        ),
      ];
    } else {
      // Common ocular glands for horse, dog, and cat
      ocularSubcategories = [
        Category(
          id: 'conjunctival_glands',
          label: 'Conjunctival Glands',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/conjunctival_glands.webp',
        ),
        Category(
          id: 'gland_of_the_third_eyelid',
          label: 'Gland of the Third Eyelid',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/gland_of_the_third_eyelid.webp',
        ),
        Category(
          id: 'lacrimal_gland',
          label: 'Lacrimal Gland',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/lacrimal_gland.webp',
        ),
        Category(
          id: 'meibomian_glands',
          label: 'Meibomian Glands',
          icon: Icons.visibility,
          imagePath: 'assets/images/glands/ocular/meibomian_glands.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'ocular',
      label: 'Ocular',
      icon: Icons.visibility,
      imagePath: 'assets/images/glands/ocular.webp',
      subcategories: ocularSubcategories,
    ));

    // Perianal glands - only for dog and cat
    if (animalId.toLowerCase() == 'dog' || animalId.toLowerCase() == 'cat') {
      List<Category> perianalSubcategories = [
        Category(
          id: 'anal_sacs',
          label: 'Anal Sacs',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/perianal/anal_sacs.webp',
        ),
      ];
      if (animalId.toLowerCase() == 'dog') {
        perianalSubcategories.add(Category(
          id: 'perianal_glands',
          label: 'Perianal Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/perianal_glands.webp',
        ));
      }
      categories.add(Category(
        id: 'perianal',
        label: 'Perianal',
        icon: Icons.scatter_plot,
        imagePath: 'assets/images/glands/perianal_glands.webp',
        subcategories: perianalSubcategories,
      ));
    }

    // Salivary glands - different for each animal
    List<Category> salivarySubcategories;
    if (animalId.toLowerCase() == 'bird') {
      salivarySubcategories = [
        Category(
          id: 'angular_glands',
          label: 'Angular Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/angular_glands.webp',
        ),
        Category(
          id: 'anterior_lingual_glands',
          label: 'Anterior Lingual Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/anterior_lingual_glands.webp',
        ),
        Category(
          id: 'cricoarytenoid_glands',
          label: 'Cricoarytenoid Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/cricoarytenoid_glands.webp',
        ),
        Category(
          id: 'palatine_glands',
          label: 'Palatine Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/palatine_glands.webp',
        ),
        Category(
          id: 'posterior_lingual_glands',
          label: 'Posterior Lingual Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/posterior_lingual_glands.webp',
        ),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
      salivarySubcategories = [
        Category(
          id: 'buccal_gland',
          label: 'Buccal Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/buccal_gland.webp',
        ),
        Category(
          id: 'mandibular_gland',
          label: 'Mandibular Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/mandibular_gland.webp',
        ),
        Category(
          id: 'parotid_gland',
          label: 'Parotid Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/parotid_gland.webp',
        ),
        Category(
          id: 'sublingual_gland',
          label: 'Sublingual Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/sublingual_gland.webp',
        ),
      ];
    } else if (animalId.toLowerCase() == 'dog' || animalId.toLowerCase() == 'cat') {
      salivarySubcategories = [
        Category(
          id: 'mandibular_gland',
          label: 'Mandibular Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/mandibular_gland.webp',
        ),
        Category(
          id: 'parotid_gland',
          label: 'Parotid Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/parotid_gland.webp',
        ),
        Category(
          id: 'sublingual_gland',
          label: 'Sublingual Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/sublingual_gland.webp',
        ),
        Category(
          id: 'zygomatic_gland',
          label: 'Zygomatic Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/glands/salivary/zygomatic_gland.webp',
        ),
      ];
    } else {
      salivarySubcategories = [];
    }
    categories.add(Category(
      id: 'salivary',
      label: 'Salivary',
      icon: Icons.scatter_plot,
      imagePath: 'assets/images/glands/salivary.webp',
      subcategories: salivarySubcategories,
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
    if (animalId != null) {
      _energyCache.remove(animalId);
    } else {
      _energyCache.clear();
    }
  }
}

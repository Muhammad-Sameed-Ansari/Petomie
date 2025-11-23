import 'package:flutter/material.dart';
import '../category.dart';

class EnergyCategories {
  // Cache for generated subcategories to avoid regeneration
  static final Map<String, List<Category>> _cache = {};

  /// Get energy categories for a specific animal with caching
  static List<Category> getEnergyCategoriesForAnimal(String animalId) {
    print("sameed - getEnergyCategoriesForAnimal - animalId: $animalId");
    
    // Check cache first
    if (_cache.containsKey(animalId)) {
      print("sameed - returning cached energy categories for $animalId");
      return _cache[animalId]!;
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

      // Primary Meridian - Same for Horse, Dog, Cat, and Bird
      List<Category> primaryMeridianSubs = [
        Category(
          id: 'lung', 
          label: 'Lung (LU)', 
          icon: Icons.air,
        ),
        Category(
          id: 'large_intestine', 
          label: 'Large Intestine (LI)', 
          icon: Icons.restaurant,
        ),
        Category(
          id: 'stomach', 
          label: 'Stomach (ST)', 
          icon: Icons.restaurant,
        ),
        Category(
          id: 'spleen', 
          label: 'Spleen (SP)', 
          icon: Icons.scatter_plot,
        ),
        Category(
          id: 'heart', 
          label: 'Heart (HT)', 
          icon: Icons.favorite,
        ),
        Category(
          id: 'small_intestine', 
          label: 'Small Intestine (SI)', 
          icon: Icons.restaurant,
        ),
        Category(
          id: 'bladder', 
          label: 'Bladder (BL)', 
          icon: Icons.water_drop,
        ),
        Category(
          id: 'kidney', 
          label: 'Kidney (KI)', 
          icon: Icons.water_drop,
        ),
        Category(
          id: 'pericardium', 
          label: 'Pericardium (PC)', 
          icon: Icons.favorite_border,
        ),
        Category(
          id: 'triple_heater', 
          label: 'Triple Heater (TH)', 
          icon: Icons.whatshot,
        ),
        Category(
          id: 'gall_bladder', 
          label: 'Gall Bladder (GB)', 
          icon: Icons.local_hospital,
        ),
        Category(
          id: 'liver', 
          label: 'Liver (LV)', 
          icon: Icons.local_hospital,
        ),
      ];

      // Extraordinary Meridian - Different for each animal
      List<Category> extraordinaryMeridianSubs = [];
      if (animal == 'horse') {
        extraordinaryMeridianSubs = [
          Category(
            id: 'governing_vessel', 
            label: 'Governing Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'penetrating_vessel', 
            label: 'Penetrating Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'girdling_vessel', 
            label: 'Girdling Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yin_heel_vessel', 
            label: 'Yin Heel Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yang_heel_vessel', 
            label: 'Yang Heel Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yin_linking_vessel', 
            label: 'Yin Linking Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yang_linking_vessel', 
            label: 'Yang Linking Vessel', 
            icon: Icons.vertical_split,
          ),
        ];
      } else if (animal == 'dog' || animal == 'cat') {
        extraordinaryMeridianSubs = [
          Category(
            id: 'conception_vessel', 
            label: 'Conception Vessel', 
            icon: Icons.horizontal_split,
          ),
          Category(
            id: 'governing_vessel', 
            label: 'Governing Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'penetrating_vessel', 
            label: 'Penetrating Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'girdling_vessel', 
            label: 'Girdling Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yin_heel_vessel', 
            label: 'Yin Heel Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yang_heel_vessel', 
            label: 'Yang Heel Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yin_linking_vessel', 
            label: 'Yin Linking Vessel', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yang_linking_vessel', 
            label: 'Yang Linking Vessel', 
            icon: Icons.vertical_split,
          ),
        ];
      } else if (animal == 'bird') {
        extraordinaryMeridianSubs = [
          Category(
            id: 'ren_mai', 
            label: 'Ren Mai', 
            icon: Icons.horizontal_split,
          ),
          Category(
            id: 'du_mai', 
            label: 'Du Mai', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'chong_mai', 
            label: 'Chong Mai', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'dai_mai', 
            label: 'Dai Mai', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yin_qiao_mai', 
            label: 'Yin Qiao Mai', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yang_qiao_mai', 
            label: 'Yang Qiao Mai', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yin_wei_mai', 
            label: 'Yin Wei Mai', 
            icon: Icons.vertical_split,
          ),
          Category(
            id: 'yang_wei_mai', 
            label: 'Yang Wei Mai', 
            icon: Icons.vertical_split,
          ),
        ];
      }

      meridiansSubcategories = [
        Category(
          id: 'primary_meridian', 
          label: 'Primary Meridian', 
          icon: Icons.call_split,
          imagePath: 'assets/images/$animal/energy/meridians/primary_meridian.webp',
          subcategories: primaryMeridianSubs,
        ),
        Category(
          id: 'extraordinary_meridian', 
          label: 'Extraordinary Meridian', 
          icon: Icons.linear_scale,
          imagePath: 'assets/images/$animal/energy/meridians/extraordinary_meridian.webp',
          subcategories: extraordinaryMeridianSubs,
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
    
    _cache[animalId] = categories;
    return categories;
  }

  /// Clear energy cache for a specific animal or all animals
  static void clearCache([String? animalId]) {
    if (animalId != null) {
      _cache.remove(animalId);
    } else {
      _cache.clear();
    }
  }
}

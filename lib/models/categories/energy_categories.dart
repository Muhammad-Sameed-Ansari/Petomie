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
      String animal = animalId.toLowerCase();
      
      // Main Chakra - Common for all animals
      List<Category> mainChakraSubs = [
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
      ];

      chakraSubcategories.add(
        Category(
          id: 'main_chakra',
          label: 'Main Chakra',
          icon: Icons.circle,
          imagePath: 'assets/images/energy/chakras/main_chakra.webp',
          subcategories: mainChakraSubs,
        ),
      );

      // Secondary Chakra - Different for each animal
      List<Category> secondarySubs = [];
      if (animal == 'horse') {
        secondarySubs = [
          Category(
            id: 'brachial_chakra',
            label: 'Brachial Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/brachial_chakra.webp',
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
            id: 'hoof_chakras',
            label: 'Hoof Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/hoof_chakras.webp',
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
          Category(
            id: 'tail_chakra',
            label: 'Tail Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_chakra.webp',
          ),
          Category(
            id: 'whorl_chakra',
            label: 'Whorl Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whorl_chakra.webp',
          ),
        ];
      } else if (animal == 'dog') {
        secondarySubs = [
          Category(
            id: 'brachial_chakra',
            label: 'Brachial Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/brachial_chakra.webp',
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
            id: 'nose_chakra',
            label: 'Nose Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/nose_chakra.webp',
          ),
          Category(
            id: 'paw_chakras',
            label: 'Paw Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/paw_chakras.webp',
          ),
          Category(
            id: 'spleen_chakra',
            label: 'Spleen Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/spleen_chakra.webp',
          ),
          Category(
            id: 'tail_chakra',
            label: 'Tail Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_chakra.webp',
          ),
          Category(
            id: 'whorl_chakra',
            label: 'Whorl Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whorl_chakra.webp',
          ),
        ];
      } else if (animal == 'cat') {
        secondarySubs = [
          Category(
            id: 'brachial_chakra',
            label: 'Brachial Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/brachial_chakra.webp',
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
            id: 'nose_chakra',
            label: 'Nose Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/nose_chakra.webp',
          ),
          Category(
            id: 'paw_chakras',
            label: 'Paw Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/paw_chakras.webp',
          ),
          Category(
            id: 'spleen_chakra',
            label: 'Spleen Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/spleen_chakra.webp',
          ),
          Category(
            id: 'tail_chakra',
            label: 'Tail Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_chakra.webp',
          ),
          Category(
            id: 'whisker_chakras',
            label: 'Whisker Chakras',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whisker_chakras.webp',
          ),
          Category(
            id: 'whorl_chakra',
            label: 'Whorl Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whorl_chakra.webp',
          ),
        ];
      } else if (animal == 'bird') {
        secondarySubs = [
          Category(
            id: 'beak_chakra',
            label: 'Beak Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/beak_chakra.webp',
          ),
          Category(
            id: 'brachial_chakra',
            label: 'Brachial Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/brachial_chakra.webp',
          ),
          Category(
            id: 'ear_side_head_chakra',
            label: 'Ear Side Head Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/ear_side_head_chakra.webp',
          ),
          Category(
            id: 'feet_chakra',
            label: 'Feet Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/feet_chakra.webp',
          ),
          Category(
            id: 'tail_feather_chakra',
            label: 'Tail Feather Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/tail_feather_chakra.webp',
          ),
          Category(
            id: 'whorl_chakra',
            label: 'Whorl Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/whorl_chakra.webp',
          ),
          Category(
            id: 'wing_chakra',
            label: 'Wing Chakra',
            icon: Icons.circle,
            imagePath: 'assets/images/energy/chakras/secondary_chakra/wing_chakra.webp',
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

      // Cosmic Chakra - Common for all animals
      List<Category> cosmicChakraSubs = [
        Category(
          id: 'soul_star_chakra',
          label: 'Soul Star Chakra',
          icon: Icons.circle,
          imagePath: 'assets/images/energy/chakras/cosmic_chakra/soul_star_chakra.webp',
        ),
        Category(
          id: 'brahmarandra_chakra',
          label: 'Brahmarandra Chakra',
          icon: Icons.circle,
          imagePath: 'assets/images/energy/chakras/cosmic_chakra/brahmarandra_chakra.webp',
        ),
        Category(
          id: 'earth_star_chakra',
          label: 'Earth Star Chakra',
          icon: Icons.circle,
          imagePath: 'assets/images/energy/chakras/cosmic_chakra/earth_star_chakra.webp',
        ),
      ];

      chakraSubcategories.add(
        Category(
          id: 'cosmic_chakra',
          label: 'Cosmic Chakra',
          icon: Icons.circle,
          imagePath: 'assets/images/energy/chakras/cosmic_chakra.webp',
          subcategories: cosmicChakraSubs,
        ),
      );
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
          id: 'protection', 
          label: 'Protection', 
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

    // Define contracts & vows - standalone category for Horse, Dog, Cat, and Bird
    List<Category> contractsVowsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      contractsVowsSubcategories = [];
    }

    // Define energetic pathways - standalone category for Horse, Dog, Cat, and Bird
    List<Category> energeticPathwaysSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      energeticPathwaysSubcategories = [];
    }

    // Define portals & energy gateways - standalone category for Horse, Dog, Cat, and Bird
    List<Category> portalsEnergyGatewaysSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      portalsEnergyGatewaysSubcategories = [];
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
        Category(
          id: 'control_obedience_beliefs',
          label: 'Control & Obedience Beliefs',
          icon: Icons.control_camera,
          imagePath: 'assets/images/energy/negative_beliefs/control_obedience_beliefs.webp',
        ),
        Category(
          id: 'responsibility_obligation_beliefs',
          label: 'Responsibility & Obligation Beliefs',
          icon: Icons.assignment,
          imagePath: 'assets/images/energy/negative_beliefs/responsibility_obligation_beliefs.webp',
        ),
      ];
    }

    // Define core imprints subcategories for Horse, Dog, Cat, and Bird
    List<Category> coreImprintsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      coreImprintsSubcategories = [
        Category(
          id: 'energetic_boundaries',
          label: 'Energetic Boundaries',
          icon: Icons.border_outer,
          imagePath: 'assets/images/energy/core_imprints/energetic_boundaries.webp',
        ),
        Category(
          id: 'identity_or_role_imprints',
          label: 'Identity or Role Imprints',
          icon: Icons.person_pin,
          imagePath: 'assets/images/energy/core_imprints/identity_or_role_imprints.webp',
        ),
        Category(
          id: 'karmic_patterns',
          label: 'Karmic Patterns',
          icon: Icons.replay_circle_filled,
          imagePath: 'assets/images/energy/core_imprints/karmic_patterns.webp',
        ),
        Category(
          id: 'loyalty_imprints',
          label: 'Loyalty Imprints',
          icon: Icons.favorite,
          imagePath: 'assets/images/energy/core_imprints/loyalty_imprints.webp',
        ),
        Category(
          id: 'nervous_system_imprints',
          label: 'Nervous System Imprints',
          icon: Icons.grain,
          imagePath: 'assets/images/energy/core_imprints/nervous_system_imprints.webp',
        ),
        Category(
          id: 'residual_energetic_imprints',
          label: 'Residual Energetic Imprints',
          icon: Icons.blur_on,
          imagePath: 'assets/images/energy/core_imprints/residual_energetic_imprints.webp',
        ),
        Category(
          id: 'shadow_imprints',
          label: 'Shadow Imprints',
          icon: Icons.opacity,
          imagePath: 'assets/images/energy/core_imprints/shadow_imprints.webp',
        ),
        Category(
          id: 'soul_fragmentation',
          label: 'Soul Fragmentation',
          icon: Icons.broken_image,
          imagePath: 'assets/images/energy/core_imprints/soul_fragmentation.webp',
        ),
      ];
    }

    // Define energy attachments subcategories for Horse, Dog, Cat, and Bird
    List<Category> energyAttachmentsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      energyAttachmentsSubcategories = [
        Category(
          id: 'emotional_imprints',
          label: 'Emotional Imprints',
          icon: Icons.sentiment_dissatisfied,
          imagePath: 'assets/images/energy/energy_attachments/emotional_imprints.webp',
        ),
        Category(
          id: 'energetic_cords_and_attachments',
          label: 'Energetic Cords and Attachments',
          icon: Icons.link,
          imagePath: 'assets/images/energy/energy_attachments/energetic_cords_and_attachments.webp',
        ),
        Category(
          id: 'inherited_emotional_imprints',
          label: 'Inherited Emotional Imprints',
          icon: Icons.family_restroom,
          imagePath: 'assets/images/energy/energy_attachments/inherited_emotional_imprints.webp',
        ),
      ];
    }

    // Define entities & spirits subcategories for Horse, Dog, Cat, and Bird
    List<Category> entitiesSpiritsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      entitiesSpiritsSubcategories = [
        Category(
          id: 'ancestral_spirit_presence',
          label: 'Ancestral Spirit Presence',
          icon: Icons.escalator_warning,
          imagePath: 'assets/images/energy/entities_spirits/ancestral_spirit_presence.webp',
        ),
        Category(
          id: 'energetic_parasites',
          label: 'Energetic Parasites',
          icon: Icons.bug_report,
          imagePath: 'assets/images/energy/entities_spirits/energetic_parasites.webp',
        ),
        Category(
          id: 'entities_spirit_attachments',
          label: 'Entities Spirit Attachments',
          icon: Icons.visibility_off,
          imagePath: 'assets/images/energy/entities_spirits/entities_spirit_attachments.webp',
        ),
        Category(
          id: 'spirit_influence',
          label: 'Spirit Influence',
          icon: Icons.cloud,
          imagePath: 'assets/images/energy/entities_spirits/spirit_influence.webp',
        ),
      ];
    }

    // Define positive integration subcategories for Horse, Dog, Cat, and Bird
    List<Category> positiveIntegrationSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      positiveIntegrationSubcategories = [
        Category(
          id: 'positive_body_states',
          label: 'Positive Body States',
          icon: Icons.accessibility_new,
          imagePath: 'assets/images/energy/positive_integration/positive_body_states.webp',
        ),
        Category(
          id: 'positive_energy_states',
          label: 'Positive Energy States',
          icon: Icons.energy_savings_leaf,
          imagePath: 'assets/images/energy/positive_integration/positive_energy_states.webp',
        ),
        Category(
          id: 'positive_integration_beliefs',
          label: 'Positive Integration Beliefs',
          icon: Icons.psychology,
          imagePath: 'assets/images/energy/positive_integration/positive_integration_beliefs.webp',
        ),
        Category(
          id: 'positive_integration_emotions',
          label: 'Positive Integration Emotions',
          icon: Icons.sentiment_satisfied,
          imagePath: 'assets/images/energy/positive_integration/positive_integration_emotions.webp',
        ),
        Category(
          id: 'positive_nervous_system_states',
          label: 'Positive Nervous System States',
          icon: Icons.grain,
          imagePath: 'assets/images/energy/positive_integration/positive_nervous_system_states.webp',
        ),
      ];
    }

    // Define post traumatic subcategories for Horse, Dog, Cat, and Bird
    List<Category> postTraumaticSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      postTraumaticSubcategories = [
        Category(
          id: 'defensive_holding_pattern',
          label: 'Defensive Holding Pattern',
          icon: Icons.shield,
          imagePath: 'assets/images/energy/post_traumatic/defensive_holding_pattern.webp',
        ),
        Category(
          id: 'fear_collapse_response',
          label: 'Fear Collapse Response',
          icon: Icons.arrow_downward,
          imagePath: 'assets/images/energy/post_traumatic/fear_collapse_response.webp',
        ),
        Category(
          id: 'fight_freeze_conflict',
          label: 'Fight Freeze Conflict',
          icon: Icons.pause_circle,
          imagePath: 'assets/images/energy/post_traumatic/fight_freeze_conflict.webp',
        ),
        Category(
          id: 'freezing_response_pattern',
          label: 'Freezing Response Pattern',
          icon: Icons.ac_unit,
          imagePath: 'assets/images/energy/post_traumatic/freezing_response_pattern.webp',
        ),
        Category(
          id: 'instability_imprint',
          label: 'Instability Imprint',
          icon: Icons.swap_vert,
          imagePath: 'assets/images/energy/post_traumatic/instability_imprint.webp',
        ),
        Category(
          id: 'overwhelm_response',
          label: 'Overwhelm Response',
          icon: Icons.waves,
          imagePath: 'assets/images/energy/post_traumatic/overwhelm_response.webp',
        ),
        Category(
          id: 'physical_trauma',
          label: 'Physical Trauma',
          icon: Icons.health_and_safety,
          imagePath: 'assets/images/energy/post_traumatic/physical_trauma.webp',
        ),
        Category(
          id: 'shock_imprint',
          label: 'Shock Imprint',
          icon: Icons.flash_on,
          imagePath: 'assets/images/energy/post_traumatic/shock_imprint.webp',
        ),
        Category(
          id: 'startle_memory_loop',
          label: 'Startle Memory Loop',
          icon: Icons.loop,
          imagePath: 'assets/images/energy/post_traumatic/startle_memory_loop.webp',
        ),
        Category(
          id: 'trauma_points',
          label: 'Trauma Points',
          icon: Icons.location_on,
          imagePath: 'assets/images/energy/post_traumatic/trauma_points.webp',
        ),
      ];
    }

    // Define relationship field subcategories for Horse, Dog, Cat, and Bird
    List<Category> relationshipFieldSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      // Internal subcategories
      List<Category> internalSubs = [
        Category(
          id: 'relationship_field_emotional',
          label: 'Relationship Field Emotional',
          icon: Icons.sentiment_dissatisfied,
          imagePath: 'assets/images/energy/relationship_field/internal/relationship_field_emotional.webp',
        ),
        Category(
          id: 'relationship_field_nervous',
          label: 'Relationship Field Nervous',
          icon: Icons.grain,
          imagePath: 'assets/images/energy/relationship_field/internal/relationship_field_nervous.webp',
        ),
        Category(
          id: 'relationship_field_roles',
          label: 'Relationship Field Roles',
          icon: Icons.people,
          imagePath: 'assets/images/energy/relationship_field/internal/relationship_field_roles.webp',
        ),
        Category(
          id: 'trauma_distorsion_internal',
          label: 'Trauma Distorsion',
          icon: Icons.warning,
          imagePath: 'assets/images/energy/relationship_field/internal/trauma_distorsion.webp',
        ),
      ];

      // External subcategories
      List<Category> externalSubs = [
        Category(
          id: 'emotional_distortions',
          label: 'Emotional Distortions',
          icon: Icons.sentiment_dissatisfied,
          imagePath: 'assets/images/energy/relationship_field/external/emotional_distortions.webp',
        ),
        Category(
          id: 'nervous_system_distortion',
          label: 'Nervous System Distortion',
          icon: Icons.grain,
          imagePath: 'assets/images/energy/relationship_field/external/nervous_system_distortion.webp',
        ),
        Category(
          id: 'role_distortion',
          label: 'Role Distortion',
          icon: Icons.people,
          imagePath: 'assets/images/energy/relationship_field/external/role_distortion.webp',
        ),
        Category(
          id: 'trauma_distorsion_external',
          label: 'Trauma Distorsion',
          icon: Icons.warning,
          imagePath: 'assets/images/energy/relationship_field/external/trauma_distorsion.webp',
        ),
      ];

      relationshipFieldSubcategories = [
        Category(
          id: 'internal',
          label: 'Internal',
          icon: Icons.person,
          subcategories: internalSubs,
        ),
        Category(
          id: 'external',
          label: 'External',
          icon: Icons.people_outline,
          subcategories: externalSubs,
        ),
      ];
    }

    // Define statements subcategories for Horse, Dog, Cat, and Bird
    List<Category> statementsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      statementsSubcategories = [
        Category(
          id: 'belief_loops',
          label: 'Belief Loops',
          icon: Icons.loop,
          imagePath: 'assets/images/energy/statements/belief_loops.webp',
        ),
        Category(
          id: 'expectation_patterns',
          label: 'Expectation Patterns',
          icon: Icons.rule,
          imagePath: 'assets/images/energy/statements/expectation_patterns.webp',
        ),
        Category(
          id: 'fear_of_patterns',
          label: 'Fear Of Patterns',
          icon: Icons.warning,
          imagePath: 'assets/images/energy/statements/fear_of_patterns.webp',
        ),
        Category(
          id: 'suggestion_imprints',
          label: 'Suggestion Imprints',
          icon: Icons.lightbulb,
          imagePath: 'assets/images/energy/statements/suggestion_imprints.webp',
        ),
      ];
    }

    // Define unresolved emotions subcategories for Horse, Dog, Cat, and Bird
    List<Category> unresolvedEmotionsSubcategories = [];
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      unresolvedEmotionsSubcategories = [
        Category(
          id: 'primary_unresolved_emotions',
          label: 'Primary Unresolved Emotions',
          icon: Icons.sentiment_dissatisfied,
          imagePath: 'assets/images/energy/unresolved_emotions/primary_unresolved_emotions.webp',
        ),
        Category(
          id: 'unresolved_relational_emotions',
          label: 'Unresolved Relational Emotions',
          icon: Icons.heart_broken,
          imagePath: 'assets/images/energy/unresolved_emotions/unresolved_relational_emotions.webp',
        ),
        Category(
          id: 'unresolved_suppressed_emotions',
          label: 'Unresolved Suppressed Emotions',
          icon: Icons.lock,
          imagePath: 'assets/images/energy/unresolved_emotions/unresolved_suppressed_emotions.webp',
        ),
        Category(
          id: 'unresolved_survival_emotions',
          label: 'Unresolved Survival Emotions',
          icon: Icons.warning,
          imagePath: 'assets/images/energy/unresolved_emotions/unresolved_survival_emotions.webp',
        ),
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
      Category(
        id: 'core_imprints',
        label: 'Core Imprints',
        icon: Icons.fingerprint,
        imagePath: 'assets/images/energy/core_imprints.webp',
        subcategories: coreImprintsSubcategories,
      ),
      Category(
        id: 'energy_attachments',
        label: 'Energy Attachments',
        icon: Icons.link,
        imagePath: 'assets/images/energy/energy_attachments.webp',
        subcategories: energyAttachmentsSubcategories,
      ),
      Category(
        id: 'entities_spirits',
        label: 'Entities & Spirits',
        icon: Icons.visibility_off,
        imagePath: 'assets/images/energy/entities_spirits.webp',
        subcategories: entitiesSpiritsSubcategories,
      ),
      Category(
        id: 'positive_integration',
        label: 'Positive Integration',
        icon: Icons.add_circle,
        imagePath: 'assets/images/energy/positive_integration.webp',
        subcategories: positiveIntegrationSubcategories,
      ),
      Category(
        id: 'post_traumatic',
        label: 'Post Traumatic',
        icon: Icons.healing,
        imagePath: 'assets/images/energy/post_traumatic.webp',
        subcategories: postTraumaticSubcategories,
      ),
      Category(
        id: 'relationship_field',
        label: 'Relationship Field',
        icon: Icons.people,
        imagePath: 'assets/images/energy/relationship_field.webp',
        subcategories: relationshipFieldSubcategories,
      ),
      Category(
        id: 'statements',
        label: 'Statements',
        icon: Icons.chat,
        imagePath: 'assets/images/energy/statements.webp',
        subcategories: statementsSubcategories,
      ),
      Category(
        id: 'contracts_vows',
        label: 'Contracts & Vows',
        icon: Icons.description,
        imagePath: 'assets/images/energy/contracts_vows.webp',
        subcategories: contractsVowsSubcategories,
      ),
      Category(
        id: 'energetic_pathways',
        label: 'Energetic Pathways',
        icon: Icons.route,
        imagePath: 'assets/images/energy/energetic_pathways.webp',
        subcategories: energeticPathwaysSubcategories,
      ),
      Category(
        id: 'portals_energy_gateways',
        label: 'Portals & Energy Gateways',
        icon: Icons.meeting_room,
        imagePath: 'assets/images/energy/portals_energy_gateways.webp',
        subcategories: portalsEnergyGatewaysSubcategories,
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

import 'package:flutter/material.dart';
import '../category.dart';

class HolisticRemediesCategories {
  // Cache for generated subcategories to avoid regeneration
  static final Map<String, List<Category>> _cache = {};

  /// Get holistic remedies categories for a specific animal with caching
  static List<Category> getHolisticRemediesCategoriesForAnimal(String animalId) {
    print("sameed - getHolisticRemediesCategoriesForAnimal - animalId: $animalId");
    
    // Check cache first
    if (_cache.containsKey(animalId)) {
      print("sameed - returning cached holistic remedies categories for $animalId");
      return _cache[animalId]!;
    }
    
    // Define Bach Flowers subcategories
    List<Category> bachFlowersSubcategories = [];
    
    // Define Crystals subcategories
    List<Category> crystalsSubcategories = [];
    
    // Define Australian Bush Flowers subcategories
    List<Category> australianBushFlowersSubcategories = [];

    // Define Essential Oils subcategories (shared across all animals)
    List<Category> essentialOilsSubcategories = [
      Category(
        id: 'calming_and_sleep_essential_oils',
        label: 'Calming and Sleep',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
      ),
      Category(
        id: 'focus_and_behaviour_essential_oils',
        label: 'Focus and Behaviour',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
      ),
      Category(
        id: 'grounding_and_safety_essential_oils',
        label: 'Grounding and Safety',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
      ),
      Category(
        id: 'heart_and_connection_essential_oils',
        label: 'Heart and Connection',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
      ),
      Category(
        id: 'physical_support_essential_oils',
        label: 'Physical Support',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
      ),
      Category(
        id: 'trauma_release_essential_oils',
        label: 'Trauma Release',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
      ),
    ];

    // Define Homeopathy subcategories (shared across all animals)
    List<Category> homeopathySubcategories = [
      Category(
        id: 'chronic',
        label: 'Chronic',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'emotional',
        label: 'Emotional',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'immune',
        label: 'Immune',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'inflammation',
        label: 'Inflammation',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'pain',
        label: 'Pain',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
      Category(
        id: 'trauma',
        label: 'Trauma',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
      ),
    ];

    // Define Supplements & Herbs subcategories (shared across all animals)
    List<Category> supplementsHerbsSubcategories = [
      Category(
        id: 'common_supplements',
        label: 'Common Supplements',
        icon: Icons.medical_services,
        imagePath: 'assets/images/holistic_remedies/supplements_herbs.webp',
      ),
      Category(
        id: 'core_supplements',
        label: 'Core Supplements',
        icon: Icons.medical_services,
        imagePath: 'assets/images/holistic_remedies/supplements_herbs.webp',
      ),
      Category(
        id: 'supplements_TCM',
        label: 'Supplements TCM',
        icon: Icons.medical_services,
        imagePath: 'assets/images/holistic_remedies/supplements_herbs.webp',
      ),
    ];

    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      String animal = animalId.toLowerCase();
      
      // Bach Flowers - Fear subcategories
      List<Category> fearSubs = [
        Category(
          id: 'aspen',
          label: 'Aspen',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'cherry_plum',
          label: 'Cherry Plum',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'mimulus',
          label: 'Mimulus',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'red_chestnut',
          label: 'Red Chestnut',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'rock_rose',
          label: 'Rock Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      // Bach Flowers - Uncertainty subcategories
      List<Category> uncertaintySubs = [
        Category(
          id: 'cerato',
          label: 'Cerato',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'gentian',
          label: 'Gentian',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'gorse',
          label: 'Gorse',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'hornbeam',
          label: 'Hornbeam',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'scleranthus',
          label: 'Scleranthus',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'wild_oat',
          label: 'Wild Oat',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      // Bach Flowers - Lack of Interest subcategories
      List<Category> lackOfInterestSubs = [
        Category(
          id: 'chestnut_bud',
          label: 'Chestnut Bud',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'clematis',
          label: 'Clematis',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'honeysuckle',
          label: 'Honeysuckle',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'mustard',
          label: 'Mustard',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'olive',
          label: 'Olive',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'white_chestnut',
          label: 'White Chestnut',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'wild_rose',
          label: 'Wild Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      // Bach Flowers - Loneliness subcategories
      List<Category> lonelinessSubs = [
        Category(
          id: 'heather',
          label: 'Heather',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'impatiens',
          label: 'Impatiens',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'water_violet',
          label: 'Water Violet',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      // Bach Flowers - Oversensitivity subcategories
      List<Category> oversensitivitySubs = [
        Category(
          id: 'agrimony',
          label: 'Agrimony',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'centaury',
          label: 'Centaury',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'holly',
          label: 'Holly',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'walnut',
          label: 'Walnut',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      // Bach Flowers - Despondency and Despair subcategories
      List<Category> despondencyAndDespairSubs = [
        Category(
          id: 'crab_apple',
          label: 'Crab Apple',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'elm',
          label: 'Elm',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'larch',
          label: 'Larch',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'oak',
          label: 'Oak',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'pine',
          label: 'Pine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'star_of_bethlehem',
          label: 'Star of Bethlehem',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'sweet_chestnut',
          label: 'Sweet Chestnut',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'willow',
          label: 'Willow',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      // Bach Flowers - Over Care for Others subcategories
      List<Category> overCareForOthersSubs = [
        Category(
          id: 'beech',
          label: 'Beech',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'chicory',
          label: 'Chicory',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'rock_water',
          label: 'Rock Water',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'vervain',
          label: 'Vervain',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
        Category(
          id: 'vine',
          label: 'Vine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        ),
      ];

      bachFlowersSubcategories = [
        Category(
          id: 'fear',
          label: 'Fear',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: fearSubs,
        ),
        Category(
          id: 'uncertainty',
          label: 'Uncertainty',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: uncertaintySubs,
        ),
        Category(
          id: 'lack_of_interest',
          label: 'Lack of Interest',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: lackOfInterestSubs,
        ),
        Category(
          id: 'loneliness',
          label: 'Loneliness',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: lonelinessSubs,
        ),
        Category(
          id: 'oversensitivity',
          label: 'Oversensitivity',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: oversensitivitySubs,
        ),
        Category(
          id: 'despondency_and_despair',
          label: 'Despondency and Despair',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: despondencyAndDespairSubs,
        ),
        Category(
          id: 'over_care_for_others',
          label: 'Over Care for Others',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          subcategories: overCareForOthersSubs,
        ),
      ];
      
      // Crystals - Animal-Human Connection subcategories
      List<Category> animalHumanConnectionSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/amethyst.webp',
        ),
        Category(
          id: 'blue_lace_agate',
          label: 'Blue Lace Agate',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/blue_lace_agate.webp',
        ),
        Category(
          id: 'chrysocolla',
          label: 'Chrysocolla',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/chrysocolla.webp',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/clear_quartz.webp',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/green_aventurine.webp',
        ),
        Category(
          id: 'labradorite',
          label: 'Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/labradorite.webp',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/lepidolite.webp',
        ),
        Category(
          id: 'rhodonite',
          label: 'Rhodonite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/rhodonite.webp',
        ),
        Category(
          id: 'sodalite',
          label: 'Sodalite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/animal_human_connection/sodalite.webp',
        ),
      ];

      // Crystals - Calming and Sleep subcategories
      List<Category> calmingAndSleepSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/amethyst.webp',
        ),
        Category(
          id: 'angelite',
          label: 'Angelite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/angelite.webp',
        ),
        Category(
          id: 'black_tourmaline',
          label: 'Black Tourmaline',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/black_tourmaline.webp',
        ),
        Category(
          id: 'blue_calcite',
          label: 'Blue Calcite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/blue_calcite.webp',
        ),
        Category(
          id: 'howlite',
          label: 'Howlite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/howlite.webp',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/lepidolite.webp',
        ),
        Category(
          id: 'moonstone',
          label: 'Moonstone',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/moonstone.webp',
        ),
        Category(
          id: 'pink_opal',
          label: 'Pink Opal',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/pink_opal.webp',
        ),
        Category(
          id: 'selenite',
          label: 'Selenite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/selenite.webp',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/calming_and_sleep/smoky_quartz.webp',
        ),
      ];

      // Crystals - Chakra Specific subcategories
      List<Category> chakraSpecificSubs = [
        Category(
          id: 'cosmic_gateway_chakra_labradorite',
          label: 'Cosmic Gateway Chakra Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/cosmic_gateway_chakra_labradorite.webp',
        ),
        Category(
          id: 'crown_chakra_clear_quartz',
          label: 'Crown Chakra Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/crown_chakra_clear_quartz.webp',
        ),
        Category(
          id: 'earth_star_chakra_black_tourmaline',
          label: 'Earth Star Chakra Black Tourmaline',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/earth_star_chakra_black_tourmaline.webp',
        ),
        Category(
          id: 'heart_chakra_rose_quartz',
          label: 'Heart Chakra Rose Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/heart_chakra_rose_quartz.webp',
        ),
        Category(
          id: 'root_chakra_smoky_quartz',
          label: 'Root Chakra Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/root_chakra_smoky_quartz.webp',
        ),
        Category(
          id: 'sacral_chakra_carnelian',
          label: 'Sacral Chakra Carnelian',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/sacral_chakra_carnelian.webp',
        ),
        Category(
          id: 'solar_plexus_chakra_tigers_eye',
          label: 'Solar Plexus Chakra Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/solar_plexus_chakra_tigers_eye.webp',
        ),
        Category(
          id: 'soul_star_chakra_selenite',
          label: 'Soul Star Chakra Selenite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/soul_star_chakra_selenite.webp',
        ),
        Category(
          id: 'third_eye_chakra_amethyst',
          label: 'Third Eye Chakra Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/third_eye_chakra_amethyst.webp',
        ),
        Category(
          id: 'throat_chakra_blue_lace_agate',
          label: 'Throat Chakra Blue Lace Agate',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/chakra_specific/throat_chakra_blue_lace_agate.webp',
        ),
      ];

      // Crystals - Emotional Healing subcategories
      List<Category> emotionalHealingSubs = [
        Category(
          id: 'amazonite',
          label: 'Amazonite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/amazonite.webp',
        ),
        Category(
          id: 'chrysoprase',
          label: 'Chrysoprase',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/chrysoprase.webp',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/green_aventurine.webp',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/lepidolite.webp',
        ),
        Category(
          id: 'malachite',
          label: 'Malachite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/malachite.webp',
        ),
        Category(
          id: 'pink_opal',
          label: 'Pink Opal',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/pink_opal.webp',
        ),
        Category(
          id: 'rhodonite',
          label: 'Rhodonite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/rhodonite.webp',
        ),
        Category(
          id: 'rose_quartz',
          label: 'Rose Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/rose_quartz.webp',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/emotional_healing/smoky_quartz.webp',
        ),
      ];

      // Crystals - Energy and Vitality subcategories
      List<Category> energyAndVitalitySubs = [
        Category(
          id: 'bloodstone',
          label: 'Bloodstone',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/bloodstone.webp',
        ),
        Category(
          id: 'carnelian',
          label: 'Carnelian',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/carnelian.webp',
        ),
        Category(
          id: 'citrine',
          label: 'Citrine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/citrine.webp',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/clear_quartz.webp',
        ),
        Category(
          id: 'garnet',
          label: 'Garnet',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/garnet.webp',
        ),
        Category(
          id: 'hematite',
          label: 'Hematite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/hematite.webp',
        ),
        Category(
          id: 'pyrite',
          label: 'Pyrite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/pyrite.webp',
        ),
        Category(
          id: 'red_jasper',
          label: 'Red Jasper',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/red_jasper.webp',
        ),
        Category(
          id: 'sunstone',
          label: 'Sunstone',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/sunstone.webp',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/energy_and_vitality/tigers_eye.webp',
        ),
      ];

      // Crystals - Grounding and Protection subcategories
      List<Category> groundingAndProtectionSubs = [
        Category(
          id: 'black_tourmaline',
          label: 'Black Tourmaline',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/black_tourmaline.webp',
        ),
        Category(
          id: 'bloodstone',
          label: 'Bloodstone',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/bloodstone.webp',
        ),
        Category(
          id: 'hematite',
          label: 'Hematite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/hematite.webp',
        ),
        Category(
          id: 'obsidian',
          label: 'Obsidian',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/obsidian.webp',
        ),
        Category(
          id: 'onyx',
          label: 'Onyx',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/onyx.webp',
        ),
        Category(
          id: 'pyrite',
          label: 'Pyrite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/pyrite.webp',
        ),
        Category(
          id: 'red_jasper',
          label: 'Red Jasper',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/red_jasper.webp',
        ),
        Category(
          id: 'shungite',
          label: 'Shungite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/shungite.webp',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/smoky_quartz.webp',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/grounding_and_protection/tigers_eye.webp',
        ),
      ];

      // Crystals - Manifestation and Abundance subcategories
      List<Category> manifestationAndAbundanceSubs = [
        Category(
          id: 'carnelian',
          label: 'Carnelian',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/carnelian.webp',
        ),
        Category(
          id: 'citrine',
          label: 'Citrine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/citrine.webp',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/clear_quartz.webp',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/green_aventurine.webp',
        ),
        Category(
          id: 'jade',
          label: 'Jade',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/jade.webp',
        ),
        Category(
          id: 'labradorite',
          label: 'Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/labradorite.webp',
        ),
        Category(
          id: 'moss_agate',
          label: 'Moss Agate',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/moss_agate.webp',
        ),
        Category(
          id: 'pyrite',
          label: 'Pyrite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/pyrite.webp',
        ),
        Category(
          id: 'sunstone',
          label: 'Sunstone',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/sunstone.webp',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/manifestation_and_abundance/tigers_eye.webp',
        ),
      ];

      // Crystals - Mental Clarity and Focus subcategories
      List<Category> mentalClarityAndFocusSubs = [
        Category(
          id: 'amazonite',
          label: 'Amazonite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/amazonite.webp',
        ),
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/amethyst.webp',
        ),
        Category(
          id: 'blue_kyanite',
          label: 'Blue Kyanite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/blue_kyanite.webp',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/clear_quartz.webp',
        ),
        Category(
          id: 'fluorite',
          label: 'Fluorite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/fluorite.webp',
        ),
        Category(
          id: 'hematite',
          label: 'Hematite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/hematite.webp',
        ),
        Category(
          id: 'lapis_lazuli',
          label: 'Lapis Lazuli',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/lapis_lazuli.webp',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/smoky_quartz.webp',
        ),
        Category(
          id: 'sodalite',
          label: 'Sodalite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/sodalite.webp',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/mental_clarity_and_focus/tigers_eye.webp',
        ),
      ];

      // Crystals - Spiritual Connection subcategories
      List<Category> spiritualConnectionSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/amethyst.webp',
        ),
        Category(
          id: 'angelite',
          label: 'Angelite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/angelite.webp',
        ),
        Category(
          id: 'apophyllite',
          label: 'Apophyllite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/apophyllite.webp',
        ),
        Category(
          id: 'blue_kyanite',
          label: 'Blue Kyanite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/blue_kyanite.webp',
        ),
        Category(
          id: 'celestite',
          label: 'Celestite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/celestite.webp',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/clear_quartz.webp',
        ),
        Category(
          id: 'kunzite',
          label: 'Kunzite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/kunzite.webp',
        ),
        Category(
          id: 'labradorite',
          label: 'Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/labradorite.webp',
        ),
        Category(
          id: 'lapis_lazuli',
          label: 'Lapis Lazuli',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/lapis_lazuli.webp',
        ),
        Category(
          id: 'selenite',
          label: 'Selenite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/spiritual_connection/selenite.webp',
        ),
      ];

      // Crystals - Trauma and Heart Healing subcategories
      List<Category> traumaAndHeartHealingSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/amethyst.webp',
        ),
        Category(
          id: 'chrysoprase',
          label: 'Chrysoprase',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/chrysoprase.webp',
        ),
        Category(
          id: 'emerald',
          label: 'Emerald',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/emerald.webp',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/green_aventurine.webp',
        ),
        Category(
          id: 'kunzite',
          label: 'Kunzite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/kunzite.webp',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/lepidolite.webp',
        ),
        Category(
          id: 'malachite',
          label: 'Malachite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/malachite.webp',
        ),
        Category(
          id: 'pink_opal',
          label: 'Pink Opal',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/pink_opal.webp',
        ),
        Category(
          id: 'rhodonite',
          label: 'Rhodonite',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/rhodonite.webp',
        ),
        Category(
          id: 'rose_quartz',
          label: 'Rose Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/crystals/trauma_and_heart_healing/rose_quartz.webp',
        ),
      ];

      crystalsSubcategories = [
        Category(
          id: 'animal_human_connection',
          label: 'Animal-Human Connection',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: animalHumanConnectionSubs,
        ),
        Category(
          id: 'calming_and_sleep',
          label: 'Calming and Sleep',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: calmingAndSleepSubs,
        ),
        Category(
          id: 'chakra_specific',
          label: 'Chakra Specific',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: chakraSpecificSubs,
        ),
        Category(
          id: 'emotional_healing',
          label: 'Emotional Healing',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: emotionalHealingSubs,
        ),
        Category(
          id: 'energy_and_vitality',
          label: 'Energy and Vitality',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: energyAndVitalitySubs,
        ),
        Category(
          id: 'grounding_and_protection',
          label: 'Grounding and Protection',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: groundingAndProtectionSubs,
        ),
        Category(
          id: 'manifestation_and_abundance',
          label: 'Manifestation and Abundance',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: manifestationAndAbundanceSubs,
        ),
        Category(
          id: 'mental_clarity_and_focus',
          label: 'Mental Clarity and Focus',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: mentalClarityAndFocusSubs,
        ),
        Category(
          id: 'spiritual_connection',
          label: 'Spiritual Connection',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: spiritualConnectionSubs,
        ),
        Category(
          id: 'trauma_and_heart_healing',
          label: 'Trauma and Heart Healing',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/crystals.webp',
          subcategories: traumaAndHeartHealingSubs,
        ),
      ];
      
      // A to B subcategories
      List<Category> aToBSubs = [
        Category(
          id: 'angelsword',
          label: 'Angelsword',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'banksia_robur',
          label: 'Banksia Robur',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'bauhinia',
          label: 'Bauhinia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'billy_goat_plum',
          label: 'Billy Goat Plum',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'black_eyed_susan',
          label: 'Black-Eyed Susan',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'bluebell',
          label: 'Bluebell',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'boronia',
          label: 'Boronia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'bottlebrush',
          label: 'Bottlebrush',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'bush_fuchsia',
          label: 'Bush Fuchsia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'bush_gardenia',
          label: 'Bush Gardenia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'bush_iris',
          label: 'Bush Iris',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      // C to D subcategories
      List<Category> cToDSubs = [
        Category(
          id: 'christmas_bell',
          label: 'Christmas Bell',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'crowea',
          label: 'Crowea',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'dagger_hakea',
          label: 'Dagger Hakea',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'dog_rose',
          label: 'Dog Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'dog_rose_of_the_wild_forces',
          label: 'Dog Rose of the Wild Forces',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'five_corners',
          label: 'Five Corners',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'flannel_flower',
          label: 'Flannel Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'fringed_violet',
          label: 'Fringed Violet',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'freshwater_mangrove',
          label: 'Freshwater Mangrove',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'fringe_lily',
          label: 'Fringe Lily',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      // E to H subcategories
      List<Category> eToHSubs = [
        Category(
          id: 'green_spider_orchid',
          label: 'Green Spider Orchid',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'grey_spider_flower',
          label: 'Grey Spider Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'gymea_lily',
          label: 'Gymea Lily',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'hakea',
          label: 'Hakea',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'hibbertia',
          label: 'Hibbertia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'illawarra_flame_tree',
          label: 'Illawarra Flame Tree',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'isopogon',
          label: 'Isopogon',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'jacaranda',
          label: 'Jacaranda',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'kangaroo_paw',
          label: 'Kangaroo Paw',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'kapok_bush',
          label: 'Kapok Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      // I to M subcategories
      List<Category> iToMSubs = [
        Category(
          id: 'little_flannel_flower',
          label: 'Little Flannel Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'macrocarpa',
          label: 'Macrocarpa',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'mint_bush',
          label: 'Mint Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'monga_waratah',
          label: 'Monga Waratah',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'mountain_devil',
          label: 'Mountain Devil',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'mulla_mulla',
          label: 'Mulla Mulla',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'old_man_banksia',
          label: 'Old Man Banksia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'peach_flowered_tea_tree',
          label: 'Peach Flowered Tea Tree',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'philotheca',
          label: 'Philotheca',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'pink_flannel_flower',
          label: 'Pink Flannel Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'pink_mulla_mulla',
          label: 'Pink Mulla Mulla',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      // N to R subcategories
      List<Category> nToRSubs = [
        Category(
          id: 'red_grevillea',
          label: 'Red Grevillea',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'red_helmet_orchid',
          label: 'Red Helmet Orchid',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'red_lily',
          label: 'Red Lily',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'red_suva_frangipani',
          label: 'Red Suva Frangipani',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'rough_bluebell',
          label: 'Rough Bluebell',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'she_oak',
          label: 'She Oak',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'silver_princess',
          label: 'Silver Princess',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'slender_rice_flower',
          label: 'Slender Rice Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'southern_cross',
          label: 'Southern Cross',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'spinifex',
          label: 'Spinifex',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'sturt_desert_pea',
          label: 'Sturt Desert Pea',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      // S to Z subcategories
      List<Category> sToZSubs = [
        Category(
          id: 'sturt_desert_rose',
          label: 'Sturt Desert Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'sunshine_wattle',
          label: 'Sunshine Wattle',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'sundew',
          label: 'Sundew',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'swamp_banksia',
          label: 'Swamp Banksia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'tall_mulla_mulla',
          label: 'Tall Mulla Mulla',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'turkey_bush',
          label: 'Turkey Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'waratah',
          label: 'Waratah',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'wedding_bush',
          label: 'Wedding Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'wisteria',
          label: 'Wisteria',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'wild_potato_bush',
          label: 'Wild Potato Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'yellow_cowslip_orchid',
          label: 'Yellow Cowslip Orchid',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      // Additional subcategories
      List<Category> additionalSubs = [
        Category(
          id: 'australasian_bluebell',
          label: 'Australasian Bluebell',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'brown_boronia',
          label: 'Brown Boronia',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'cognis',
          label: 'Cognis',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'dynamis',
          label: 'Dynamis',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
        Category(
          id: 'purifying_essence',
          label: 'Purifying Essence',
          icon: Icons.local_florist,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        ),
      ];

      australianBushFlowersSubcategories = [
        Category(
          id: 'a_to_b',
          label: 'A to B',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: aToBSubs,
        ),
        Category(
          id: 'c_to_d',
          label: 'C to D',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: cToDSubs,
        ),
        Category(
          id: 'e_to_h',
          label: 'E to H',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: eToHSubs,
        ),
        Category(
          id: 'i_to_m',
          label: 'I to M',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: iToMSubs,
        ),
        Category(
          id: 'n_to_r',
          label: 'N to R',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: nToRSubs,
        ),
        Category(
          id: 's_to_z',
          label: 'S to Z',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: sToZSubs,
        ),
        Category(
          id: 'additional',
          label: 'Additional',
          icon: Icons.folder,
          imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
          subcategories: additionalSubs,
        ),
      ];
    }

    // Generate categories and cache them
    final categories = [
      Category(
        id: 'bach_flowers',
        label: 'Bach Flowers',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
        subcategories: [
          Category(
            id: 'rescue_remedy',
            label: 'Rescue Remedy',
            icon: Icons.local_florist,
            imagePath: 'assets/images/holistic_remedies/bach_flowers.webp',
          ),
          ...bachFlowersSubcategories,
        ],
      ),
      Category(
        id: 'crystals',
        label: 'Crystals',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/crystals.webp',
        subcategories: crystalsSubcategories,
      ),
      Category(
        id: 'australian_bush_flowers',
        label: 'Australian Bush Flowers',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/australian_bush_flowers.webp',
        subcategories: australianBushFlowersSubcategories,
      ),
      Category(
        id: 'essential_oils',
        label: 'Essential Oils',
        icon: Icons.spa,
        imagePath: 'assets/images/holistic_remedies/essential_oils.webp',
        subcategories: essentialOilsSubcategories,
      ),
      Category(
        id: 'homeopathy',
        label: 'Homeopathy',
        icon: Icons.healing,
        imagePath: 'assets/images/holistic_remedies/homeopathy.webp',
        subcategories: homeopathySubcategories,
      ),
      Category(
        id: 'supplements_herbs',
        label: 'Supplements & Herbs',
        icon: Icons.medical_services,
        imagePath: 'assets/images/holistic_remedies/supplements_herbs.webp',
        subcategories: supplementsHerbsSubcategories,
      ),
      Category(
        id: 'animal_modalities',
        label: 'Animal Modalities',
        icon: Icons.medical_services,
        imagePath: 'assets/images/holistic_remedies/animal_modalities.webp',
      ),
    ];
    
    _cache[animalId] = categories;
    return categories;
  }

  /// Clear cache for a specific animal or all animals
  static void clearCache([String? animalId]) {
    if (animalId != null) {
      _cache.remove(animalId);
    } else {
      _cache.clear();
    }
  }
}

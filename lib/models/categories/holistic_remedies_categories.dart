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
    if (['horse', 'dog', 'cat', 'bird'].contains(animalId.toLowerCase())) {
      String animal = animalId.toLowerCase();
      
      // Bach Flowers - Fear subcategories
      List<Category> fearSubs = [
        Category(
          id: 'aspen',
          label: 'Aspen',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/fear/aspen.txt',
        ),
        Category(
          id: 'cherry_plum',
          label: 'Cherry Plum',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/fear/cherry_plum.txt',
        ),
        Category(
          id: 'mimulus',
          label: 'Mimulus',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/fear/mimulus.txt',
        ),
        Category(
          id: 'red_chestnut',
          label: 'Red Chestnut',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/fear/red_chestnut.txt',
        ),
        Category(
          id: 'rock_rose',
          label: 'Rock Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/fear/rock_rose.txt',
        ),
      ];

      // Bach Flowers - Uncertainty subcategories
      List<Category> uncertaintySubs = [
        Category(
          id: 'cerato',
          label: 'Cerato',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/uncertainty/cerato.txt',
        ),
        Category(
          id: 'gentian',
          label: 'Gentian',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/uncertainty/gentian.txt',
        ),
        Category(
          id: 'gorse',
          label: 'Gorse',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/uncertainty/gorse.txt',
        ),
        Category(
          id: 'hornbeam',
          label: 'Hornbeam',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/uncertainty/hornbeam.txt',
        ),
        Category(
          id: 'scleranthus',
          label: 'Scleranthus',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/uncertainty/scleranthus.txt',
        ),
        Category(
          id: 'wild_oat',
          label: 'Wild Oat',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/uncertainty/wild_oat.txt',
        ),
      ];

      // Bach Flowers - Lack of Interest subcategories
      List<Category> lackOfInterestSubs = [
        Category(
          id: 'chestnut_bud',
          label: 'Chestnut Bud',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/chestnut_bud.txt',
        ),
        Category(
          id: 'clematis',
          label: 'Clematis',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/clematis.txt',
        ),
        Category(
          id: 'honeysuckle',
          label: 'Honeysuckle',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/honeysuckle.txt',
        ),
        Category(
          id: 'mustard',
          label: 'Mustard',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/mustard.txt',
        ),
        Category(
          id: 'olive',
          label: 'Olive',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/olive.txt',
        ),
        Category(
          id: 'white_chestnut',
          label: 'White Chestnut',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/white_chestnut.txt',
        ),
        Category(
          id: 'wild_rose',
          label: 'Wild Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/lack_of_interest/wild_rose.txt',
        ),
      ];

      // Bach Flowers - Loneliness subcategories
      List<Category> lonelinessSubs = [
        Category(
          id: 'heather',
          label: 'Heather',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/loneliness/heather.txt',
        ),
        Category(
          id: 'impatiens',
          label: 'Impatiens',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/loneliness/impatiens.txt',
        ),
        Category(
          id: 'water_violet',
          label: 'Water Violet',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/loneliness/water_violet.txt',
        ),
      ];

      // Bach Flowers - Oversensitivity subcategories
      List<Category> oversensitivitySubs = [
        Category(
          id: 'agrimony',
          label: 'Agrimony',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/oversensitivity/agrimony.txt',
        ),
        Category(
          id: 'centaury',
          label: 'Centaury',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/oversensitivity/centaury.txt',
        ),
        Category(
          id: 'holly',
          label: 'Holly',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/oversensitivity/holly.txt',
        ),
        Category(
          id: 'walnut',
          label: 'Walnut',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/oversensitivity/walnut.txt',
        ),
      ];

      // Bach Flowers - Despondency and Despair subcategories
      List<Category> despondencyAndDespairSubs = [
        Category(
          id: 'crab_apple',
          label: 'Crab Apple',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/crab_apple.txt',
        ),
        Category(
          id: 'elm',
          label: 'Elm',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/elm.txt',
        ),
        Category(
          id: 'larch',
          label: 'Larch',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/larch.txt',
        ),
        Category(
          id: 'oak',
          label: 'Oak',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/oak.txt',
        ),
        Category(
          id: 'pine',
          label: 'Pine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/pine.txt',
        ),
        Category(
          id: 'star_of_bethlehem',
          label: 'Star of Bethlehem',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/star_of_bethlehem.txt',
        ),
        Category(
          id: 'sweet_chestnut',
          label: 'Sweet Chestnut',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/sweet_chestnut.txt',
        ),
        Category(
          id: 'willow',
          label: 'Willow',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/despondency_and_despair/willow.txt',
        ),
      ];

      // Bach Flowers - Over Care for Others subcategories
      List<Category> overCareForOthersSubs = [
        Category(
          id: 'beech',
          label: 'Beech',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/over_care_for_others/beech.txt',
        ),
        Category(
          id: 'chicory',
          label: 'Chicory',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/over_care_for_others/chicory.txt',
        ),
        Category(
          id: 'rock_water',
          label: 'Rock Water',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/over_care_for_others/rock_water.txt',
        ),
        Category(
          id: 'vervain',
          label: 'Vervain',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/over_care_for_others/vervain.txt',
        ),
        Category(
          id: 'vine',
          label: 'Vine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/bach_flowers/over_care_for_others/vine.txt',
        ),
      ];

      bachFlowersSubcategories = [
        Category(
          id: 'fear',
          label: 'Fear',
          icon: Icons.folder,
          subcategories: fearSubs,
        ),
        Category(
          id: 'uncertainty',
          label: 'Uncertainty',
          icon: Icons.folder,
          subcategories: uncertaintySubs,
        ),
        Category(
          id: 'lack_of_interest',
          label: 'Lack of Interest',
          icon: Icons.folder,
          subcategories: lackOfInterestSubs,
        ),
        Category(
          id: 'loneliness',
          label: 'Loneliness',
          icon: Icons.folder,
          subcategories: lonelinessSubs,
        ),
        Category(
          id: 'oversensitivity',
          label: 'Oversensitivity',
          icon: Icons.folder,
          subcategories: oversensitivitySubs,
        ),
        Category(
          id: 'despondency_and_despair',
          label: 'Despondency and Despair',
          icon: Icons.folder,
          subcategories: despondencyAndDespairSubs,
        ),
        Category(
          id: 'over_care_for_others',
          label: 'Over Care for Others',
          icon: Icons.folder,
          subcategories: overCareForOthersSubs,
        ),
      ];
      
      // Crystals - Animal-Human Connection subcategories
      List<Category> animalHumanConnectionSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/amethyst.txt',
        ),
        Category(
          id: 'blue_lace_agate',
          label: 'Blue Lace Agate',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/blue_lace_agate.txt',
        ),
        Category(
          id: 'chrysocolla',
          label: 'Chrysocolla',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/chrysocolla.txt',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/clear_quartz.txt',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/green_aventurine.txt',
        ),
        Category(
          id: 'labradorite',
          label: 'Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/labradorite.txt',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/lepidolite.txt',
        ),
        Category(
          id: 'rhodonite',
          label: 'Rhodonite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/rhodonite.txt',
        ),
        Category(
          id: 'sodalite',
          label: 'Sodalite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/animal_human_connection/sodalite.txt',
        ),
      ];

      // Crystals - Calming and Sleep subcategories
      List<Category> calmingAndSleepSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/amethyst.txt',
        ),
        Category(
          id: 'angelite',
          label: 'Angelite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/angelite.txt',
        ),
        Category(
          id: 'black_tourmaline',
          label: 'Black Tourmaline',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/black_tourmaline.txt',
        ),
        Category(
          id: 'blue_calcite',
          label: 'Blue Calcite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/blue_calcite.txt',
        ),
        Category(
          id: 'howlite',
          label: 'Howlite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/howlite.txt',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/lepidolite.txt',
        ),
        Category(
          id: 'moonstone',
          label: 'Moonstone',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/moonstone.txt',
        ),
        Category(
          id: 'pink_opal',
          label: 'Pink Opal',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/pink_opal.txt',
        ),
        Category(
          id: 'selenite',
          label: 'Selenite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/selenite.txt',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/calming_and_sleep/smoky_quartz.txt',
        ),
      ];

      // Crystals - Chakra Specific subcategories
      List<Category> chakraSpecificSubs = [
        Category(
          id: 'cosmic_gateway_chakra_labradorite',
          label: 'Cosmic Gateway Chakra Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/cosmic_gateway_chakra_labradorite.txt',
        ),
        Category(
          id: 'crown_chakra_clear_quartz',
          label: 'Crown Chakra Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/crown_chakra_clear_quartz.txt',
        ),
        Category(
          id: 'earth_star_chakra_black_tourmaline',
          label: 'Earth Star Chakra Black Tourmaline',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/earth_star_chakra_black_tourmaline.txt',
        ),
        Category(
          id: 'heart_chakra_rose_quartz',
          label: 'Heart Chakra Rose Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/heart_chakra_rose_quartz.txt',
        ),
        Category(
          id: 'root_chakra_smoky_quartz',
          label: 'Root Chakra Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/root_chakra_smoky_quartz.txt',
        ),
        Category(
          id: 'sacral_chakra_carnelian',
          label: 'Sacral Chakra Carnelian',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/sacral_chakra_carnelian.txt',
        ),
        Category(
          id: 'solar_plexus_chakra_tigers_eye',
          label: 'Solar Plexus Chakra Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/solar_plexus_chakra_tigers_eye.txt',
        ),
        Category(
          id: 'soul_star_chakra_selenite',
          label: 'Soul Star Chakra Selenite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/soul_star_chakra_selenite.txt',
        ),
        Category(
          id: 'third_eye_chakra_amethyst',
          label: 'Third Eye Chakra Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/third_eye_chakra_amethyst.txt',
        ),
        Category(
          id: 'throat_chakra_blue_lace_agate',
          label: 'Throat Chakra Blue Lace Agate',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/chakra_specific/throat_chakra_blue_lace_agate.txt',
        ),
      ];

      // Crystals - Emotional Healing subcategories
      List<Category> emotionalHealingSubs = [
        Category(
          id: 'amazonite',
          label: 'Amazonite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/amazonite.txt',
        ),
        Category(
          id: 'chrysoprase',
          label: 'Chrysoprase',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/chrysoprase.txt',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/green_aventurine.txt',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/lepidolite.txt',
        ),
        Category(
          id: 'malachite',
          label: 'Malachite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/malachite.txt',
        ),
        Category(
          id: 'pink_opal',
          label: 'Pink Opal',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/pink_opal.txt',
        ),
        Category(
          id: 'rhodonite',
          label: 'Rhodonite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/rhodonite.txt',
        ),
        Category(
          id: 'rose_quartz',
          label: 'Rose Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/rose_quartz.txt',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/emotional_healing/smoky_quartz.txt',
        ),
      ];

      // Crystals - Energy and Vitality subcategories
      List<Category> energyAndVitalitySubs = [
        Category(
          id: 'bloodstone',
          label: 'Bloodstone',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/bloodstone.txt',
        ),
        Category(
          id: 'carnelian',
          label: 'Carnelian',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/carnelian.txt',
        ),
        Category(
          id: 'citrine',
          label: 'Citrine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/citrine.txt',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/clear_quartz.txt',
        ),
        Category(
          id: 'garnet',
          label: 'Garnet',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/garnet.txt',
        ),
        Category(
          id: 'hematite',
          label: 'Hematite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/hematite.txt',
        ),
        Category(
          id: 'pyrite',
          label: 'Pyrite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/pyrite.txt',
        ),
        Category(
          id: 'red_jasper',
          label: 'Red Jasper',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/red_jasper.txt',
        ),
        Category(
          id: 'sunstone',
          label: 'Sunstone',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/sunstone.txt',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/energy_and_vitality/tigers_eye.txt',
        ),
      ];

      // Crystals - Grounding and Protection subcategories
      List<Category> groundingAndProtectionSubs = [
        Category(
          id: 'black_tourmaline',
          label: 'Black Tourmaline',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/black_tourmaline.txt',
        ),
        Category(
          id: 'bloodstone',
          label: 'Bloodstone',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/bloodstone.txt',
        ),
        Category(
          id: 'hematite',
          label: 'Hematite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/hematite.txt',
        ),
        Category(
          id: 'obsidian',
          label: 'Obsidian',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/obsidian.txt',
        ),
        Category(
          id: 'onyx',
          label: 'Onyx',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/onyx.txt',
        ),
        Category(
          id: 'pyrite',
          label: 'Pyrite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/pyrite.txt',
        ),
        Category(
          id: 'red_jasper',
          label: 'Red Jasper',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/red_jasper.txt',
        ),
        Category(
          id: 'shungite',
          label: 'Shungite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/shungite.txt',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/smoky_quartz.txt',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/grounding_and_protection/tigers_eye.txt',
        ),
      ];

      // Crystals - Manifestation and Abundance subcategories
      List<Category> manifestationAndAbundanceSubs = [
        Category(
          id: 'carnelian',
          label: 'Carnelian',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/carnelian.txt',
        ),
        Category(
          id: 'citrine',
          label: 'Citrine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/citrine.txt',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/clear_quartz.txt',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/green_aventurine.txt',
        ),
        Category(
          id: 'jade',
          label: 'Jade',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/jade.txt',
        ),
        Category(
          id: 'labradorite',
          label: 'Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/labradorite.txt',
        ),
        Category(
          id: 'moss_agate',
          label: 'Moss Agate',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/moss_agate.txt',
        ),
        Category(
          id: 'pyrite',
          label: 'Pyrite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/pyrite.txt',
        ),
        Category(
          id: 'sunstone',
          label: 'Sunstone',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/sunstone.txt',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/manifestation_and_abundance/tigers_eye.txt',
        ),
      ];

      // Crystals - Mental Clarity and Focus subcategories
      List<Category> mentalClarityAndFocusSubs = [
        Category(
          id: 'amazonite',
          label: 'Amazonite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/amazonite.txt',
        ),
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/amethyst.txt',
        ),
        Category(
          id: 'blue_kyanite',
          label: 'Blue Kyanite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/blue_kyanite.txt',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/clear_quartz.txt',
        ),
        Category(
          id: 'fluorite',
          label: 'Fluorite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/fluorite.txt',
        ),
        Category(
          id: 'hematite',
          label: 'Hematite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/hematite.txt',
        ),
        Category(
          id: 'lapis_lazuli',
          label: 'Lapis Lazuli',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/lapis_lazuli.txt',
        ),
        Category(
          id: 'smoky_quartz',
          label: 'Smoky Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/smoky_quartz.txt',
        ),
        Category(
          id: 'sodalite',
          label: 'Sodalite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/sodalite.txt',
        ),
        Category(
          id: 'tigers_eye',
          label: 'Tigers Eye',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/mental_clarity_and_focus/tigers_eye.txt',
        ),
      ];

      // Crystals - Spiritual Connection subcategories
      List<Category> spiritualConnectionSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/amethyst.txt',
        ),
        Category(
          id: 'angelite',
          label: 'Angelite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/angelite.txt',
        ),
        Category(
          id: 'apophyllite',
          label: 'Apophyllite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/apophyllite.txt',
        ),
        Category(
          id: 'blue_kyanite',
          label: 'Blue Kyanite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/blue_kyanite.txt',
        ),
        Category(
          id: 'celestite',
          label: 'Celestite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/celestite.txt',
        ),
        Category(
          id: 'clear_quartz',
          label: 'Clear Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/clear_quartz.txt',
        ),
        Category(
          id: 'kunzite',
          label: 'Kunzite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/kunzite.txt',
        ),
        Category(
          id: 'labradorite',
          label: 'Labradorite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/labradorite.txt',
        ),
        Category(
          id: 'lapis_lazuli',
          label: 'Lapis Lazuli',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/lapis_lazuli.txt',
        ),
        Category(
          id: 'selenite',
          label: 'Selenite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/spiritual_connection/selenite.txt',
        ),
      ];

      // Crystals - Trauma and Heart Healing subcategories
      List<Category> traumaAndHeartHealingSubs = [
        Category(
          id: 'amethyst',
          label: 'Amethyst',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/amethyst.txt',
        ),
        Category(
          id: 'chrysoprase',
          label: 'Chrysoprase',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/chrysoprase.txt',
        ),
        Category(
          id: 'emerald',
          label: 'Emerald',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/emerald.txt',
        ),
        Category(
          id: 'green_aventurine',
          label: 'Green Aventurine',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/green_aventurine.txt',
        ),
        Category(
          id: 'kunzite',
          label: 'Kunzite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/kunzite.txt',
        ),
        Category(
          id: 'lepidolite',
          label: 'Lepidolite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/lepidolite.txt',
        ),
        Category(
          id: 'malachite',
          label: 'Malachite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/malachite.txt',
        ),
        Category(
          id: 'pink_opal',
          label: 'Pink Opal',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/pink_opal.txt',
        ),
        Category(
          id: 'rhodonite',
          label: 'Rhodonite',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/rhodonite.txt',
        ),
        Category(
          id: 'rose_quartz',
          label: 'Rose Quartz',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/crystals/trauma_and_heart_healing/rose_quartz.txt',
        ),
      ];

      crystalsSubcategories = [
        Category(
          id: 'animal_human_connection',
          label: 'Animal-Human Connection',
          icon: Icons.folder,
          subcategories: animalHumanConnectionSubs,
        ),
        Category(
          id: 'calming_and_sleep',
          label: 'Calming and Sleep',
          icon: Icons.folder,
          subcategories: calmingAndSleepSubs,
        ),
        Category(
          id: 'chakra_specific',
          label: 'Chakra Specific',
          icon: Icons.folder,
          subcategories: chakraSpecificSubs,
        ),
        Category(
          id: 'emotional_healing',
          label: 'Emotional Healing',
          icon: Icons.folder,
          subcategories: emotionalHealingSubs,
        ),
        Category(
          id: 'energy_and_vitality',
          label: 'Energy and Vitality',
          icon: Icons.folder,
          subcategories: energyAndVitalitySubs,
        ),
        Category(
          id: 'grounding_and_protection',
          label: 'Grounding and Protection',
          icon: Icons.folder,
          subcategories: groundingAndProtectionSubs,
        ),
        Category(
          id: 'manifestation_and_abundance',
          label: 'Manifestation and Abundance',
          icon: Icons.folder,
          subcategories: manifestationAndAbundanceSubs,
        ),
        Category(
          id: 'mental_clarity_and_focus',
          label: 'Mental Clarity and Focus',
          icon: Icons.folder,
          subcategories: mentalClarityAndFocusSubs,
        ),
        Category(
          id: 'spiritual_connection',
          label: 'Spiritual Connection',
          icon: Icons.folder,
          subcategories: spiritualConnectionSubs,
        ),
        Category(
          id: 'trauma_and_heart_healing',
          label: 'Trauma and Heart Healing',
          icon: Icons.folder,
          subcategories: traumaAndHeartHealingSubs,
        ),
      ];
      
      // A to B subcategories
      List<Category> aToBSubs = [
        Category(
          id: 'angelsword',
          label: 'Angelsword',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/angelsword.txt',
        ),
        Category(
          id: 'banksia_robur',
          label: 'Banksia Robur',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/banksia_robur.txt',
        ),
        Category(
          id: 'bauhinia',
          label: 'Bauhinia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/bauhinia.txt',
        ),
        Category(
          id: 'billy_goat_plum',
          label: 'Billy Goat Plum',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/billy_goat_plum.txt',
        ),
        Category(
          id: 'black_eyed_susan',
          label: 'Black-Eyed Susan',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/black-eyed_susan.txt',
        ),
        Category(
          id: 'bluebell',
          label: 'Bluebell',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/bluebell.txt',
        ),
        Category(
          id: 'boronia',
          label: 'Boronia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/boronia.txt',
        ),
        Category(
          id: 'bottlebrush',
          label: 'Bottlebrush',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/bottlebrush.txt',
        ),
        Category(
          id: 'bush_fuchsia',
          label: 'Bush Fuchsia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/bush_fuchsia.txt',
        ),
        Category(
          id: 'bush_gardenia',
          label: 'Bush Gardenia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/bush_gardenia.txt',
        ),
        Category(
          id: 'bush_iris',
          label: 'Bush Iris',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/a_to_b/bush_iris.txt',
        ),
      ];

      // C to D subcategories
      List<Category> cToDSubs = [
        Category(
          id: 'christmas_bell',
          label: 'Christmas Bell',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/christmas_bell.txt',
        ),
        Category(
          id: 'crowea',
          label: 'Crowea',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/crowea.txt',
        ),
        Category(
          id: 'dagger_hakea',
          label: 'Dagger Hakea',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/dagger_hakea.txt',
        ),
        Category(
          id: 'dog_rose',
          label: 'Dog Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/dog_rose.txt',
        ),
        Category(
          id: 'dog_rose_of_the_wild_forces',
          label: 'Dog Rose of the Wild Forces',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/dog_rose_of_the_wild_forces.txt',
        ),
        Category(
          id: 'five_corners',
          label: 'Five Corners',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/five_corners.txt',
        ),
        Category(
          id: 'flannel_flower',
          label: 'Flannel Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/flannel_flower.txt',
        ),
        Category(
          id: 'fringed_violet',
          label: 'Fringed Violet',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/fringed_violet.txt',
        ),
        Category(
          id: 'freshwater_mangrove',
          label: 'Freshwater Mangrove',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/freshwater_mangrove.txt',
        ),
        Category(
          id: 'fringe_lily',
          label: 'Fringe Lily',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/c_to_d/fringe_lily.txt',
        ),
      ];

      // E to H subcategories
      List<Category> eToHSubs = [
        Category(
          id: 'green_spider_orchid',
          label: 'Green Spider Orchid',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/green_spider_orchid.txt',
        ),
        Category(
          id: 'grey_spider_flower',
          label: 'Grey Spider Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/grey_spider_flower.txt',
        ),
        Category(
          id: 'gymea_lily',
          label: 'Gymea Lily',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/gymea_lily.txt',
        ),
        Category(
          id: 'hakea',
          label: 'Hakea',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/hakea.txt',
        ),
        Category(
          id: 'hibbertia',
          label: 'Hibbertia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/hibbertia.txt',
        ),
        Category(
          id: 'illawarra_flame_tree',
          label: 'Illawarra Flame Tree',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/illawarra_flame_tree.txt',
        ),
        Category(
          id: 'isopogon',
          label: 'Isopogon',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/isopogon.txt',
        ),
        Category(
          id: 'jacaranda',
          label: 'Jacaranda',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/jacaranda.txt',
        ),
        Category(
          id: 'kangaroo_paw',
          label: 'Kangaroo Paw',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/kangaroo_paw.txt',
        ),
        Category(
          id: 'kapok_bush',
          label: 'Kapok Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/e_to_h/kapok_bush.txt',
        ),
      ];

      // I to M subcategories
      List<Category> iToMSubs = [
        Category(
          id: 'little_flannel_flower',
          label: 'Little Flannel Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/little_flannel_flower.txt',
        ),
        Category(
          id: 'macrocarpa',
          label: 'Macrocarpa',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/macrocarpa.txt',
        ),
        Category(
          id: 'mint_bush',
          label: 'Mint Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/mint_bush.txt',
        ),
        Category(
          id: 'monga_waratah',
          label: 'Monga Waratah',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/monga_waratah.txt',
        ),
        Category(
          id: 'mountain_devil',
          label: 'Mountain Devil',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/mountain_devil.txt',
        ),
        Category(
          id: 'mulla_mulla',
          label: 'Mulla Mulla',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/mulla_mulla.txt',
        ),
        Category(
          id: 'old_man_banksia',
          label: 'Old Man Banksia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/old_man_banksia.txt',
        ),
        Category(
          id: 'peach_flowered_tea_tree',
          label: 'Peach Flowered Tea Tree',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/peach_flowered_tea_tree.txt',
        ),
        Category(
          id: 'philotheca',
          label: 'Philotheca',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/philotheca.txt',
        ),
        Category(
          id: 'pink_flannel_flower',
          label: 'Pink Flannel Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/pink_flannel_flower.txt',
        ),
        Category(
          id: 'pink_mulla_mulla',
          label: 'Pink Mulla Mulla',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/i_to_m/pink_mulla_mulla.txt',
        ),
      ];

      // N to R subcategories
      List<Category> nToRSubs = [
        Category(
          id: 'red_grevillea',
          label: 'Red Grevillea',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/red_grevillea.txt',
        ),
        Category(
          id: 'red_helmet_orchid',
          label: 'Red Helmet Orchid',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/red_helmet_orchid.txt',
        ),
        Category(
          id: 'red_lily',
          label: 'Red Lily',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/red_lily.txt',
        ),
        Category(
          id: 'red_suva_frangipani',
          label: 'Red Suva Frangipani',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/red_suva_frangipani.txt',
        ),
        Category(
          id: 'rough_bluebell',
          label: 'Rough Bluebell',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/rough_bluebell.txt',
        ),
        Category(
          id: 'she_oak',
          label: 'She Oak',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/she_oak.txt',
        ),
        Category(
          id: 'silver_princess',
          label: 'Silver Princess',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/silver_princess.txt',
        ),
        Category(
          id: 'slender_rice_flower',
          label: 'Slender Rice Flower',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/slender_rice_flower.txt',
        ),
        Category(
          id: 'southern_cross',
          label: 'Southern Cross',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/southern_cross.txt',
        ),
        Category(
          id: 'spinifex',
          label: 'Spinifex',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/spinifex.txt',
        ),
        Category(
          id: 'sturt_desert_pea',
          label: 'Sturt Desert Pea',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/n_to_r/sturt_desert_pea.txt',
        ),
      ];

      // S to Z subcategories
      List<Category> sToZSubs = [
        Category(
          id: 'sturt_desert_rose',
          label: 'Sturt Desert Rose',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/sturt_desert_rose.txt',
        ),
        Category(
          id: 'sunshine_wattle',
          label: 'Sunshine Wattle',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/sunshine_wattle.txt',
        ),
        Category(
          id: 'sundew',
          label: 'Sundew',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/sundew.txt',
        ),
        Category(
          id: 'swamp_banksia',
          label: 'Swamp Banksia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/swamp_banksia.txt',
        ),
        Category(
          id: 'tall_mulla_mulla',
          label: 'Tall Mulla Mulla',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/tall_mulla_mulla.txt',
        ),
        Category(
          id: 'turkey_bush',
          label: 'Turkey Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/turkey_bush.txt',
        ),
        Category(
          id: 'waratah',
          label: 'Waratah',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/waratah.txt',
        ),
        Category(
          id: 'wedding_bush',
          label: 'Wedding Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/wedding_bush.txt',
        ),
        Category(
          id: 'wisteria',
          label: 'Wisteria',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/wisteria.txt',
        ),
        Category(
          id: 'wild_potato_bush',
          label: 'Wild Potato Bush',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/wild_potato_bush.txt',
        ),
        Category(
          id: 'yellow_cowslip_orchid',
          label: 'Yellow Cowslip Orchid',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/s_to_z/yellow_cowslip_orchid.txt',
        ),
      ];

      // Additional subcategories
      List<Category> additionalSubs = [
        Category(
          id: 'australasian_bluebell',
          label: 'Australasian Bluebell',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/additional/australasian_bluebell.txt',
        ),
        Category(
          id: 'brown_boronia',
          label: 'Brown Boronia',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/additional/brown_boronia.txt',
        ),
        Category(
          id: 'cognis',
          label: 'Cognis',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/additional/cognis.txt',
        ),
        Category(
          id: 'dynamis',
          label: 'Dynamis',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/additional/dynamis.txt',
        ),
        Category(
          id: 'purifying_essence',
          label: 'Purifying Essence',
          icon: Icons.local_florist,
          imagePath: 'assets/details/holistic_remedies/australian_bush_flowers/additional/purifying_essence.txt',
        ),
      ];

      australianBushFlowersSubcategories = [
        Category(
          id: 'a_to_b',
          label: 'A to B',
          icon: Icons.folder,
          subcategories: aToBSubs,
        ),
        Category(
          id: 'c_to_d',
          label: 'C to D',
          icon: Icons.folder,
          subcategories: cToDSubs,
        ),
        Category(
          id: 'e_to_h',
          label: 'E to H',
          icon: Icons.folder,
          subcategories: eToHSubs,
        ),
        Category(
          id: 'i_to_m',
          label: 'I to M',
          icon: Icons.folder,
          subcategories: iToMSubs,
        ),
        Category(
          id: 'n_to_r',
          label: 'N to R',
          icon: Icons.folder,
          subcategories: nToRSubs,
        ),
        Category(
          id: 's_to_z',
          label: 'S to Z',
          icon: Icons.folder,
          subcategories: sToZSubs,
        ),
        Category(
          id: 'additional',
          label: 'Additional',
          icon: Icons.folder,
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
        subcategories: [
          Category(
            id: 'rescue_remedy',
            label: 'Rescue Remedy',
            icon: Icons.local_florist,
            imagePath: 'assets/details/holistic_remedies/bach_flowers/rescue_remedy.txt',
          ),
          ...bachFlowersSubcategories,
        ],
      ),
      Category(
        id: 'crystals',
        label: 'Crystals',
        icon: Icons.spa,
        subcategories: crystalsSubcategories,
      ),
      Category(
        id: 'australian_bush_flowers',
        label: 'Australian Bush Flowers',
        icon: Icons.spa,
        subcategories: australianBushFlowersSubcategories,
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

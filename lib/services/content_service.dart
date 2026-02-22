import 'package:flutter/services.dart';

/// Service to manage category explanation content
/// 
/// Supports the following formatting in text files:
/// - **bold text** - Text enclosed in double asterisks will be rendered as bold
/// - <a href="url">link text</a> - HTML anchor tags will be rendered as clickable hyperlinks
class ContentService {
  static final ContentService _instance = ContentService._internal();
  factory ContentService() => _instance;
  ContentService._internal();

  // Cache for loaded content to avoid repeated file reads
  final Map<String, String> _contentCache = {};
  
  // Define shared folder mappings (parent category ID -> folder path)
  // Note: meridians, chakras, aura, negative_beliefs are now animal-specific, not shared
  static const Map<String, String> _sharedFolderMappings = {
    // Energy category folders (shared across all animals)
    'portals_pathways': 'energy/portals_pathways',
    'energetic_pathways': 'energy/portals_pathways',
    'portals_energy_gateways': 'energy/portals_pathways',
    'contracts_vows': 'energy/statements',
    'sacred_symbols': 'energy/sacred_symbols',
    'unresolved_emotions': 'energy/unresolved_emotions',
    'core_imprints': 'energy/core_imprints',
    'identity_role': 'energy/core_imprints/identity_role',
    'energy_attachments': 'energy/energy_attachments',
    'entities_spirits': 'energy/energy_attachments/entities_spirits',
    'positive_integration': 'energy/positive_integration',
    'positive_integration_sacred_symbols': 'energy/positive_integration/sacred_symbols',
    'post_traumatic': 'energy/post_traumatic',
    'freeze_defence': 'energy/post_traumatic/freeze_defence',
    'shock': 'energy/post_traumatic/shock',
    'relationship_field': 'energy/energy_attachments/relationship_field',
    'internal': 'energy/energy_attachments/relationship_field/internal',
    'external': 'energy/energy_attachments/relationship_field/external',
    'statements': 'energy/statements',
    'energy_trauma': 'energy/trauma',
    
    // Holistic Remedies category folders (shared across all animals)
    'holistic_remedies': 'holistic_remedies',
    'australian_bush_flowers': 'holistic_remedies/australian_bush_flowers',
    'a_to_b': 'holistic_remedies/australian_bush_flowers/a_to_b',
    'c_to_d': 'holistic_remedies/australian_bush_flowers/c_to_d',
    'e_to_h': 'holistic_remedies/australian_bush_flowers/e_to_h',
    'i_to_m': 'holistic_remedies/australian_bush_flowers/i_to_m',
    'n_to_r': 'holistic_remedies/australian_bush_flowers/n_to_r',
    's_to_z': 'holistic_remedies/australian_bush_flowers/s_to_z',
    'additional': 'holistic_remedies/australian_bush_flowers/additional',
    'bach_flowers': 'holistic_remedies/bach_flowers',
    'homeopathy': 'holistic_remedies/homeopathy',
    'chronic': 'holistic_remedies/homeopathy',
    'digestive': 'holistic_remedies/homeopathy',
    'emotional': 'holistic_remedies/homeopathy',
    'immune': 'holistic_remedies/homeopathy',
    'inflammation': 'holistic_remedies/homeopathy',
    'pain': 'holistic_remedies/homeopathy',
    'respiratory': 'holistic_remedies/homeopathy',
    'trauma': 'holistic_remedies/homeopathy',
    'essential_oils': 'holistic_remedies/essential_oils',
    'calming_and_sleep_essential_oils': 'holistic_remedies/essential_oils',
    'focus_and_behaviour_essential_oils': 'holistic_remedies/essential_oils',
    'grounding_and_safety_essential_oils': 'holistic_remedies/essential_oils',
    'heart_and_connection_essential_oils': 'holistic_remedies/essential_oils',
    'physical_support_essential_oils': 'holistic_remedies/essential_oils',
    'trauma_release_essential_oils': 'holistic_remedies/essential_oils',
    'despondency_and_despair': 'holistic_remedies/bach_flowers/despondency_and_despair',
    'fear': 'holistic_remedies/bach_flowers/fear',
    'lack_of_interest': 'holistic_remedies/bach_flowers/lack_of_interest',
    'loneliness': 'holistic_remedies/bach_flowers/loneliness',
    'over_care_for_others': 'holistic_remedies/bach_flowers/over_care_for_others',
    'oversensitivity': 'holistic_remedies/bach_flowers/oversensitivity',
    'uncertainty': 'holistic_remedies/bach_flowers/uncertainty',
    'crystals': 'holistic_remedies/crystals',
    'animal_human_connection': 'holistic_remedies/crystals/animal_human_connection',
    'calming_and_sleep': 'holistic_remedies/crystals/calming_and_sleep',
    'chakra_specific': 'holistic_remedies/crystals/chakra_specific',
    'emotional_healing': 'holistic_remedies/crystals/emotional_healing',
    'energy_and_vitality': 'holistic_remedies/crystals/energy_and_vitality',
    'grounding_and_protection': 'holistic_remedies/crystals/grounding_and_protection',
    'manifestation_and_abundance': 'holistic_remedies/crystals/manifestation_and_abundance',
    'mental_clarity_and_focus': 'holistic_remedies/crystals/mental_clarity_and_focus',
    'spiritual_connection': 'holistic_remedies/crystals/spiritual_connection',
    'trauma_and_heart_healing': 'holistic_remedies/crystals/trauma_and_heart_healing',
    
    // Environmental category folders (shared across all animals)
    'environmental': 'environmental',
    'chemical_environment': 'environmental',
    'climatic_seasonal_environment': 'environmental',
    'emf_environment': 'environmental',
    'geopathic_earth_energies': 'environmental',
    'human_emotional_environment': 'environmental',
    'physical_environment': 'environmental',
    'routine_management_environment': 'environmental',
    'social_environment': 'environmental',
  };

  /// Get explanation text for a category using dynamic path resolution
  Future<String> getExplanationText(String categoryId, List<String> breadcrumbs) async {
    // Check cache first
    final cacheKey = _buildCacheKey(categoryId, breadcrumbs);
    if (_contentCache.containsKey(cacheKey)) {
      return _contentCache[cacheKey]!;
    }

    try {
      // Build dynamic path based on breadcrumbs and category
      final assetPath = _buildAssetPath(categoryId, breadcrumbs);
      final content = await rootBundle.loadString(assetPath);
      _contentCache[cacheKey] = content;
      return content;
    } catch (e) {
      // If file doesn't exist, return empty string
      final attemptedPath = _buildAssetPath(categoryId, breadcrumbs);
      print('Content not found for category: $categoryId at path: $attemptedPath');
      print('Error: $e');
      return '';
    }
  }

  /// Get image path for a category using smart resolution
  String getImagePath(String categoryId, List<String> breadcrumbs) {
    print('DEBUG: getImagePath called with categoryId: $categoryId, breadcrumbs: $breadcrumbs');
    
    // Handle empty breadcrumbs
    if (breadcrumbs.isEmpty) {
      print('DEBUG: Empty breadcrumbs, using fallback logo');
      return 'assets/images/logo_transparent.png';
    }
    
    // Get the animal type (first breadcrumb)
    final animalType = breadcrumbs.first.toLowerCase();
    print('DEBUG: Animal type: $animalType');
    
    // Handle Energy categories (shared across animals)
    if (breadcrumbs.contains('Energy')) {
      print('DEBUG: Processing Energy category');
      
      // Handle Chakras subcategories
      if (breadcrumbs.contains('Chakras')) {
        if (breadcrumbs.contains('Main Chakra')) {
          // Main chakra images are in energy/chakras/main_chakra/
          final imagePath = 'assets/images/energy/chakras/main_chakra/${_processImageFilename(categoryId)}.webp';
          print('DEBUG: Main chakra image path: $imagePath');
          return imagePath;
        } else if (breadcrumbs.contains('Secondary Chakra')) {
          // Secondary chakra images
          final imagePath = 'assets/images/energy/chakras/secondary_chakra/${_processImageFilename(categoryId)}.webp';
          print('DEBUG: Secondary chakra image path: $imagePath');
          return imagePath;
        }
        // General chakras image
        print('DEBUG: Using general chakras image');
        return 'assets/images/energy/chakras.webp';
      }
      
      // Handle Meridians subcategories (now animal-specific)
      if (breadcrumbs.contains('Meridians')) {
        // Determine meridian type
        String meridianType = 'primary_meridian'; // default
        if (breadcrumbs.contains('Extraordinary Meridian')) {
          meridianType = 'extraordinary_meridian';
        } else if (breadcrumbs.contains('Primary Meridian')) {
          meridianType = 'primary_meridian';
        }
        
        // Animal-specific meridian images (currently only horse has them)
        if (animalType == 'horse') {
          final meridianImagePath = 'assets/images/$animalType/energy/meridians/$meridianType/${_processImageFilename(categoryId)}.webp';
          print('DEBUG: Animal-specific meridian image path: $meridianImagePath');
          return meridianImagePath;
        }
        
        // Fallback for other animals - use general meridians image
        final fallbackPath = 'assets/images/$animalType/energy/meridians.webp';
        print('DEBUG: Meridian fallback path: $fallbackPath');
        return fallbackPath;
      }
      
      // Other energy subcategories (like aura, etc.)
      final energyImagePath = 'assets/images/energy/${_processImageFilename(categoryId)}.webp';
      print('DEBUG: Energy image path: $energyImagePath');
      return energyImagePath;
    }
    
    // Handle animal-specific categories
    if (['dog', 'cat', 'horse', 'bird', 'cow', 'rabbit', 'guineapig'].contains(animalType)) {
      print('DEBUG: Processing animal-specific category for $animalType');
      
      // Check for specific subcategories
      if (breadcrumbs.length > 1) {
        final subcategory = breadcrumbs[1];
        print('DEBUG: Subcategory: $subcategory');
        
        // Handle different subcategory types
        switch (subcategory.toLowerCase()) {
          case 'systems':
            final path = 'assets/images/$animalType/systems.webp';
            print('DEBUG: Systems image path: $path');
            return path;
          case 'muscles':
            final path = 'assets/images/$animalType/muscles.webp';
            print('DEBUG: Muscles image path: $path');
            return path;
          case 'skeleton':
            // Check if it's a specific bone/part
            if (breadcrumbs.length > 2) {
              final bonePart = _processImageFilename(categoryId);
              final path = 'assets/images/$animalType/skeleton/$bonePart.webp';
              print('DEBUG: Specific skeleton part path: $path');
              return path;
            }
            final path = 'assets/images/$animalType/skeleton.webp';
            print('DEBUG: General skeleton path: $path');
            return path;
          case 'organs':
          case 'organ':
            final path = 'assets/images/$animalType/organs.webp';
            print('DEBUG: Organs image path: $path');
            return path;
          case 'glands':
          case 'gland':
            final path = 'assets/images/$animalType/glands.webp';
            print('DEBUG: Glands image path: $path');
            return path;
          case 'connective tissue':
            final path = 'assets/images/$animalType/connective_tissue.webp';
            print('DEBUG: Connective tissue image path: $path');
            return path;
          case 'sensory & external':
          case 'sensory':
            final path = 'assets/images/$animalType/sensory.webp';
            print('DEBUG: Sensory image path: $path');
            return path;
          case 'energy':
            // Animal-specific energy subcategories
            if (breadcrumbs.length > 2) {
              final energySubcat = _processImageFilename(breadcrumbs[2]);
              final path = 'assets/images/$animalType/energy/$energySubcat.webp';
              print('DEBUG: Animal energy subcategory path: $path');
              return path;
            }
            final path = 'assets/images/$animalType/energy.webp';
            print('DEBUG: Animal energy path: $path');
            return path;
          default:
            // Try to find image based on subcategory name
            final subcatPath = _processImageFilename(subcategory);
            final path = 'assets/images/$animalType/$subcatPath.webp';
            print('DEBUG: Default subcategory path: $path');
            return path;
        }
      }
      
      // Default animal image
      final defaultPath = 'assets/images/$animalType.webp';
      print('DEBUG: Default animal image path: $defaultPath');
      return defaultPath;
    }
    
    // Final fallback
    print('DEBUG: Using fallback logo for categoryId: $categoryId, breadcrumbs: $breadcrumbs');
    return 'assets/images/logo_transparent.png';
  }

  /// Check if content exists for a category
  Future<bool> hasContent(String categoryId, List<String> breadcrumbs) async {
    try {
      final assetPath = _buildAssetPath(categoryId, breadcrumbs);
      await rootBundle.loadString(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Build asset path based on category ID and breadcrumbs
  String _buildAssetPath(String categoryId, List<String> breadcrumbs) {
    print('DEBUG: Building asset path for categoryId: $categoryId, breadcrumbs: $breadcrumbs');
    
    // Check if this is a standalone shared energy category (contracts, pathways, portals)
    if (_isStandaloneSharedEnergyCategory(categoryId)) {
      return _buildStandaloneSharedEnergyCategoryPath(categoryId);
    }
    
    // Check if this is a chakra-related category (now animal-specific)
    if (_isChakraCategory(breadcrumbs)) {
      return _buildAnimalSpecificChakraPath(categoryId, breadcrumbs);
    }
    
    // Check if this is a meridian-related category (now animal-specific)
    if (_isMeridianCategory(breadcrumbs)) {
      return _buildAnimalSpecificMeridianPath(categoryId, breadcrumbs);
    }
    
    // Check if this is a negative beliefs category (now animal-specific)
    if (_isNegativeBeliefsCategory(breadcrumbs)) {
      return _buildAnimalSpecificNegativeBeliefPath(categoryId, breadcrumbs);
    }
    
    // Check if this is a supplements & herbs category (animal-specific)
    if (_isSupplementsHerbsCategory(breadcrumbs)) {
      return _buildAnimalSpecificSupplementsHerbsPath(categoryId, breadcrumbs);
    }
    
    // Determine the parent category from breadcrumbs to check if it's shared
    String? parentCategoryId = _getParentCategoryId(breadcrumbs);
    
    // Check if the parent category has a shared folder mapping
    if (parentCategoryId != null && _sharedFolderMappings.containsKey(parentCategoryId)) {
      // Use shared folder mapping
      final sharedPath = _sharedFolderMappings[parentCategoryId]!;
      final filename = _processFilename(categoryId);
      final finalPath = 'assets/details/$sharedPath/$filename.txt';
      print('DEBUG: Using shared folder mapping for parent "$parentCategoryId": $finalPath');
      return finalPath;
    }
    
    // Fallback to breadcrumb-based path building for animal-specific content
    List<String> pathSegments = ['assets', 'details'];
    
    if (breadcrumbs.isNotEmpty) {
      // Add animal name as first segment for animal-specific content
      String animalSegment = breadcrumbs[0].toLowerCase();
      pathSegments.add(animalSegment);
      
      // Process remaining breadcrumbs (skip animal name)
      for (String breadcrumb in breadcrumbs.skip(1)) {
        String segment = _processBreadcrumbSegment(breadcrumb);
        if (segment.isNotEmpty) {
          pathSegments.add(segment);
        }
      }
    }
    
    // Add the category file
    String filename = _processFilename(categoryId);
    pathSegments.add('$filename.txt');
    
    final finalPath = pathSegments.join('/');
    print('DEBUG: Using breadcrumb-based path: $finalPath');
    return finalPath;
  }
  
  /// Check if this is a standalone shared energy category
  bool _isStandaloneSharedEnergyCategory(String categoryId) {
    final categoryIdLower = categoryId.toLowerCase();
    return categoryIdLower == 'contracts_vows' ||
           categoryIdLower == 'contracts & vows' ||
           categoryIdLower == 'energetic_pathways' ||
           categoryIdLower == 'portals_pathways' ||
           categoryIdLower == 'portals_energy_gateways' ||
           categoryIdLower == 'portals & energy gateways';
  }
  
  /// Build path for standalone shared energy categories
  String _buildStandaloneSharedEnergyCategoryPath(String categoryId) {
    final categoryIdLower = categoryId.toLowerCase();
    String finalPath;

    if (categoryIdLower == 'contracts_vows' || categoryIdLower == 'contracts & vows') {
      finalPath = 'assets/details/energy/statements/contracts&vows.txt';
    } else if (categoryIdLower == 'energetic_pathways' ||
        categoryIdLower == 'portals_energy_gateways' ||
        categoryIdLower == 'portals & energy gateways') {
      String filename = _processFilename(categoryId);
      finalPath = 'assets/details/energy/portals_pathways/$filename.txt';
    } else {
      String filename = _processFilename(categoryId);
      finalPath = 'assets/details/energy/$filename.txt';
    }

    print('DEBUG: Using standalone shared energy category path: $finalPath');
    return finalPath;
  }
  
  /// Check if the breadcrumbs indicate a chakra category
  bool _isChakraCategory(List<String> breadcrumbs) {
    return breadcrumbs.any((breadcrumb) => 
      breadcrumb.toLowerCase() == 'main chakra' ||
      breadcrumb.toLowerCase() == 'secondary chakra' ||
      breadcrumb.toLowerCase() == 'cosmic chakra'
    );
  }
  
  /// Build animal-specific chakra path
  String _buildAnimalSpecificChakraPath(String categoryId, List<String> breadcrumbs) {
    if (breadcrumbs.isEmpty) {
      return 'assets/details/$categoryId.txt';
    }
    
    // Get animal type (first breadcrumb)
    String animalType = breadcrumbs[0].toLowerCase();
    
    // Determine chakra type
    String chakraType = 'main_chakra'; // default
    if (breadcrumbs.any((b) => b.toLowerCase() == 'secondary chakra')) {
      chakraType = 'secondary_chakra';
    } else if (breadcrumbs.any((b) => b.toLowerCase() == 'cosmic chakra')) {
      chakraType = 'cosmic_chakra';
    } else if (breadcrumbs.any((b) => b.toLowerCase() == 'main chakra')) {
      chakraType = 'main_chakra';
    }
    
    // Build path for animal-specific chakra
    String filename = _processFilename(categoryId);
    String finalPath = 'assets/details/$animalType/energy/chakras/$chakraType/$filename.txt';
    
    print('DEBUG: Using animal-specific chakra path: $finalPath');
    return finalPath;
  }
  
  /// Check if the breadcrumbs indicate a meridian category
  bool _isMeridianCategory(List<String> breadcrumbs) {
    return breadcrumbs.any((breadcrumb) => 
      breadcrumb.toLowerCase().contains('meridian') ||
      breadcrumb.toLowerCase() == 'primary meridian' ||
      breadcrumb.toLowerCase() == 'extraordinary meridian'
    );
  }
  
  /// Build animal-specific meridian path
  String _buildAnimalSpecificMeridianPath(String categoryId, List<String> breadcrumbs) {
    if (breadcrumbs.isEmpty) {
      return 'assets/details/$categoryId.txt';
    }
    
    // Get animal type (first breadcrumb)
    String animalType = breadcrumbs[0].toLowerCase();
    
    // Determine meridian type
    String meridianType = 'primary_meridian'; // default
    if (breadcrumbs.any((b) => b.toLowerCase().contains('extraordinary'))) {
      meridianType = 'extraordinary_meridian';
    } else if (breadcrumbs.any((b) => b.toLowerCase().contains('primary'))) {
      meridianType = 'primary_meridian';
    }
    
    // Build path for animal-specific meridian
    String filename = _processFilename(categoryId);
    String finalPath = 'assets/details/$animalType/energy/meridians/$meridianType/$filename.txt';
    
    print('DEBUG: Using animal-specific meridian path: $finalPath');
    return finalPath;
  }
  
  /// Check if the breadcrumbs indicate a negative beliefs category
  bool _isNegativeBeliefsCategory(List<String> breadcrumbs) {
    return breadcrumbs.any((breadcrumb) => 
      breadcrumb.toLowerCase() == 'negative beliefs'
    );
  }
  
  /// Build animal-specific negative beliefs path
  String _buildAnimalSpecificNegativeBeliefPath(String categoryId, List<String> breadcrumbs) {
    if (breadcrumbs.isEmpty) {
      return 'assets/details/$categoryId.txt';
    }
    
    // Get animal type (first breadcrumb)
    String animalType = breadcrumbs[0].toLowerCase();
    
    // Build path for animal-specific negative beliefs
    String filename = _processFilename(categoryId);
    String finalPath = 'assets/details/$animalType/energy/negative_beliefs/$filename.txt';
    
    print('DEBUG: Using animal-specific negative beliefs path: $finalPath');
    return finalPath;
  }
  
  /// Check if the breadcrumbs indicate a supplements & herbs category
  bool _isSupplementsHerbsCategory(List<String> breadcrumbs) {
    return breadcrumbs.any((breadcrumb) => 
      breadcrumb.toLowerCase() == 'supplements & herbs' ||
      breadcrumb.toLowerCase() == 'supplements and herbs' ||
      breadcrumb.toLowerCase() == 'supplements_herbs'
    );
  }
  
  /// Build animal-specific supplements & herbs path
  String _buildAnimalSpecificSupplementsHerbsPath(String categoryId, List<String> breadcrumbs) {
    if (breadcrumbs.isEmpty) {
      return 'assets/details/$categoryId.txt';
    }
    
    // Get animal type (first breadcrumb)
    String animalType = breadcrumbs[0].toLowerCase();
    
    // Build path for animal-specific supplements & herbs
    String filename = _processFilename(categoryId);
    String finalPath = 'assets/details/$animalType/holistic_remedies/supplements_herbs/$filename.txt';
    
    print('DEBUG: Using animal-specific supplements & herbs path: $finalPath');
    return finalPath;
  }
  
  /// Extract parent category ID from breadcrumbs to determine folder structure
  String? _getParentCategoryId(List<String> breadcrumbs) {
    print('DEBUG: Looking for parent category in breadcrumbs: $breadcrumbs');
    
    // Look for exact matches, prioritizing more specific (nested) categories first
    // Check in reverse order to find the most specific match
    for (int i = breadcrumbs.length - 1; i >= 0; i--) {
      String breadcrumb = breadcrumbs[i];
      String? matchedId = _getExactMatch(breadcrumb, breadcrumbs);
      if (matchedId != null) {
        print('DEBUG: Found exact match "$matchedId" for breadcrumb "$breadcrumb"');
        return matchedId;
      }
    }
    
    print('DEBUG: No parent category found, using animal-specific path');
    return null;
  }
  
  /// Get exact match for a breadcrumb to a folder ID
  String? _getExactMatch(String breadcrumb, List<String> breadcrumbs) {
    final breadcrumbLower = breadcrumb.toLowerCase().trim();
    
    // Exact string matches for category names
    switch (breadcrumbLower) {
      // Note: Chakra, Meridian, and Aura categories are now handled by animal-specific logic
      // and are no longer shared across animals
      
      // Energy categories
      case 'portals pathways':
        return 'portals_pathways';
      case 'sacred symbols':
        // Support sacred symbols under positive integration as well
        if (breadcrumbs.any((b) => b.toLowerCase() == 'positive integration')) {
          return 'positive_integration_sacred_symbols';
        }
        return 'sacred_symbols';
      case 'negative beliefs':
        return 'negative_beliefs';
      case 'unresolved emotions':
        return 'unresolved_emotions';
      case 'core imprints':
        return 'core_imprints';
      case 'identity role':
      case 'identity & role':
      case 'identity and role':
        return 'identity_role';
      case 'energy attachments':
        return 'energy_attachments';
      case 'entities & spirits':
      case 'entities and spirits':
        return 'entities_spirits';
      case 'positive integration':
        return 'positive_integration';
      case 'post traumatic':
        return 'post_traumatic';
      case 'relationship field':
        return 'relationship_field';
      case 'internal':
        return 'internal';
      case 'external':
        return 'external';
      case 'statements':
        return 'statements';
      case 'contracts & vows':
      case 'contracts and vows':
        return 'contracts_vows';
      case 'energetic pathways':
        return 'energetic_pathways';
      case 'freeze defence':
      case 'freeze defense':
        return 'freeze_defence';
      case 'shock':
        return 'shock';
      case 'portals & energy gateways':
      case 'portals and energy gateways':
        return 'portals_energy_gateways';
      
      // Holistic Remedies categories
      case 'holistic remedies':
        return 'holistic_remedies';
      case 'australian bush flowers':
        return 'australian_bush_flowers';
      case 'a to b':
      case 'a-to-b':
        return 'a_to_b';
      case 'c to d':
      case 'c-to-d':
        return 'c_to_d';
      case 'e to h':
      case 'e-to-h':
        return 'e_to_h';
      case 'i to m':
      case 'i-to-m':
        return 'i_to_m';
      case 'n to r':
      case 'n-to-r':
        return 'n_to_r';
      case 's to z':
      case 's-to-z':
        return 's_to_z';
      case 'additional':
        return 'additional';
      case 'bach flowers':
        return 'bach_flowers';
      case 'despondency and despair':
      case 'despondency & despair':
        return 'despondency_and_despair';
      case 'fear':
        return 'fear';
      case 'lack of interest':
        return 'lack_of_interest';
      case 'loneliness':
        return 'loneliness';
      case 'over care for others':
      case 'over-care for others':
        return 'over_care_for_others';
      case 'oversensitivity':
      case 'over sensitivity':
      case 'over-sensitivity':
        return 'oversensitivity';
      case 'uncertainty':
        return 'uncertainty';
      case 'crystals':
        return 'crystals';
      case 'animal human connection':
      case 'animal-human connection':
        return 'animal_human_connection';
      case 'calming and sleep':
      case 'calming & sleep':
        return 'calming_and_sleep';
      case 'chakra specific':
      case 'chakra-specific':
        return 'chakra_specific';
      case 'emotional healing':
        return 'emotional_healing';
      case 'energy and vitality':
      case 'energy & vitality':
        return 'energy_and_vitality';
      case 'grounding and protection':
      case 'grounding & protection':
        return 'grounding_and_protection';
      case 'manifestation and abundance':
      case 'manifestation & abundance':
        return 'manifestation_and_abundance';
      case 'mental clarity and focus':
      case 'mental clarity & focus':
        return 'mental_clarity_and_focus';
      case 'spiritual connection':
        return 'spiritual_connection';
      case 'trauma and heart healing':
      case 'trauma & heart healing':
        return 'trauma_and_heart_healing';
      
      // Homeopathy categories
      case 'homeopathy':
        return 'homeopathy';
      case 'chronic':
        return 'chronic';
      case 'digestive':
        // Only match digestive for homeopathy context to avoid conflict with other categories
        if (breadcrumbs.any((b) => b.toLowerCase().contains('homeopathy') || b.toLowerCase().contains('holistic remedies'))) {
          return 'digestive';
        }
        return null;
      case 'emotional':
        return 'emotional';
      case 'immune':
        // Only match immune for homeopathy context to avoid conflict with other categories
        if (breadcrumbs.any((b) => b.toLowerCase().contains('homeopathy') || b.toLowerCase().contains('holistic remedies'))) {
          return 'immune';
        }
        return null;
      case 'inflammation':
        return 'inflammation';
      case 'pain':
        return 'pain';
      case 'respiratory':
        // Only match respiratory for homeopathy context to avoid conflict with glands
        if (breadcrumbs.any((b) => b.toLowerCase().contains('homeopathy') || b.toLowerCase().contains('holistic remedies'))) {
          return 'respiratory';
        }
        return null;
      case 'trauma':
        if (breadcrumbs.any((b) => b.toLowerCase().contains('energy'))) {
          return 'energy_trauma';
        }
        return 'trauma';
      
      // Essential Oils categories
      case 'essential oils':
        return 'essential_oils';
      case 'calming and sleep':
      case 'calming & sleep':
        return 'calming_and_sleep_essential_oils';
      case 'focus and behaviour':
      case 'focus & behaviour':
        return 'focus_and_behaviour_essential_oils';
      case 'grounding and safety':
      case 'grounding & safety':
        return 'grounding_and_safety_essential_oils';
      case 'heart and connection':
      case 'heart & connection':
        return 'heart_and_connection_essential_oils';
      case 'physical support':
        return 'physical_support_essential_oils';
      case 'trauma release':
        return 'trauma_release_essential_oils';
      
      // Environmental categories
      case 'environmental':
        return 'environmental';
      case 'chemical environment':
        return 'chemical_environment';
      case 'climatic seasonal environment':
        return 'climatic_seasonal_environment';
      case 'emf environment':
        return 'emf_environment';
      case 'geopathic earth energies':
        return 'geopathic_earth_energies';
      case 'human emotional environment':
        return 'human_emotional_environment';
      case 'physical environment':
        return 'physical_environment';
      case 'routine management environment':
        return 'routine_management_environment';
      case 'social environment':
        return 'social_environment';
      
      default:
        return null;
    }
  }
  
  /// Process a breadcrumb segment into a valid path segment
  String _processBreadcrumbSegment(String breadcrumb) {
    String segment = breadcrumb.toLowerCase()
        .replaceAll(' ', '_')
        .replaceAll('&', '')
        .replaceAll('/', ':')
        .replaceAll('-', '_')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .trim();
    
    // Clean up multiple underscores and remove leading/trailing underscores
    segment = segment.replaceAll(RegExp(r'_+'), '_').replaceAll(RegExp(r'^_|_$'), '');
    
    return segment;
  }
  
  /// Process a filename from category ID
  String _processFilename(String categoryId) {
    // Special cases for specific energy categories
    if (categoryId.toLowerCase() == 'contracts_vows' || categoryId.toLowerCase() == 'contracts & vows') {
      return 'contracts&vows';
    }
    if (categoryId.toLowerCase() == 'portals_energy_gateways' || categoryId.toLowerCase() == 'portals & energy gateways') {
      return 'portals_and_energy_gateways';
    }
    
    String filename = categoryId.toLowerCase()
        .replaceAll(' ', '_')
        .replaceAll('/', ':')  // Forward slash becomes colon (as seen in chakra files)
        .replaceAll('-', '_')
        .replaceAll('(', '')
        .replaceAll(')', '');
    
    // Special case for brachial/shoulder chakra which has colon in the filename
    if (categoryId.toLowerCase().contains('brachial') && categoryId.toLowerCase().contains('shoulder')) {
      filename = 'brachial:shoulder_chakra';
    }
    
    return filename;
  }
  
  /// Process image filename from category ID or breadcrumb
  String _processImageFilename(String input) {
    String filename = input.toLowerCase()
        .replaceAll(' ', '_')
        .replaceAll('&', '_')
        .replaceAll('-', '_')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('/', '_')
        .trim();
    
    // Clean up multiple underscores and remove leading/trailing underscores
    filename = filename.replaceAll(RegExp(r'_+'), '_').replaceAll(RegExp(r'^_|_$'), '');
    
    // Special cases for known image names
    if (filename.contains('aura') && filename.contains('energy')) {
      return 'aura_&_energy_field';
    }
    
    return filename;
  }

  /// Build cache key for content
  String _buildCacheKey(String categoryId, List<String> breadcrumbs) {
    return '${breadcrumbs.join('/')}_$categoryId';
  }

  /// Clear cache to free memory
  void clearCache() {
    _contentCache.clear();
  }


  /// Preload content for better performance (optional)
  Future<void> preloadContent(List<String> categoryIds, List<String> breadcrumbs) async {
    final futures = categoryIds.map((id) => getExplanationText(id, breadcrumbs));
    await Future.wait(futures);
  }
}

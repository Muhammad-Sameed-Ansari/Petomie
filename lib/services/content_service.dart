import 'package:flutter/services.dart';

/// Service to manage category explanation content
class ContentService {
  static final ContentService _instance = ContentService._internal();
  factory ContentService() => _instance;
  ContentService._internal();

  // Cache for loaded content to avoid repeated file reads
  final Map<String, String> _contentCache = {};
  
  // Define shared folder mappings (parent category ID -> folder path)
  static const Map<String, String> _sharedFolderMappings = {
    // Energy category folders (shared across all animals)
    'main_chakra': 'energy/chakras/main_chakra',
    'aura_energy_field': 'energy/aura_energy_field',
    'primary_meridian': 'energy/meridians/primary_meridian',
    'extraordinary_meridian': 'energy/meridians/extraordinary_meridian',
    'energy_balance_in_the_body': 'energy/meridians/energy_balance_in_the_body',
    'life_force_vital_energy': 'energy/life_force_vital_energy',
    'energy_imbalances': 'energy/energy_imbalances',
    'environmental_impacts': 'energy/energy_imbalances/environmental_impacts',
    'energy_connections': 'energy/energy_connections',
    'sacred_geometry_vibrational_patterns': 'energy/sacred_geometry_vibrational_patterns',
    'states_of_harmony': 'energy/states_of_harmony',
    'energetic_influences': 'energy/energetic_influences',
    'negative_beliefs': 'energy/negative_beliefs',
    'unresolved_emotions': 'energy/unresolved_emotions',
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
      return 'assets/images/logo_transparent.webp';
    }
    
    // Get the animal type (first breadcrumb)
    final animalType = breadcrumbs.first.toLowerCase();
    
    // Handle Energy categories (shared across animals)
    if (breadcrumbs.contains('Energy')) {
      // Handle Chakras subcategories
      if (breadcrumbs.contains('Chakras')) {
        if (breadcrumbs.contains('Main Chakra')) {
          // Main chakra images are in energy/chakras/main_chakra/
          final imagePath = 'assets/images/energy/chakras/main_chakra/${_processImageFilename(categoryId)}.png';
          print('DEBUG: Main chakra image path: $imagePath');
          return imagePath;
        } else if (breadcrumbs.contains('Secondary Chakra')) {
          // Secondary chakra images
          return 'assets/images/energy/chakras/secondary_chakra/${_processImageFilename(categoryId)}.png';
        }
        // General chakras image
        return 'assets/images/energy/chakras.webp';
      }
      
      // Other energy subcategories (like aura, meridians, etc.)
      final energyImagePath = 'assets/images/energy/${_processImageFilename(categoryId)}.png';
      print('DEBUG: Energy image path: $energyImagePath');
      return energyImagePath;
    }
    
    // Handle animal-specific categories
    if (['dog', 'cat', 'horse', 'bird', 'cow', 'rabbit', 'guineapig'].contains(animalType)) {
      // Check for specific subcategories
      if (breadcrumbs.length > 1) {
        final subcategory = breadcrumbs[1];
        
        // Handle different subcategory types
        switch (subcategory.toLowerCase()) {
          case 'body systems':
            return 'assets/images/$animalType/body_systems.webp';
          case 'muscular system':
            return 'assets/images/$animalType/muscular_system.webp';
          case 'skeletal system':
            // Check if it's a specific bone/part
            if (breadcrumbs.length > 2) {
              final bonePart = _processImageFilename(categoryId);
              return 'assets/images/$animalType/skeletal_system/$bonePart.png';
            }
            return 'assets/images/$animalType/skeletal_system.webp';
          case 'organ & gland':
          case 'oragn & gland': // Handle typo in existing files
            return 'assets/images/$animalType/oragn_&_gland.webp';
          case 'sensory & external':
            // Check file extension - some are .png, some are .webp
            final sensoryPath = 'assets/images/$animalType/sensory_&_external';
            // Try .webp first, then .png
            return '$sensoryPath.webp'; // Will fallback to logo if not found
          case 'energy':
            // Animal-specific energy subcategories
            if (breadcrumbs.length > 2) {
              final energySubcat = _processImageFilename(breadcrumbs[2]);
              return 'assets/images/$animalType/energy/$energySubcat.webp';
            }
            return 'assets/images/$animalType/energy.webp';
          default:
            // Try to find image based on subcategory name
            final subcatPath = _processImageFilename(subcategory);
            return 'assets/images/$animalType/$subcatPath.webp';
        }
      }
      
      // Default animal image
      return 'assets/images/$animalType.webp';
    }
    
    // Final fallback
    print('DEBUG: Using fallback logo for categoryId: $categoryId, breadcrumbs: $breadcrumbs');
    return 'assets/images/logo_transparent.webp';
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
  
  /// Extract parent category ID from breadcrumbs to determine folder structure
  String? _getParentCategoryId(List<String> breadcrumbs) {
    print('DEBUG: Looking for parent category in breadcrumbs: $breadcrumbs');
    
    // Look for exact matches, prioritizing more specific (nested) categories first
    // Check in reverse order to find the most specific match
    for (int i = breadcrumbs.length - 1; i >= 0; i--) {
      String breadcrumb = breadcrumbs[i];
      String? matchedId = _getExactMatch(breadcrumb);
      if (matchedId != null) {
        print('DEBUG: Found exact match "$matchedId" for breadcrumb "$breadcrumb"');
        return matchedId;
      }
    }
    
    print('DEBUG: No parent category found, using animal-specific path');
    return null;
  }
  
  /// Get exact match for a breadcrumb to a folder ID
  String? _getExactMatch(String breadcrumb) {
    final breadcrumbLower = breadcrumb.toLowerCase().trim();
    
    // Exact string matches for category names
    switch (breadcrumbLower) {
      case 'main chakra':
        return 'main_chakra';
      case 'aura & energy field':
        return 'aura_energy_field';
      
      // Meridian subcategories
      case 'primary meridian':
        return 'primary_meridian';
      case 'extraordinary meridian':
        return 'extraordinary_meridian';
      case 'energy balance in the body':
        return 'energy_balance_in_the_body';
      
      case 'life force / vital energy':
        return 'life_force_vital_energy';
      case 'energy imbalances':
        return 'energy_imbalances';
      case 'environmental impacts':
        return 'environmental_impacts';
      case 'energy connections':
        return 'energy_connections';
      case 'sacred geometry & vibrational patterns':
        return 'sacred_geometry_vibrational_patterns';
      case 'states of harmony':
        return 'states_of_harmony';
      case 'energetic influences':
        return 'energetic_influences';
      case 'negative beliefs':
        return 'negative_beliefs';
      case 'unresolved emotions':
        return 'unresolved_emotions';
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

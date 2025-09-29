import 'package:flutter/services.dart';

/// Service to manage category explanation content
class ContentService {
  static final ContentService _instance = ContentService._internal();
  factory ContentService() => _instance;
  ContentService._internal();

  // Cache for loaded content to avoid repeated file reads
  final Map<String, String> _contentCache = {};

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
    // Smart path resolution based on category hierarchy
    if (breadcrumbs.contains('Chakras')) {
      if (breadcrumbs.contains('Main Chakra')) {
        return 'assets/images/chakras/main_chakra/$categoryId.webp';
      } else if (breadcrumbs.contains('Secondary Chakra')) {
        return 'assets/images/chakras/secondary_chakra/$categoryId.webp';
      }
      return 'assets/images/chakras/$categoryId.webp';
    }
    
    // Default fallback
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

  /// Build asset path based on breadcrumbs and category
  String _buildAssetPath(String categoryId, List<String> breadcrumbs) {
    // Convert breadcrumbs to path segments
    List<String> pathSegments = ['assets', 'details'];
    
    // Check if this is shared content (like Energy/Chakras) or animal-specific content
    bool isSharedContent = breadcrumbs.length > 1 && 
        (breadcrumbs[1].toLowerCase() == 'energy' || 
         breadcrumbs.contains('Chakras'));
    
    if (isSharedContent) {
      // For shared content like Energy/Chakras, skip the animal name (first breadcrumb)
      for (String breadcrumb in breadcrumbs.skip(1)) {
        String segment = _processBreadcrumbSegment(breadcrumb);
        if (segment.isNotEmpty) {
          pathSegments.add(segment);
        }
      }
    } else {
      // For animal-specific content, include the animal name in the path
      if (breadcrumbs.isNotEmpty) {
        // Add animal name as first segment
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
    }
    
    // Add the category file - handle special characters in filenames
    String filename = _processFilename(categoryId);
    pathSegments.add('$filename.txt');
    
    return pathSegments.join('/');
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

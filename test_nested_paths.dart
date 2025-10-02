// Test nested folder path generation
void main() {
  // Test direct energy imbalances categories
  testPath('stress_overwhelm', ['Dog', 'Energy', 'Energy Imbalances']);
  testPath('energy_leaks', ['Horse', 'Energy', 'Energy Imbalances']);
  
  // Test nested environmental impacts categories
  testPath('chemicals_toxins', ['Cat', 'Energy', 'Energy Imbalances', 'Environmental Impacts']);
  testPath('electromagnetic_fields_emfs_technology', ['Bird', 'Energy', 'Energy Imbalances', 'Environmental Impacts']);
  testPath('human_emotional_energy', ['Dog', 'Energy', 'Energy Imbalances', 'Environmental Impacts']);
  
  // Test other categories for comparison
  testPath('aura_layers', ['Horse', 'Energy', 'Aura & Energy Field']);
}

void testPath(String categoryId, List<String> breadcrumbs) {
  print('Testing: $categoryId with breadcrumbs: $breadcrumbs');
  
  // Shared folder mappings
  const Map<String, String> sharedFolderMappings = {
    'main_chakra': 'energy/chakras/main_chakra',
    'aura_energy_field': 'energy/aura_energy_field',
    'primary_meridian': 'energy/meridians/primary_meridian',
    'extraordinary_meridian': 'energy/meridians/extraordinary_meridian',
    'energy_balance_in_the_body': 'energy/meridians/energy_balance_in_the_body',
    'life_force_vital_energy': 'energy/life_force_vital_energy',
    'energy_imbalances': 'energy/energy_imbalances',
    'environmental_impacts': 'energy/energy_imbalances/environmental_impacts',
    'energy_connections': 'energy/energy_connections',
  };
  
  // Get parent category ID
  String? parentCategoryId = getParentCategoryId(breadcrumbs);
  
  String finalPath;
  
  if (parentCategoryId != null && sharedFolderMappings.containsKey(parentCategoryId)) {
    // Use shared folder mapping
    final sharedPath = sharedFolderMappings[parentCategoryId]!;
    final filename = processFilename(categoryId);
    finalPath = 'assets/details/$sharedPath/$filename.txt';
    print('  Using shared folder mapping for parent "$parentCategoryId": $finalPath');
  } else {
    // Fallback to breadcrumb-based path
    List<String> pathSegments = ['assets', 'details'];
    
    if (breadcrumbs.isNotEmpty) {
      String animalSegment = breadcrumbs[0].toLowerCase();
      pathSegments.add(animalSegment);
      
      for (String breadcrumb in breadcrumbs.skip(1)) {
        String segment = processBreadcrumbSegment(breadcrumb);
        if (segment.isNotEmpty) {
          pathSegments.add(segment);
        }
      }
    }
    
    String filename = processFilename(categoryId);
    pathSegments.add('$filename.txt');
    
    finalPath = pathSegments.join('/');
    print('  Using breadcrumb-based path: $finalPath');
  }
  
  print('');
}

String? getParentCategoryId(List<String> breadcrumbs) {
  print('  Looking for parent category in breadcrumbs: $breadcrumbs');
  
  // Look for exact matches (most specific first)
  for (String breadcrumb in breadcrumbs) {
    String? matchedId = getExactMatch(breadcrumb);
    if (matchedId != null) {
      print('  Found exact match "$matchedId" for breadcrumb "$breadcrumb"');
      return matchedId;
    }
  }
  
  print('  No parent category found, using animal-specific path');
  return null;
}

String? getExactMatch(String breadcrumb) {
  final breadcrumbLower = breadcrumb.toLowerCase().trim();
  
  switch (breadcrumbLower) {
    case 'main chakra':
      return 'main_chakra';
    case 'aura & energy field':
      return 'aura_energy_field';
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
    default:
      return null;
  }
}

String processBreadcrumbSegment(String breadcrumb) {
  String segment = breadcrumb.toLowerCase()
      .replaceAll(' ', '_')
      .replaceAll('&', '')
      .replaceAll('/', ':')
      .replaceAll('-', '_')
      .replaceAll('(', '')
      .replaceAll(')', '')
      .trim();
  
  segment = segment.replaceAll(RegExp(r'_+'), '_').replaceAll(RegExp(r'^_|_$'), '');
  return segment;
}

String processFilename(String categoryId) {
  return categoryId.toLowerCase()
      .replaceAll(' ', '_')
      .replaceAll('/', ':')
      .replaceAll('-', '_')
      .replaceAll('(', '')
      .replaceAll(')', '');
}

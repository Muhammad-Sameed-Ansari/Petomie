import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/category.dart' as app_category;
import '../widgets/category_grid.dart';
import '../widgets/scroll_to_top_button.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../providers/theme_provider.dart';
import '../providers/subscription_provider.dart';
import '../themes/app_themes.dart';
import '../widgets/subscription_required_overlay.dart';
import '../services/content_service.dart';
import 'subscription_screen.dart';
import 'detailed_category_screen.dart';
import 'category_explanation_screen.dart';

class CategoryScreen extends StatefulWidget {
  final List<app_category.Category> categories;
  final String title;
  final List<String> breadcrumbs;

  const CategoryScreen({
    super.key,
    required this.categories,
    required this.title,
    this.breadcrumbs = const [],
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<app_category.Category> _currentCategories;
  late String _currentTitle;
  late List<String> _currentBreadcrumbs;
  late String _animalId; // Store the animal ID for lazy loading
  late final ScrollController _scrollController;
  
  // Navigation stack to keep track of categories for proper back navigation
  final List<List<app_category.Category>> _navigationStack = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentCategories = widget.categories;
    _currentTitle = widget.title;
    _currentBreadcrumbs = List.from(widget.breadcrumbs);
    // Extract animal ID from breadcrumbs (first breadcrumb is the animal name)
    _animalId = widget.breadcrumbs.isNotEmpty ? widget.breadcrumbs.first.toLowerCase() : '';
    print('DEBUG: CategoryScreen - Extracted animal ID: $_animalId from breadcrumbs: ${widget.breadcrumbs}');
    
    // Initialize navigation stack with the initial categories
    _navigationStack.add(List.from(_currentCategories));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onCategoryTap(app_category.Category category) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context, listen: false);
    
    if (!subscriptionProvider.hasActiveSubscription) {
      // Show subscription required overlay for any category
      _showSubscriptionRequiredOverlay(category);
      return;
    }
    
    // Handle Energy category with lazy loading
    if (category.id == 'energy' && !category.hasSubcategories) {
      final energyCategory = app_category.CategoryData.getAnatomyCategoryWithEnergySubcategories(_animalId, 'energy');
      if (energyCategory != null) {
        setState(() {
          // Push current categories to navigation stack before navigating
          _navigationStack.add(List.from(_currentCategories));
          print('sameed - Navigation: Pushed ${_currentCategories.length} categories to stack, stack size: ${_navigationStack.length}');
          _currentCategories = energyCategory.subcategories;
          _currentTitle = energyCategory.label;
          _currentBreadcrumbs.add(energyCategory.label);
          print('sameed - Navigation: Navigated to ${energyCategory.label}, showing ${energyCategory.subcategories.length} subcategories');
        });
        return;
      }
    }
    
    if (category.hasSubcategories) {
      // For all other categories with subcategories, navigate within the same screen
      setState(() {
        // Push current categories to navigation stack before navigating
        _navigationStack.add(List.from(_currentCategories));
        print('sameed - Navigation: Pushed ${_currentCategories.length} categories to stack, stack size: ${_navigationStack.length}');
        _currentCategories = category.subcategories;
        _currentTitle = category.label;
        _currentBreadcrumbs.add(category.label);
        print('sameed - Navigation: Navigated to ${category.label}, showing ${category.subcategories.length} subcategories');
      });
    } else {
      // Handle leaf category tap (could show details, perform action, etc.)
      _showCategoryDetails(category);
    }
  }

  void _navigateBack() {
    if (_currentBreadcrumbs.length <= 1) {
      // If we're at the first level (animal anatomy), go back to home
      Navigator.of(context).pop();
      return;
    }

    // Navigate up one level using the navigation stack
    setState(() {
      final removedBreadcrumb = _currentBreadcrumbs.removeLast();
      print('sameed - Navigation: Going back from $removedBreadcrumb, breadcrumbs now: $_currentBreadcrumbs');
      
      if (_navigationStack.isNotEmpty) {
        // Pop the last categories from navigation stack
        _currentCategories = _navigationStack.removeLast();
        print('sameed - Navigation: Popped categories from stack, showing ${_currentCategories.length} categories, stack size: ${_navigationStack.length}');
        
        // Set the title based on current breadcrumbs
        if (_currentBreadcrumbs.length == 1) {
          _currentTitle = '${_currentBreadcrumbs.first} Anatomy';
        } else {
          _currentTitle = _currentBreadcrumbs.last;
        }
        print('sameed - Navigation: Set title to $_currentTitle');
      } else {
        print('sameed - Navigation: Stack is empty, using fallback reconstruction');
        // Fallback: reconstruct from scratch if navigation stack is empty
        _reconstructParentCategory();
      }
    });
  }

  void _navigateToBreadcrumb(int index) {
    if (index >= _currentBreadcrumbs.length - 1) {
      // Already at this level or invalid index
      return;
    }

    // Calculate how many levels to go back
    int levelsToGoBack = _currentBreadcrumbs.length - 1 - index;
    
    setState(() {
      // Remove breadcrumbs
      _currentBreadcrumbs.removeRange(index + 1, _currentBreadcrumbs.length);
      
      // Pop categories from navigation stack
      for (int i = 0; i < levelsToGoBack && _navigationStack.isNotEmpty; i++) {
        _currentCategories = _navigationStack.removeLast();
      }
      
      // Set the title based on current breadcrumbs
      if (_currentBreadcrumbs.length == 1) {
        _currentTitle = '${_currentBreadcrumbs.first} Anatomy';
      } else {
        _currentTitle = _currentBreadcrumbs.last;
      }
      
      print('sameed - Navigation: Navigated to breadcrumb level $index, title: $_currentTitle');
    });
  }
  
  void _reconstructParentCategory() {
    // This method handles going back within subcategory levels
    // For now, we'll use a simplified approach - in a real app you might want to 
    // maintain a navigation stack or use a more sophisticated state management
    final parentCategoryName = _currentBreadcrumbs.last;
    
    if (parentCategoryName == 'Energy') {
      final energyCategory = app_category.CategoryData.getAnatomyCategoryWithEnergySubcategories(_animalId, 'energy');
      if (energyCategory != null) {
        _currentCategories = energyCategory.subcategories;
        _currentTitle = energyCategory.label;
      }
      } else {
        // For other anatomy categories, get from anatomy categories
        final anatomyCategories = app_category.CategoryData.getAnatomyCategoriesForAnimal(_animalId);
      final parentCategory = anatomyCategories.firstWhere(
        (cat) => cat.label == parentCategoryName,
        orElse: () => anatomyCategories.first,
      );
      _currentCategories = parentCategory.subcategories;
      _currentTitle = parentCategory.label;
    }
  }

  app_category.Category? _findParentCategory(List<app_category.Category> categories, List<String> breadcrumbs) {
    if (breadcrumbs.isEmpty) return null;

    for (final category in categories) {
      if (category.label == breadcrumbs.last) {
        return category;
      }

      final found = _findParentCategory(category.subcategories, breadcrumbs);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  app_category.Category? _findCategoryByLabel(List<app_category.Category> categories, String label) {
    for (final category in categories) {
      if (category.label == label) {
        return category;
      }

      final found = _findCategoryByLabel(category.subcategories, label);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  Future<void> _showCategoryDetails(app_category.Category category) async {
    final contentService = ContentService();
    
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Get the full breadcrumb path including current category navigation
      final fullBreadcrumbs = List<String>.from(_currentBreadcrumbs);
      
      // Ensure the animal ID is always the first breadcrumb for animal-specific content
      if (fullBreadcrumbs.isEmpty || fullBreadcrumbs.first.toLowerCase() != _animalId) {
        // Insert or replace the first breadcrumb with the correct animal ID
        if (fullBreadcrumbs.isEmpty) {
          fullBreadcrumbs.insert(0, _animalId.toLowerCase());
        } else {
          fullBreadcrumbs[0] = _animalId.toLowerCase();
        }
      }
      
      print('DEBUG: CategoryScreen - Animal ID: $_animalId, Full breadcrumbs: $fullBreadcrumbs');
      
      // Check if content exists and load it
      final hasContent = await contentService.hasContent(category.id, fullBreadcrumbs);
      
      if (mounted) {
        Navigator.of(context).pop(); // Close loading dialog
        
        if (hasContent) {
          // Load content and navigate to explanation screen
          final explanationText = await contentService.getExplanationText(category.id, fullBreadcrumbs);
          
          // Use category's predefined imagePath if available, otherwise generate one
          final imagePath = category.imagePath ?? contentService.getImagePath(category.id, fullBreadcrumbs);
          
          print('DEBUG: CategoryScreen - Content loaded for ${category.label}');
          print('DEBUG: CategoryScreen - Category has imagePath: ${category.imagePath != null}');
          print('DEBUG: CategoryScreen - Final image path: $imagePath');
          print('DEBUG: CategoryScreen - Explanation length: ${explanationText.length}');
          
          if (mounted && explanationText.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryExplanationScreen(
                  categoryName: category.label,
                  imagePath: imagePath,
                  explanation: explanationText,
                ),
              ),
            );
            } else {
              _showComingSoonDialog(category);
            }
          } else {
            _showComingSoonDialog(category);
          }
        }
      } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(); // Close loading dialog
        _showComingSoonDialog(category);
      }
    }
  }

  void _showComingSoonDialog(app_category.Category category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(category.label),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              category.icon,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'You selected: ${category.label}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'This content will be available soon with detailed information about ${category.label.toLowerCase()}.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showSubscriptionRequiredOverlay(app_category.Category category) {
    final animalType = _currentBreadcrumbs.isNotEmpty ? _currentBreadcrumbs.first : 'Animal';
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SubscriptionRequiredOverlay(
        animalType: animalType,
        categoryType: category.label,
        onSubscribe: () {
          Navigator.of(context).pop(); // Close overlay
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SubscriptionScreen(),
              fullscreenDialog: true,
            ),
          );
        },
        onGoBack: () {
          Navigator.of(context).pop(); // Close overlay, stay on current screen
        },
      ),
    );
  }

  void _showSubscriptionRequiredAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.workspace_premium,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Premium Required',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To access detailed anatomy information, you need a premium subscription.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Premium features include:',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            ...['Unlimited access to all content', 'High-quality anatomical diagrams', 'Detailed descriptions'].map((feature) => 
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.success,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog first
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SubscriptionScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Buy Premium'),
          ),
        ],
      ),
    );
  }

  app_category.Category _findCategoryInHierarchy(String label, int breadcrumbIndex) {
    // Search through the category hierarchy to find the category with the correct image
    try {
      if (breadcrumbIndex == 1) {
        // Second level - anatomy categories (like Muscular System, Energy, etc.)
        final anatomyCategories = app_category.CategoryData.getAnatomyCategoriesForAnimal(_animalId);
        final found = anatomyCategories.firstWhere(
          (cat) => cat.label == label,
          orElse: () => app_category.Category(
            id: label.toLowerCase(),
            label: label,
            icon: Icons.category,
          ),
        );
        return found;
      } else if (breadcrumbIndex == 2 && _currentBreadcrumbs.length > 2) {
        // Third level - check if it's Energy subcategories
        if (_currentBreadcrumbs[1] == 'Energy') {
          final energyCategory = app_category.CategoryData.getAnatomyCategoryWithEnergySubcategories(_animalId, 'energy');
          if (energyCategory != null) {
            final found = energyCategory.subcategories.firstWhere(
              (cat) => cat.label == label,
              orElse: () => app_category.Category(
                id: label.toLowerCase(),
                label: label,
                icon: Icons.category,
              ),
            );
            return found;
          }
        } else {
          // Other anatomy subcategories
          final anatomyCategories = app_category.CategoryData.getAnatomyCategoriesForAnimal(_animalId);
          final parentCategory = anatomyCategories.firstWhere(
            (cat) => cat.label == _currentBreadcrumbs[1],
            orElse: () => anatomyCategories.first,
          );
          final found = parentCategory.subcategories.firstWhere(
            (cat) => cat.label == label,
            orElse: () => app_category.Category(
              id: label.toLowerCase(),
              label: label,
              icon: Icons.category,
            ),
          );
          return found;
        }
      } else if (breadcrumbIndex >= 3) {
        // Fourth level and beyond - search recursively through the current navigation path
        return _findDeepCategory(label, breadcrumbIndex);
      }
    } catch (e) {
      print('sameed - Error finding category in hierarchy: $e');
    }
    
    // Fallback category
    return app_category.Category(
      id: label.toLowerCase(),
      label: label,
      icon: Icons.category,
    );
  }

  app_category.Category _findDeepCategory(String label, int breadcrumbIndex) {
    // For deeper levels, we need to traverse the category tree
    // This is a simplified approach - in a real app you might want more sophisticated tracking
    
    // Try to find in current categories first
    if (_currentCategories.isNotEmpty) {
      final found = _currentCategories.firstWhere(
        (cat) => cat.label == label,
        orElse: () => app_category.Category(
          id: label.toLowerCase(),
          label: label,
          icon: Icons.category,
        ),
      );
      if (found.label == label) {
        return found;
      }
    }
    
    // Fallback category
    return app_category.Category(
      id: label.toLowerCase(),
      label: label,
      icon: Icons.category,
    );
  }

  List<Widget> _buildWebBreadcrumbs(BuildContext context) {
    List<Widget> breadcrumbWidgets = [];
    
    for (int i = 0; i < _currentBreadcrumbs.length; i++) {
      final breadcrumb = _currentBreadcrumbs[i];
      final isLast = i == _currentBreadcrumbs.length - 1;
      
      // Add separator if not first item
      if (i > 0) {
        breadcrumbWidgets.add(
          Text(
            ' > ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }
      
      // Add breadcrumb text
      breadcrumbWidgets.add(
        InkWell(
          onTap: isLast ? null : () => _navigateToBreadcrumb(i),
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              breadcrumb,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isLast 
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).colorScheme.primary,
                fontWeight: isLast ? FontWeight.w600 : FontWeight.w500,
                decoration: isLast ? null : TextDecoration.underline,
              ),
            ),
          ),
        ),
      );
    }
    
    return breadcrumbWidgets;
  }

  List<Widget> _buildMobileBreadcrumbs(BuildContext context, List<app_category.Category> breadcrumbCategories) {
    return breadcrumbCategories.expand<Widget>((cat) => [
      Icon(
        Icons.chevron_right,
        size: 14,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
      ),
      const SizedBox(width: 8),
      // Use category image if available, otherwise fallback to icon
      cat.imagePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  cat.imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to icon if image fails to load
                    return Icon(
                      cat.icon,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    );
                  },
                ),
              ),
            )
          : Icon(
              cat.icon,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
      const SizedBox(width: 8),
    ]).toList();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<local_auth.AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    List<app_category.Category> breadcrumbCategories = [];
    for (int i = 0; i < _currentBreadcrumbs.length; i++) {
      final label = _currentBreadcrumbs[i];
      app_category.Category? foundCategory;
      
      if (i == 0) {
        // First breadcrumb is always a main animal category
        final mainCategories = app_category.CategoryData.mainCategories;
        foundCategory = mainCategories.firstWhere(
          (category) => category.label == label,
          orElse: () => app_category.Category(
            id: label.toLowerCase(),
            label: label,
            icon: Icons.category,
          ),
        );
      } else {
        // For subcategories, search through the appropriate category hierarchy
        foundCategory = _findCategoryInHierarchy(label, i);
      }
      
      breadcrumbCategories.add(foundCategory);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: _navigateBack,
          ),
        ),
        title: Text(
          _currentTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                themeProvider.themeMode == ThemeModeOption.system
                    ? Icons.brightness_auto
                    : themeProvider.isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () => _showThemeSelectionDialog(context, themeProvider),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () async {
                await authProvider.signOut();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Logged out successfully'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Breadcrumb section
              if (_currentBreadcrumbs.isNotEmpty)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: kIsWeb 
                    ? Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: _buildWebBreadcrumbs(context),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Icon(
                            Icons.home,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: _buildMobileBreadcrumbs(context, breadcrumbCategories),
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              
              // Category grid
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.background,
                        Theme.of(context).colorScheme.background.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: CategoryGrid(
                    categories: _currentCategories,
                    scrollController: _scrollController,
                    onCategoryTap: _onCategoryTap,
                  ),
                ),
              ),
            ],
          ),
          ScrollToTopButton(
            scrollController: _scrollController,
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }

  void _showThemeSelectionDialog(BuildContext context, ThemeProvider themeProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption(
                context,
                'System',
                'Follow device settings',
                Icons.brightness_auto,
                ThemeModeOption.system,
                themeProvider,
              ),
              const SizedBox(height: 8),
              _buildThemeOption(
                context,
                'Light',
                'Always light mode',
                Icons.light_mode,
                ThemeModeOption.light,
                themeProvider,
              ),
              const SizedBox(height: 8),
              _buildThemeOption(
                context,
                'Dark',
                'Always dark mode',
                Icons.dark_mode,
                ThemeModeOption.dark,
                themeProvider,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    ThemeModeOption mode,
    ThemeProvider themeProvider,
  ) {
    final isSelected = themeProvider.themeMode == mode;

    return InkWell(
      onTap: () {
        themeProvider.setThemeMode(mode);
        Navigator.of(context).pop();
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}

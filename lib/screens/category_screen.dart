import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../widgets/category_grid.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../providers/theme_provider.dart';
import '../themes/app_themes.dart';

class CategoryScreen extends StatefulWidget {
  final List<Category> categories;
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
  late List<Category> _currentCategories;
  late String _currentTitle;
  late List<String> _currentBreadcrumbs;

  @override
  void initState() {
    super.initState();
    _currentCategories = widget.categories;
    _currentTitle = widget.title;
    _currentBreadcrumbs = List.from(widget.breadcrumbs);
  }

  void _onCategoryTap(Category category) {
    if (category.hasSubcategories) {
      // Navigate to subcategories
      setState(() {
        _currentCategories = category.subcategories;
        _currentTitle = category.label;
        _currentBreadcrumbs.add(category.label);
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

    // Navigate up one level
    setState(() {
      _currentBreadcrumbs.removeLast();

      // Find the parent category
      Category? parentCategory = _findParentCategory(
        CategoryData.mainCategories,
        _currentBreadcrumbs,
      );

      if (parentCategory != null) {
        _currentCategories = parentCategory.subcategories;
        _currentTitle = parentCategory.label;
      }
    });
  }

  Category? _findParentCategory(List<Category> categories, List<String> breadcrumbs) {
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

  void _showCategoryDetails(Category category) {
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
            ),
            const SizedBox(height: 8),
            Text(
              'Category ID: ${category.id}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
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

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<local_auth.AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

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
      body: Column(
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
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Home > ${_currentBreadcrumbs.join(' > ')}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                      overflow: TextOverflow.ellipsis,
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
                onCategoryTap: _onCategoryTap,
              ),
            ),
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

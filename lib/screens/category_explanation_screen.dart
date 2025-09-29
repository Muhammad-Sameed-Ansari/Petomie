import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../themes/app_themes.dart';

class CategoryExplanationScreen extends StatefulWidget {
  final String categoryName;
  final String imagePath;
  final String explanation;

  const CategoryExplanationScreen({
    super.key,
    required this.categoryName,
    required this.imagePath,
    required this.explanation,
  });

  @override
  State<CategoryExplanationScreen> createState() => _CategoryExplanationScreenState();
}

class _CategoryExplanationScreenState extends State<CategoryExplanationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isWeb = kIsWeb;
    
    // Enhanced responsive breakpoints for web
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;
    final isMobile = screenWidth <= 800;
    
    // Dynamic image height based on screen size and platform
    final imageHeight = isWeb ? _calculateWebImageHeight(screenWidth, screenHeight) : screenHeight * 0.3;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Custom App Bar with Image
          SliverAppBar(
            expandedHeight: imageHeight,
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
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
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
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
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Main Image - Advanced constraint handling for web
                  Positioned.fill(
                    child: isWeb 
                      ? _buildWebOptimizedImage(context, screenWidth, screenHeight, imageHeight, isDesktop, isTablet, isMobile)
                      : Image.asset(
                          widget.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildImageFallback(context);
                          },
                        ),
                  ),
                  
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Theme.of(context).colorScheme.background.withOpacity(0.3),
                          Theme.of(context).colorScheme.background.withOpacity(0.7),
                        ],
                        stops: const [0.0, 0.4, 0.8, 1.0],
                      ),
                    ),
                  ),
                  
                  // Title Overlay
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            _extractPageTitle(widget.explanation) ?? widget.categoryName,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content Section
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  width: double.infinity,
                  constraints: isWeb ? const BoxConstraints(maxWidth: 1200) : null,
                  margin: isWeb ? const EdgeInsets.symmetric(horizontal: 20) : EdgeInsets.zero,
                  padding: EdgeInsets.all(isWeb ? 32 : 24),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: isWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        // Explanation Content
                        _buildExplanationContent(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExplanationContent(BuildContext context) {
    // Parse the explanation text and create formatted sections
    final sections = _parseExplanationText(widget.explanation);
    final isWeb = kIsWeb;
    
    return Column(
      crossAxisAlignment: isWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: sections.map((section) => _buildSection(context, section)).toList(),
    );
  }

  Widget _buildSection(BuildContext context, ExplanationSection section) {
    final isWeb = kIsWeb;
    
    return Container(
      width: double.infinity,
      constraints: isWeb ? const BoxConstraints(maxWidth: 800) : null,
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: isWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          if (section.title.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                section.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: isWeb ? TextAlign.center : TextAlign.start,
              ),
            ),
          
          ...section.content.map((item) => _buildContentItem(context, item)).toList(),
        ],
      ),
    );
  }

  Widget _buildContentItem(BuildContext context, String content) {
    final isWeb = kIsWeb;
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isWeb ? 20 : 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 1.6,
          fontSize: isWeb ? 16 : null,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        textAlign: isWeb ? TextAlign.center : TextAlign.start,
      ),
    );
  }


  /// Extract page title from ##Title## format (first line)
  String? _extractPageTitle(String text) {
    final lines = text.split('\n');
    if (lines.isNotEmpty) {
      final firstLine = lines.first.trim();
      if (firstLine.startsWith('##') && firstLine.endsWith('##') && firstLine.length > 4) {
        return firstLine.substring(2, firstLine.length - 2);
      }
    }
    return null;
  }

  /// Parse explanation text with new format
  List<ExplanationSection> _parseExplanationText(String text) {
    final sections = <ExplanationSection>[];
    final lines = text.split('\n');
    
    ExplanationSection? currentSection;
    int startIndex = 0;
    
    // Skip the page title line if it exists
    if (lines.isNotEmpty && lines.first.trim().startsWith('##') && lines.first.trim().endsWith('##')) {
      startIndex = 1;
    }
    
    for (int i = startIndex; i < lines.length; i++) {
      final line = lines[i];
      final trimmedLine = line.trim();
      
      // Skip empty lines unless we're collecting content
      if (trimmedLine.isEmpty) {
        if (currentSection != null && currentSection.content.isNotEmpty) {
          // Empty line signals end of section content
          continue;
        }
        continue;
      }
      
      // Check if this is a section header #Title#
      if (trimmedLine.startsWith('#') && trimmedLine.endsWith('#') && trimmedLine.length > 2) {
        // Save previous section
        if (currentSection != null) {
          sections.add(currentSection);
        }
        
        // Start new section
        final title = trimmedLine.substring(1, trimmedLine.length - 1);
        currentSection = ExplanationSection(
          title: title,
          content: [],
        );
      } else {
        // Add content to current section
        if (currentSection == null) {
          // Create a default section for content without a header
          currentSection = ExplanationSection(title: '', content: []);
        }
        currentSection.content.add(trimmedLine);
      }
    }
    
    // Add the last section
    if (currentSection != null) {
      sections.add(currentSection);
    }
    
    return sections;
  }

  /// Calculate optimal image height for web platform based on screen dimensions
  double _calculateWebImageHeight(double screenWidth, double screenHeight) {
    if (screenWidth > 1200) {
      // Desktop: larger image area
      return screenHeight * 0.45;
    } else if (screenWidth > 800) {
      // Tablet: medium image area
      return screenHeight * 0.4;
    } else {
      // Mobile web: smaller image area
      return screenHeight * 0.35;
    }
  }

  /// Build web-optimized image with advanced constraint handling
  Widget _buildWebOptimizedImage(
    BuildContext context,
    double screenWidth,
    double screenHeight,
    double imageHeight,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    // Calculate responsive constraints
    final imageConstraints = _calculateImageConstraints(screenWidth, imageHeight, isDesktop, isTablet, isMobile);
    final borderRadius = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
    final backgroundOpacity = isDesktop ? 0.05 : 0.1;
    
    return Container(
      color: Theme.of(context).colorScheme.surface.withOpacity(backgroundOpacity),
      child: Center(
        child: ConstrainedBox(
          constraints: imageConstraints,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Determine optimal aspect ratio based on available space
              final availableAspectRatio = constraints.maxWidth / constraints.maxHeight;
              final shouldUseSquareAspect = availableAspectRatio > 0.7 && availableAspectRatio < 1.5;
              
              return AspectRatio(
                aspectRatio: shouldUseSquareAspect ? 1.0 : availableAspectRatio.clamp(0.8, 1.2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: isDesktop ? 20 : 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildImageFallback(context);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Calculate image constraints based on screen size and device type
  BoxConstraints _calculateImageConstraints(
    double screenWidth,
    double imageHeight,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    if (isDesktop) {
      // Desktop: More generous constraints with max width limit
      return BoxConstraints(
        maxWidth: (screenWidth * 0.6).clamp(400, 600),
        maxHeight: imageHeight * 0.85,
        minWidth: 300,
        minHeight: 200,
      );
    } else if (isTablet) {
      // Tablet: Balanced constraints
      return BoxConstraints(
        maxWidth: screenWidth * 0.7,
        maxHeight: imageHeight * 0.9,
        minWidth: 250,
        minHeight: 180,
      );
    } else {
      // Mobile web: Compact constraints
      return BoxConstraints(
        maxWidth: screenWidth * 0.85,
        maxHeight: imageHeight * 0.9,
        minWidth: 200,
        minHeight: 150,
      );
    }
  }

  Widget _buildImageFallback(BuildContext context) {
    final isWeb = kIsWeb;
    
    return Image.asset(
      'assets/images/logo_transparent.webp',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
                Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ],
            ),
          ),
          child: Center(
            child: Icon(
              Icons.image_not_supported,
              size: isWeb ? 64 : 48,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        );
      },
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

class ExplanationSection {
  final String title;
  final List<String> content;

  ExplanationSection({
    required this.title,
    required this.content,
  });
}


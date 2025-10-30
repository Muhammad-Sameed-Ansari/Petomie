import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

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
    
    // Debug information about the image path
    print('DEBUG: CategoryExplanationScreen initialized');
    print('DEBUG: Category name: ${widget.categoryName}');
    print('DEBUG: Image path: ${widget.imagePath}');
    
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
                            print('DEBUG: Failed to load image (mobile): ${widget.imagePath}');
                            print('DEBUG: Error details: $error');
                            print('DEBUG: Stack trace: $stackTrace');
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
              child: _buildFormattedText(
                context,
                section.title,
                Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                isWeb ? TextAlign.center : TextAlign.start,
              ),
            ),
          
          ...section.content.map((item) => _buildContentItem(context, item)).toList(),
        ],
      ),
    );
  }

  Widget _buildContentItem(BuildContext context, dynamic content) {
    final isWeb = kIsWeb;
    
    // Handle different content types
    if (content is TableData) {
      return _buildTableWidget(context, content);
    } else if (content is ExpandableData) {
      return _buildExpandableWidget(context, content);
    } else if (content is String) {
      // Check if this is a subheading
      if (content.startsWith('###SUBHEADING###')) {
        final subheadingTitle = content.substring('###SUBHEADING###'.length);
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 16, top: 8),
          padding: EdgeInsets.symmetric(
            horizontal: isWeb ? 16 : 12,
            vertical: isWeb ? 12 : 8,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: _buildFormattedText(
            context,
            subheadingTitle,
            Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: isWeb ? 18 : 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            isWeb ? TextAlign.center : TextAlign.start,
          ),
        );
      }
      
      // Regular content item
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
        child: _buildFormattedText(
          context,
          content,
          Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.6,
            fontSize: isWeb ? 16 : null,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          isWeb ? TextAlign.center : TextAlign.start,
        ),
      );
    }
    
    return const SizedBox.shrink();
  }

  /// Build non-scrollable table widget that shows all data
  Widget _buildTableWidget(BuildContext context, TableData tableData) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;
    
    // Calculate column count
    final columnCount = tableData.headers.length;
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Table(
          // Use flexible column widths to fit all columns without scrolling
          columnWidths: Map.fromEntries(
            List.generate(columnCount, (index) => MapEntry(index, const FlexColumnWidth())),
          ),
          border: TableBorder.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            width: 1,
          ),
          children: [
            // Header row
            TableRow(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
              ),
              children: tableData.headers.map((header) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: isDesktop ? 16 : (isTablet ? 14 : 12),
                    horizontal: isDesktop ? 12 : (isTablet ? 10 : 8),
                  ),
                  child: _buildFormattedText(
                    context,
                    header,
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: isDesktop ? 14 : (isTablet ? 13 : 12),
                    ),
                    TextAlign.center,
                  ),
                );
              }).toList(),
            ),
            // Data rows
            ...tableData.rows.map((row) {
              return TableRow(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                children: row.map((cell) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: isDesktop ? 14 : (isTablet ? 12 : 10),
                      horizontal: isDesktop ? 12 : (isTablet ? 10 : 8),
                    ),
                    child: _buildFormattedText(
                      context,
                      cell,
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: isDesktop ? 13 : (isTablet ? 12 : 11),
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 1.4,
                      ),
                      TextAlign.center,
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  /// Build expandable/collapsible widget with animations
  Widget _buildExpandableWidget(BuildContext context, ExpandableData expandableData) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title section
          if (expandableData.title.isNotEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isDesktop ? 20 : (isTablet ? 18 : 16)),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: _buildFormattedText(
                context,
                expandableData.title,
                Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: isDesktop ? 20 : (isTablet ? 18 : 16),
                ),
                isWeb ? TextAlign.center : TextAlign.start,
              ),
            ),
          
          // Expandable items
          ...expandableData.items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == expandableData.items.length - 1;
            
            return _ExpandableItemWidget(
              item: item,
              isLast: isLast,
              isWeb: isWeb,
              isDesktop: isDesktop,
              isTablet: isTablet,
            );
          }).toList(),
        ],
      ),
    );
  }

  /// Build formatted text with bold support for **text** patterns
  Widget _buildFormattedText(BuildContext context, String text, TextStyle? baseStyle, TextAlign textAlign) {
    final spans = <TextSpan>[];
    final pattern = RegExp(r'\*\*(.*?)\*\*');
    int lastMatchEnd = 0;

    for (final match in pattern.allMatches(text)) {
      // Add text before the match (normal text)
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: baseStyle,
        ));
      }

      // Add the matched bold text (without the ** markers)
      spans.add(TextSpan(
        text: match.group(1), // The text inside **...**
        style: baseStyle?.copyWith(fontWeight: FontWeight.bold),
      ));

      lastMatchEnd = match.end;
    }

    // Add any remaining text after the last match
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: baseStyle,
      ));
    }

    // If no matches found, return simple Text widget
    if (spans.isEmpty) {
      return Text(
        text,
        style: baseStyle,
        textAlign: textAlign,
      );
    }

    return RichText(
      text: TextSpan(children: spans),
      textAlign: textAlign,
    );
  }

  /// Extract page title from #Title# format (first line)
  String? _extractPageTitle(String text) {
    final lines = text.split('\n');
    if (lines.isNotEmpty) {
      final firstLine = lines.first.trim();
      if (firstLine.startsWith('#') && firstLine.endsWith('#') && firstLine.length > 2) {
        return firstLine.substring(1, firstLine.length - 1);
      }
    }
    return null;
  }

  /// Parse explanation text with new format including tables and expandables
  List<ExplanationSection> _parseExplanationText(String text) {
    try {
      final sections = <ExplanationSection>[];
      final lines = text.split('\n');
      
      ExplanationSection? currentSection;
      int startIndex = 0;
      
      // Skip the page title line if it exists
      if (lines.isNotEmpty && lines.first.trim().startsWith('#') && lines.first.trim().endsWith('#')) {
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
        
        // Check for table start
        if (trimmedLine == '###TABLE_START###') {
          final tableData = _parseTable(lines, i);
          if (tableData != null) {
            if (currentSection == null) {
              currentSection = ExplanationSection(title: '', content: [], isSubheading: false);
            }
            currentSection.content.add(tableData.table);
            i = tableData.endIndex;
            continue;
          }
        }
        
        // Check for expandable start
        if (trimmedLine.startsWith('###EXPANDABLE_START###')) {
          final expandableData = _parseExpandable(lines, i);
          if (expandableData != null) {
            if (currentSection == null) {
              currentSection = ExplanationSection(title: '', content: [], isSubheading: false);
            }
            currentSection.content.add(expandableData.expandable);
            i = expandableData.endIndex;
            continue;
          }
        }
        
        // Check for subheading FIRST (###Title###) before section header
        if (trimmedLine.startsWith('###') && trimmedLine.endsWith('###') && trimmedLine.length > 6) {
          // Skip if it's a table or expandable marker
          if (trimmedLine == '###TABLE_START###' || 
              trimmedLine == '###TABLE_END###' ||
              trimmedLine.startsWith('###EXPANDABLE_START###') ||
              trimmedLine == '###EXPANDABLE_END###' ||
              trimmedLine.startsWith('###EXPAND_ITEM_START###') ||
              trimmedLine == '###EXPAND_ITEM_END###') {
            continue;
          }
          
          // This is a subheading ###Title###
          if (currentSection == null) {
            // Create a default section for subheading without a main header
            currentSection = ExplanationSection(title: '', content: [], isSubheading: false);
          }
          
          // Add subheading as special content
          final subheadingTitle = trimmedLine.substring(3, trimmedLine.length - 3);
          currentSection.content.add('###SUBHEADING###$subheadingTitle');
        } else if (trimmedLine.startsWith('##') && trimmedLine.endsWith('##') && trimmedLine.length > 4) {
          // Save previous section
          if (currentSection != null) {
            sections.add(currentSection);
          }
          
          // Start new section
          final title = trimmedLine.substring(2, trimmedLine.length - 2);
          currentSection = ExplanationSection(
            title: title,
            content: [],
            isSubheading: false,
          );
        } else {
          // Add content to current section
          if (currentSection == null) {
            // Create a default section for content without a header
            currentSection = ExplanationSection(title: '', content: [], isSubheading: false);
          }
          currentSection.content.add(trimmedLine);
        }
      }
      
      // Add the last section
      if (currentSection != null) {
        sections.add(currentSection);
      }
      
      return sections;
    } catch (e, stackTrace) {
      print('ERROR: Exception in _parseExplanationText: $e');
      // Return a safe fallback
      return [ExplanationSection(title: 'Error', content: ['Failed to parse content: $e'], isSubheading: false)];
    }
  }

  /// Parse table data from lines starting at startIndex
  _TableParseResult? _parseTable(List<String> lines, int startIndex) {
    try {
      final headers = <String>[];
      final rows = <List<String>>[];
      
      int i = startIndex + 1; // Skip TABLE_START line
      
      // Parse headers (first line after TABLE_START)
      if (i < lines.length) {
        final headerLine = lines[i].trim();
        if (headerLine.isNotEmpty) {
          headers.addAll(headerLine.split('|').map((h) => h.trim()));
          i++;
        }
      }
      
      // Parse rows until TABLE_END
      while (i < lines.length) {
        final line = lines[i].trim();
        
        if (line == '###TABLE_END###') {
          break;
        }
        
        if (line.isNotEmpty && line.contains('|')) {
          final rowData = line.split('|').map((cell) => cell.trim()).toList();
          rows.add(rowData);
        }
        i++;
        
        // Safety check to prevent infinite loop
        if (i > startIndex + 100) {
          break;
        }
      }
      
      if (headers.isNotEmpty && rows.isNotEmpty) {
        return _TableParseResult(TableData(headers: headers, rows: rows), i);
      }
      
      return null;
    } catch (e) {
      print('ERROR TABLE: Exception in _parseTable: $e');
      return null;
    }
  }

  /// Parse expandable data from lines starting at startIndex
  _ExpandableParseResult? _parseExpandable(List<String> lines, int startIndex) {
    try {
      final items = <ExpandableItem>[];
      String title = '';
      
      int i = startIndex;
      final startLine = lines[i].trim();
      
      // Extract title from EXPANDABLE_START line
      if (startLine.startsWith('###EXPANDABLE_START###')) {
        title = startLine.substring('###EXPANDABLE_START###'.length);
      }
      
      i++; // Move to next line
      
      String? currentItemTitle;
      final currentItemContent = <String>[];
      
      while (i < lines.length) {
        final line = lines[i].trim();
        
        if (line == '###EXPANDABLE_END###') {
          // Add the last item if exists
          if (currentItemTitle != null && currentItemContent.isNotEmpty) {
            items.add(ExpandableItem(
              title: currentItemTitle,
              content: currentItemContent.join('\n'),
            ));
          }
          break;
        }
        
        if (line.startsWith('###EXPAND_ITEM_START###')) {
          // Save previous item if exists
          if (currentItemTitle != null && currentItemContent.isNotEmpty) {
            items.add(ExpandableItem(
              title: currentItemTitle,
              content: currentItemContent.join('\n'),
            ));
          }
          
          // Start new item
          currentItemTitle = line.substring('###EXPAND_ITEM_START###'.length);
          currentItemContent.clear();
        } else if (line == '###EXPAND_ITEM_END###') {
          // Item end marker - content already collected
          // Continue to next iteration (i++ will happen at end of loop)
        } else if (line.isNotEmpty && currentItemTitle != null) {
          // Add content to current item
          currentItemContent.add(line);
        }
        
        i++;
        
        // Safety check to prevent infinite loop
        if (i > startIndex + 200) {
          break;
        }
      }
      
      if (items.isNotEmpty) {
        return _ExpandableParseResult(ExpandableData(title: title, items: items), i);
      }
      
      return null;
    } catch (e) {
      print('ERROR EXPANDABLE: Exception in _parseExpandable: $e');
      return null;
    }
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
                        print('DEBUG: Failed to load image (web): ${widget.imagePath}');
                        print('DEBUG: Error details: $error');
                        print('DEBUG: Stack trace: $stackTrace');
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
    
    // Try the logo first, then show gradient if that fails too
    return Image.asset(
      'assets/images/logo_transparent.png',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        print('DEBUG: Logo fallback also failed, using gradient fallback');
        print('DEBUG: Original image path was: ${widget.imagePath}');
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pets,
                  size: isWeb ? 64 : 48,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.categoryName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (isWeb) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Image not found: ${widget.imagePath}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
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
  final List<dynamic> content; // Changed to dynamic to support different content types
  final bool isSubheading;

  ExplanationSection({
    required this.title,
    required this.content,
    this.isSubheading = false,
  });
}

class TableData {
  final List<String> headers;
  final List<List<String>> rows;

  TableData({
    required this.headers,
    required this.rows,
  });
}

class ExpandableData {
  final String title;
  final List<ExpandableItem> items;

  ExpandableData({
    required this.title,
    required this.items,
  });
}

class ExpandableItem {
  final String title;
  final String content;
  bool isExpanded;

  ExpandableItem({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}

class _TableParseResult {
  final TableData table;
  final int endIndex;
  
  _TableParseResult(this.table, this.endIndex);
}

class _ExpandableParseResult {
  final ExpandableData expandable;
  final int endIndex;
  
  _ExpandableParseResult(this.expandable, this.endIndex);
}

class _ExpandableItemWidget extends StatefulWidget {
  final ExpandableItem item;
  final bool isLast;
  final bool isWeb;
  final bool isDesktop;
  final bool isTablet;

  const _ExpandableItemWidget({
    required this.item,
    required this.isLast,
    required this.isWeb,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  State<_ExpandableItemWidget> createState() => _ExpandableItemWidgetState();
}

class _ExpandableItemWidgetState extends State<_ExpandableItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _iconRotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _iconRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.item.isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      widget.item.isExpanded = !widget.item.isExpanded;
      if (widget.item.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  /// Build formatted text with bold support for **text** patterns
  Widget _buildFormattedTextForExpandable(BuildContext context, String text, TextStyle? baseStyle, TextAlign textAlign) {
    final spans = <TextSpan>[];
    final pattern = RegExp(r'\*\*(.*?)\*\*');
    int lastMatchEnd = 0;

    for (final match in pattern.allMatches(text)) {
      // Add text before the match (normal text)
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: baseStyle,
        ));
      }

      // Add the matched bold text (without the ** markers)
      spans.add(TextSpan(
        text: match.group(1), // The text inside **...**
        style: baseStyle?.copyWith(fontWeight: FontWeight.bold),
      ));

      lastMatchEnd = match.end;
    }

    // Add any remaining text after the last match
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: baseStyle,
      ));
    }

    // If no matches found, return simple Text widget
    if (spans.isEmpty) {
      return Text(
        text,
        style: baseStyle,
        textAlign: textAlign,
      );
    }

    return RichText(
      text: TextSpan(children: spans),
      textAlign: textAlign,
    );
  }

  /// Build rich content with support for paragraphs, bullet points, and formatting
  Widget _buildRichContent(BuildContext context, String content) {
    final lines = content.split('\n');
    final widgets = <Widget>[];
    
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      
      if (line.isEmpty) {
        // Add spacing for empty lines (paragraph breaks)
        widgets.add(const SizedBox(height: 8));
        continue;
      }
      
      Widget textWidget;
      
      if (line.startsWith('**') && line.endsWith('**') && line.length > 4) {
        // Bold headers
        final boldText = line.substring(2, line.length - 2);
        textWidget = Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 12, bottom: 8),
          child: Text(
            boldText,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: widget.isDesktop ? 16 : (widget.isTablet ? 15 : 14),
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: widget.isWeb ? TextAlign.center : TextAlign.start,
          ),
        );
      } else if (line.startsWith('• ')) {
        // Bullet points
        final bulletText = line.substring(2);
        textWidget = Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, right: 8),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: _buildFormattedTextForExpandable(
                  context,
                  bulletText,
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    fontSize: widget.isDesktop ? 14 : (widget.isTablet ? 13 : 12),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  widget.isWeb ? TextAlign.center : TextAlign.start,
                ),
              ),
            ],
          ),
        );
      } else {
        // Regular paragraphs
        textWidget = Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          child: _buildFormattedTextForExpandable(
            context,
            line,
            Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              fontSize: widget.isDesktop ? 15 : (widget.isTablet ? 14 : 13),
              color: Theme.of(context).colorScheme.onSurface,
            ),
            widget.isWeb ? TextAlign.center : TextAlign.start,
          ),
        );
      }
      
      widgets.add(textWidget);
    }
    
    return Column(
      crossAxisAlignment: widget.isWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.isLast ? null : Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Header with title and expand/collapse button
          InkWell(
            onTap: _toggleExpansion,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                widget.isDesktop ? 20 : (widget.isTablet ? 18 : 16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildFormattedTextForExpandable(
                      context,
                      widget.item.title,
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: widget.isDesktop ? 18 : (widget.isTablet ? 16 : 15),
                      ),
                      widget.isWeb ? TextAlign.center : TextAlign.start,
                    ),
                  ),
                  const SizedBox(width: 12),
                  AnimatedBuilder(
                    animation: _iconRotationAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _iconRotationAnimation.value * 3.14159,
                        child: Icon(
                          Icons.expand_more,
                          color: Theme.of(context).colorScheme.primary,
                          size: widget.isDesktop ? 28 : (widget.isTablet ? 26 : 24),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          
          // Expandable content
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                widget.isDesktop ? 20 : (widget.isTablet ? 18 : 16),
                0,
                widget.isDesktop ? 20 : (widget.isTablet ? 18 : 16),
                widget.isDesktop ? 20 : (widget.isTablet ? 18 : 16),
              ),
              child: Container(
                padding: EdgeInsets.all(
                  widget.isDesktop ? 16 : (widget.isTablet ? 14 : 12),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                  ),
                ),
                child: _buildRichContent(context, widget.item.content),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/category.dart' as app_category;

class CategoryGrid extends StatelessWidget {
  final List<app_category.Category> categories;
  final Function(app_category.Category category)? onCategoryTap;
  final String? title;
  final ScrollController? scrollController;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.onCategoryTap,
    this.title,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    // Check if we're on web platform
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate responsive parameters
    int crossAxisCount;
    double maxWidth;
    double horizontalPadding;
    
    if (isWeb && screenWidth > 800) {
      // Web layout: 2 columns, limited width, centered
      crossAxisCount = 2;
      maxWidth = screenWidth * 0.35; // 35% of screen width
      horizontalPadding = 16;
    } else {
      // Mobile layout: keep original design
      crossAxisCount = 2;
      maxWidth = double.infinity;
      horizontalPadding = 20;
    }

    Widget gridWidget = ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: !isWeb, // Hide scrollbars on web
      ),
      child: GridView.builder(
        controller: scrollController,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.80, // Slightly taller cards for better text fit
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _CategoryCard(
            category: category,
            onTap: onCategoryTap != null
                ? () => onCategoryTap!(category)
                : null,
          );
        },
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
        Expanded(
          child: isWeb && screenWidth > 800
              ? Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: gridWidget,
                  ),
                )
              : gridWidget,
        ),
      ],
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final app_category.Category category;
  final VoidCallback? onTap;

  const _CategoryCard({
    required this.category,
    this.onTap,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: widget.category.isComingSoon ? null : (_) => _animationController.forward(),
            onTapUp: widget.category.isComingSoon ? null : (_) {
              _animationController.reverse();
              widget.onTap?.call();
            },
            onTapCancel: widget.category.isComingSoon ? null : () => _animationController.reverse(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: widget.category.isComingSoon
                              ? [
                                  Colors.grey.withOpacity(0.7),
                                  Colors.grey.withOpacity(0.5),
                                ]
                              : [
                                  Theme.of(context).colorScheme.surface,
                                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
                                ],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image section
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    widget.category.isComingSoon
                                        ? Colors.grey.withOpacity(0.1)
                                        : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                    widget.category.isComingSoon
                                        ? Colors.grey.withOpacity(0.05)
                                        : Theme.of(context).colorScheme.primary.withOpacity(0.05),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                            child: widget.category.imagePath != null
                                ? ColorFiltered(
                                    colorFilter: widget.category.isComingSoon
                                        ? ColorFilter.mode(
                                            Colors.white.withOpacity(0.7),
                                            BlendMode.modulate,
                                          )
                                        : const ColorFilter.mode(
                                            Colors.transparent,
                                            BlendMode.multiply,
                                          ),
                                    child: Image.asset(
                                      widget.category.imagePath!,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        print('sameed - Image failed to load: ${widget.category.imagePath}');
                                        print('sameed - Error: $error');
                                        return Icon(
                                          widget.category.icon,
                                          size: 60,
                                          color: Theme.of(context).colorScheme.primary.withOpacity(widget.category.isComingSoon ? 0.5 : 1.0),
                                        );
                                      },
                                    ),
                                  )
                                : Icon(
                                    widget.category.icon,
                                    size: 60,
                                    color: Theme.of(context).colorScheme.primary.withOpacity(widget.category.isComingSoon ? 0.5 : 1.0),
                                  ),
                              ),
                            ),
                          ),
                          
                          // Label section
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              minHeight: 55, // Ensure enough space for 2 lines
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: widget.category.isComingSoon
                                  ? Colors.grey.withOpacity(0.7)
                                  : Theme.of(context).colorScheme.surface.withOpacity(1.0),
                              border: Border(
                                top: BorderSide(
                                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                widget.category.label,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.onSurface.withOpacity(widget.category.isComingSoon ? 0.6 : 1.0),
                                      fontSize: 15,
                                      height: 1.2, // Tighter line height for better fit
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Coming Soon overlay
                if (widget.category.isComingSoon)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.primary.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Coming Soon',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

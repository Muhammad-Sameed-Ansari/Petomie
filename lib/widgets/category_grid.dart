import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final Function(Category category)? onCategoryTap;
  final String? title;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.onCategoryTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
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
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.85,
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
        ),
      ],
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final Category category;
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
            onTapDown: (_) => _animationController.forward(),
            onTapUp: (_) {
              _animationController.reverse();
              widget.onTap?.call();
            },
            onTapCancel: () => _animationController.reverse(),
            child: Container(
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
                      colors: [
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surface.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      // Image section
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                Theme.of(context).colorScheme.primary.withOpacity(0.05),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: widget.category.imagePath != null
                                ? Image.asset(
                                    widget.category.imagePath!,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        widget.category.icon,
                                        size: 60,
                                        color: Theme.of(context).colorScheme.primary,
                                      );
                                    },
                                  )
                                : Icon(
                                    widget.category.icon,
                                    size: 60,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                          ),
                        ),
                      ),
                      
                      // Label section
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
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
                                    color: Theme.of(context).colorScheme.onSurface,
                                    fontSize: 16,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

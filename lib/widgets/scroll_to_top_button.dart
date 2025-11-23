import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../themes/app_themes.dart';

/// A floating button that appears when the user scrolls down and allows
/// scrolling back to the top of the screen.
/// 
/// Usage:
/// 1. Create a ScrollController in your StatefulWidget
/// 2. Attach it to your scrollable widget (ListView, GridView, etc.)
/// 3. Add ScrollToTopButton as a child in a Stack
class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;
  final double showOffset;
  final Alignment alignment;
  final EdgeInsets margin;

  const ScrollToTopButton({
    super.key,
    required this.scrollController,
    this.showOffset = 200.0,
    this.alignment = Alignment.bottomRight,
    this.margin = const EdgeInsets.all(16.0),
  });

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    // Listen to scroll events
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final offset = widget.scrollController.offset;
    final shouldShow = offset > widget.showOffset;

    if (shouldShow != _isVisible) {
      setState(() {
        _isVisible = shouldShow;
        if (_isVisible) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    }
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (!_isVisible) {
      return const SizedBox.shrink();
    }

    return Positioned(
      bottom: widget.margin.bottom,
      right: widget.alignment == Alignment.bottomRight ? widget.margin.right : null,
      left: widget.alignment == Alignment.bottomLeft ? widget.margin.left : null,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? AppColors.darkSurface
                    : AppColors.lightSurface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: themeProvider.isDarkMode
                      ? AppColors.darkOnBackground.withOpacity(0.1)
                      : AppColors.lightOnBackground.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 28,
                  color: themeProvider.isDarkMode
                      ? AppColors.darkPrimary
                      : AppColors.lightPrimary,
                ),
                onPressed: _scrollToTop,
                tooltip: 'Scroll to top',
                splashRadius: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

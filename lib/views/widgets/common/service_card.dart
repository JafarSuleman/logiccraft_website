import 'package:flutter/material.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';
import 'package:animate_do/animate_do.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;
  final bool animated;
  final Duration animationDuration;
  final double? width;
  final double? height;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
    this.animated = true,
    this.animationDuration = const Duration(milliseconds: 400),
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final card = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppTheme.primaryBlue.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: _isHovered ? 12 : 5,
                offset: _isHovered ? const Offset(0, 5) : const Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryBlue.withOpacity(0.3)
                  : Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconContainer(),
              const SizedBox(height: 16),
              CustomText.headlineSmall(
                widget.title,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: CustomText.bodyMedium(
                  widget.description,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 16),
              _buildReadMoreButton(),
            ],
          ),
        ),
      ),
    );

    if (widget.animated) {
      return FadeInUp(
        duration: widget.animationDuration,
        child: card,
      );
    }

    return card;
  }

  Widget _buildIconContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: _isHovered ? AppTheme.primaryBlue : AppTheme.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        widget.icon,
        color: _isHovered ? Colors.white : AppTheme.primaryBlue,
        size: 28,
      ),
    );
  }

  Widget _buildReadMoreButton() {
    return Row(
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: _isHovered ? AppTheme.primaryBlue : AppTheme.textDark.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          child: const Text('Learn more'),
        ),
        const SizedBox(width: 4),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            left: _isHovered ? 8 : 0,
          ),
          child: Icon(
            Icons.arrow_forward,
            color: _isHovered ? AppTheme.primaryBlue : AppTheme.textDark.withOpacity(0.7),
            size: 18,
          ),
        ),
      ],
    );
  }
} 
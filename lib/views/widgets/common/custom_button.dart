import 'package:flutter/material.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';
import 'package:animate_do/animate_do.dart';

enum ButtonType { primary, secondary, outline, text, white }
enum ButtonSize { small, medium, large }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconData? icon;
  final bool isIconLeading;
  final bool isFullWidth;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool animated;
  final Duration animationDuration;
  final bool isLoading;
  final ButtonSize size;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.isIconLeading = true,
    this.isFullWidth = false,
    this.width,
    this.height,
    this.padding,
    this.animated = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.isLoading = false,
    this.size = ButtonSize.medium,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.isLoading ? null : widget.onPressed,
        child: _buildButton(),
      ),
    );
  }

  Widget _buildButton() {
    final buttonContent = widget.isLoading ? _buildLoadingIndicator() : _buildButtonContent();
    
    if (widget.animated) {
      return FadeIn(
        duration: widget.animationDuration,
        child: _buildButtonContainer(buttonContent),
      );
    }
    
    return _buildButtonContainer(buttonContent);
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: SizedBox(
        width: 20, 
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
          strokeWidth: 2.0,
        ),
      ),
    );
  }

  Widget _buildButtonContainer(Widget content) {
    final buttonWidth = widget.isFullWidth
        ? double.infinity
        : widget.width;
    
    EdgeInsets buttonPadding;
    
    if (widget.padding != null) {
      buttonPadding = widget.padding!;
    } else {
      switch (widget.size) {
        case ButtonSize.small:
          buttonPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
          break;
        case ButtonSize.large:
          buttonPadding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
          break;
        case ButtonSize.medium:
        default:
          buttonPadding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
          break;
      }
    }
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: buttonWidth,
      height: widget.height,
      padding: buttonPadding,
      decoration: _buildButtonDecoration(),
      child: content,
    );
  }

  Widget _buildButtonContent() {
    final textColor = _getTextColor();
    
    if (widget.icon == null) {
      return Center(
        child: CustomText(
          text: widget.text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: _getFontSize(),
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    
    final icon = Icon(
      widget.icon,
      color: textColor,
      size: _getIconSize(),
    );
    
    final text = CustomText(
      text: widget.text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: _getFontSize(),
      ),
    );
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.isIconLeading
          ? [icon, const SizedBox(width: 8), text]
          : [text, const SizedBox(width: 8), icon],
    );
  }

  double _getFontSize() {
    switch (widget.size) {
      case ButtonSize.small:
        return 14;
      case ButtonSize.large:
        return 18;
      case ButtonSize.medium:
      default:
        return 16;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.large:
        return 24;
      case ButtonSize.medium:
      default:
        return 20;
    }
  }

  BoxDecoration _buildButtonDecoration() {
    switch (widget.type) {
      case ButtonType.primary:
        return BoxDecoration(
          color: widget.onPressed == null
              ? AppTheme.primaryBlue.withOpacity(0.5)
              : (_isHovered ? AppTheme.secondaryBlue : AppTheme.primaryBlue),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered && widget.onPressed != null
              ? [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        );
      case ButtonType.secondary:
        return BoxDecoration(
          color: widget.onPressed == null
              ? AppTheme.secondaryBlue.withOpacity(0.5)
              : (_isHovered ? AppTheme.accentColor : AppTheme.secondaryBlue),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered && widget.onPressed != null
              ? [
                  BoxShadow(
                    color: AppTheme.secondaryBlue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        );
      case ButtonType.outline:
        return BoxDecoration(
          color: widget.onPressed == null
              ? Colors.transparent
              : (_isHovered ? AppTheme.primaryBlue.withOpacity(0.1) : Colors.transparent),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.onPressed == null 
                ? AppTheme.primaryBlue.withOpacity(0.5)
                : AppTheme.primaryBlue,
            width: 2,
          ),
        );
      case ButtonType.white:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered && widget.onPressed != null
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        );
      case ButtonType.text:
        return BoxDecoration(
          color: widget.onPressed == null
              ? Colors.transparent
              : (_isHovered ? AppTheme.primaryBlue.withOpacity(0.1) : Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        );
    }
  }

  Color _getTextColor() {
    if (widget.onPressed == null) {
      return AppTheme.mediumColor;
    }
    
    switch (widget.type) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return AppTheme.textLight;
      case ButtonType.white:
        return AppTheme.primaryBlue;
      case ButtonType.outline:
      case ButtonType.text:
        return AppTheme.primaryBlue;
    }
  }
} 
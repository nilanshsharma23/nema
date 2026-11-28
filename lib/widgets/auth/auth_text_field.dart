import 'package:material_ui/material_ui.dart';
import 'package:remixicon/remixicon.dart';

class AuthTextField extends StatefulWidget {
  const new({
    super.key,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.password = false,
    this.suffixIcon,
    this.validator,
  });

  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool password;
  final String? Function(String? value)? validator;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.password
          ? TextInputType.visiblePassword
          : widget.keyboardType,
      obscureText: showPassword ? false : widget.password,
      validator: widget.validator,
      decoration: InputDecoration(
        label: widget.labelText != null ? Text(widget.labelText!) : null,
        suffixIcon: Padding(
          padding: const EdgeInsetsGeometry.only(right: 4),
          child: widget.password
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword
                        ? RemixIcons.eye_off_line
                        : RemixIcons.eye_line,
                  ),
                )
              : widget.suffixIcon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
    );
  }
}

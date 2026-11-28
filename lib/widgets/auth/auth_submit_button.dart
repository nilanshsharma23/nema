import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_ui/material_ui.dart';

class AuthSubmitButton extends StatelessWidget {
  const new({
    super.key,
    required this.text,
    required this.onPressed,
    required this.loading,
  });

  final String text;
  final bool loading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: loading
              ? SpinKitThreeBounce(
                  size: 16,
                  color: Theme.of(context).colorScheme.surface,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
        ),
      ),
    );
  }
}

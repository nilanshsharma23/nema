import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nema/widgets/auth/auth_submit_button.dart';
import 'package:nema/widgets/auth/auth_text_field.dart';
import 'package:nema/widgets/auth/o_auth_button.dart';

class CreateAccountPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hello, you",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "make an account in a minute",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 8,
                children: [
                  OAuthButton(platform: "google", onPressed: () {}),
                  OAuthButton(platform: "facebook", onPressed: () {}),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    "  or use email  ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Form(
                child: Column(
                  spacing: 8,
                  children: [
                    AuthTextField(labelText: "username"),
                    AuthTextField(
                      labelText: "email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AuthTextField(
                      labelText: "password",
                      password: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    AuthSubmitButton(onPressed: () {}, text: "create account"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go('/sign-in');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                    child: Text(
                      "sign in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nema/widgets/auth/auth_submit_button.dart';
import 'package:nema/widgets/auth/auth_text_field.dart';
import 'package:nema/widgets/auth/o_auth_button.dart';

class SignInPage extends StatefulWidget {
  const new({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool loading = false;

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
                    "sign in right now",
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
                    AuthTextField(
                      labelText: "email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email can't be empty";
                        }

                        if (!EmailValidator.validate(value)) {
                          return "Invalid Email.";
                        }

                        return null;
                      },
                    ),
                    AuthTextField(
                      labelText: "password",
                      password: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        }

                        return null;
                      },
                    ),
                    AuthSubmitButton(
                      text: "sign in",
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                      },
                      loading: loading,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go('/create-account');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                    child: Text(
                      "create one",
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

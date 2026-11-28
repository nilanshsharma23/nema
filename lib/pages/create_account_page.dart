import 'package:email_validator/email_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nema/widgets/auth/auth_submit_button.dart';
import 'package:nema/widgets/auth/auth_text_field.dart';
import 'package:nema/widgets/auth/o_auth_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountPage extends StatefulWidget {
  const new({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool loading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                key: formKey,
                child: Column(
                  spacing: 8,
                  children: [
                    AuthTextField(
                      labelText: "username",
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can't be empty";
                        }

                        return null;
                      },
                    ),
                    AuthTextField(
                      labelText: "email",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                      controller: passwordController,
                      password: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        }

                        return null;
                      },
                    ),
                    AuthSubmitButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        SupabaseClient supabase = Supabase.instance.client;

                        try {
                          setState(() {
                            loading = true;
                          });

                          await supabase.auth.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          User user = supabase.auth.currentUser!;

                          await supabase.from('profiles').insert({
                            'user_id': user.id,
                            'username': usernameController.text,
                          });

                          if (context.mounted) {
                            context.go('/');
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      text: "create account",
                      loading: loading,
                    ),
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

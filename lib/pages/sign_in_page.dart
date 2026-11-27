import 'package:material_ui/material_ui.dart';

class SignInPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "hello, you",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            Text("make an account in a minute", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

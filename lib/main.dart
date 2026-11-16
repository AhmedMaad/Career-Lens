import 'package:career_lens/home_screen.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const CareerLens());

class CareerLens extends StatelessWidget {
  const CareerLens({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        scaffoldBackgroundColor: CupertinoColors.systemBackground,
        barBackgroundColor: CupertinoColors.systemBackground,
      ),
      home: HomeScreen(),
    );
  }
}

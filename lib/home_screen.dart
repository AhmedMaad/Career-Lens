import 'package:career_lens/job_screen.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Career Lens'),
        automaticBackgroundVisibility: false,
      ),
      child: SearchWidget(),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _textController = TextEditingController();

  void _openJobScreen() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => JobScreen(_textController.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: .all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              placeholder: 'Job Title',
              controller: _textController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _openJobScreen(),
            ),
            CupertinoButton(
              onPressed: () {
                _openJobScreen();
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

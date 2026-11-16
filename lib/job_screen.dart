import 'package:flutter/cupertino.dart';
import 'package:career_lens/job_model.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class const JobScreen(final String role, {super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Career Lens'),
        automaticBackgroundVisibility: false,
      ),
      child: JobData(role),
    );
  }
}

class const JobData(final String role, {super.key}) extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobData> {
  var requirements = '';
  bool isLoading = true;

  Future<void> getData() async {
    try {
      final result = await JobModel().getJobRequirements(widget.role);
      updateUI(() {
        requirements = result;
      });
    } catch (e) {
      updateUI(() {
        requirements = 'Cannot get job requirements';
      });
    } finally {
      updateUI(() {
        isLoading = false;
      });
    }
  }

  void updateUI(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CupertinoActivityIndicator(radius: 16));
    }

    return Markdown(data: requirements);
  }
}

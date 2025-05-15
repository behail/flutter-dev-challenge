import '../widgets.dart';

class ThePage extends StatelessWidget {
  final String title;

  const ThePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text(title),
      ),
    );
  }
}

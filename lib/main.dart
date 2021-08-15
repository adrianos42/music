import 'package:desktop/desktop.dart';
import 'home.dart';

void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DesktopApp(
      home: MusicHome(),
    );
  }
}

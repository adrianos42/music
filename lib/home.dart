import 'package:desktop/desktop.dart';

class MusicHome extends StatefulWidget {
  const MusicHome({Key? key}) : super(key: key);

  @override
  _MusicHome createState() => _MusicHome();
}

class _MusicHome extends State<MusicHome> {
  @override
  Widget build(BuildContext context) {
    return Nav(
      navAxis: Axis.horizontal,
      trailingMenu: [
        NavItem(
          builder: (context) => Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: const Color.fromARGB(0XFF, 0x0, 0x0, 0x0),
                  alignment: Alignment.center,
                  child: const Text('shittt'),
                ),
              ),
              const Spacer(flex: 8),
            ],
          ),
          title: 'st',
          route: 'pfp',
          icon: Icons.search,
        )
      ],
      items: [
        NavItem(
          builder: (context) => const Center(child: Text('st')),
          title: 'Now Playing',
          route: 'now_playing',
          icon: Icons.music_note,
        ),
        NavItem(
          builder: (context) => const Center(child: Text('st')),
          title: 'Playlist',
          route: 'playlist',
          icon: Icons.playlist_play,
        ),
        NavItem(
          builder: (context) => const Center(child: Text('st')),
          title: 'Composers',
          route: 'composers',
          icon: Icons.music_note,
        ),
        NavItem(
          builder: (context) => const Center(child: Text('st')),
          title: 'Albums',
          route: 'albums',
          icon: Icons.music_note,
        ),
        NavItem(
          builder: (context) => const Center(child: Text('st')),
          title: 'Songs',
          route: 'songs',
          icon: Icons.playlist_play,
        ),
      ],
    );
  }
}

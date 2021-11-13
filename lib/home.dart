import 'package:desktop/desktop.dart';
import 'songs/songs.dart';
import 'playback/playback.dart';
import 'playlist/playlist.dart';
import 'now_playing/now_playing.dart';

class MusicHome extends StatefulWidget {
  const MusicHome({Key? key}) : super(key: key);

  @override
  _MusicHome createState() => _MusicHome();
}

class _MusicHome extends State<MusicHome> {
  int currentTrackIndex = 2;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.background[4];

    final playback = Playback(currentTrackIndex);

    return Column(
      children: [
        Expanded(
          child: Nav(
            navAxis: Axis.horizontal,
            trailingMenu: [
              NavItem(
                builder: (context, _) => Container(
                  constraints:
                      const BoxConstraints(maxHeight: 200.0, minHeight: 100.0),
                  color: const Color.fromARGB(0XFF, 0x0, 0x0, 0x0),
                  alignment: Alignment.center,
                  child: const Text('shittt'),
                ),
                title: 'search',
                icon: Icons.settings,
              )
            ],
            items: [
              NavItem(
                builder: (context, _) => Column(
                  children: [
                    Expanded(child: NowPlaying(currentTrackIndex)),
                    playback,
                  ],
                ),
                title: 'Now Playing',
                icon: Icons.music_note,
              ),
              NavItem(
                builder: (context, _) => Column(
                  children: [
                    Expanded(child: Playlist()),
                    playback,
                  ],
                ),
                title: 'Playlist',
                icon: Icons.playlist_play,
              ),
              NavItem(
                builder: (context, _) => Column(
                  children: [
                    Expanded(child: Text('')),
                    playback,
                  ],
                ),
                title: 'Albums',
                icon: Icons.music_note,
              ),
              NavItem(
                builder: (context, _) => Column(
                  children: [
                    Expanded(child: Text('')),
                    playback,
                  ],
                ),
                title: 'Composers',
                icon: Icons.music_note,
              ),
              NavItem(
                builder: (context, _) => Column(
                  children: [
                    Expanded(child: Music()),
                    playback,
                  ],
                ),
                title: 'Music',
                icon: Icons.playlist_play,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

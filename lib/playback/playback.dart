import 'package:desktop/desktop.dart';
import '../mock/mock.dart';

class Playback extends StatefulWidget {
  Playback(this.currentTrackIndex);

  final int currentTrackIndex;

  @override
  _PlaybackState createState() => _PlaybackState();
}

class _PlaybackState extends State<Playback> {
  @override
  Widget build(BuildContext context) {
    final album = albums[0];
    final song = album.songs[widget.currentTrackIndex];
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background[0],
        border: Border(
          top: BorderSide(
            color: colorScheme.background[0],
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          style: textTheme.body2
                              .copyWith(color: textTheme.textMedium),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          album.album,
                          style: textTheme.caption
                              .copyWith(color: textTheme.textLow),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          album.composer,
                          style: textTheme.caption.copyWith(
                            color: textTheme.textLow,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Button.icon(
                      Icons.skip_previous,
                      onPressed: () {},
                      size: 24,
                    ),
                    Button.icon(
                      Icons.play_arrow,
                      onPressed: () {},
                      size: 36,
                    ),
                    Button.icon(
                      Icons.skip_next,
                      onPressed: () {},
                      size: 24,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          '0:00 / 4:12',
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.caption.copyWith(
                            color: textTheme.textMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.background[20],
            valueColor: Theme.of(context).colorScheme.shade[60],
            value: widget.currentTrackIndex == 0 ? 0.5 : 0.6,
          ),
        ],
      ),
    );
  }
}

import 'package:desktop/desktop.dart';
import '../mock/mock.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying(this.currentTrackIndex, {Key? key}) : super(key: key);

  final int currentTrackIndex;

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  ScrollController controller = ScrollController();

  Widget createCurrentTitle(BuildContext context) {
    final currentTrackIndex = widget.currentTrackIndex;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            albums[0].songs[currentTrackIndex].title,
            style: textTheme.header,
          ),
          Text(
            albums[0].album,
            style: textTheme.subheader.copyWith(color: textTheme.textMedium),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            albums[0].composer,
            style: textTheme.subheader.copyWith(color: textTheme.textMedium),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget createAlbumItems(BuildContext context) {
    final currentTrackIndex = widget.currentTrackIndex;
    final album = albums[0];

    return LayoutBuilder(builder: (context, constraintts) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (constraintts.maxWidth >= 500)
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 0.0),
              child: Image.asset(album.cover),
            ),
          if (constraintts.maxWidth < 500)
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(left: 0.0),
                child: Image.asset(album.cover),
              ),
            ),
          if (constraintts.maxWidth >= 500)
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: album.songs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                child: Button(
                                  leadingPadding: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  bodyPadding: EdgeInsets.zero,
                                  active: currentTrackIndex == index,
                                  onPressed: () => setState(() {
                                    // currentTrackIndex = index;
                                  }),
                                  body: Text(
                                    album.songs[index].title,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (constraints.maxHeight >= 200)
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 200,
                        alignment: Alignment.topLeft,
                        child: createCurrentTitle(context),
                      ),
                    ),
                  //if (constraints.maxHeight >= 500)
                  if (constraints.maxHeight >= 200)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: ButtonTheme.copyWith(
                              textStyle: Theme.of(context).textTheme.subtitle,
                              child: Button(
                                padding: EdgeInsets.zero,
                                color:
                                    Theme.of(context).textTheme.textPrimaryHigh,
                                highlightColor:
                                    Theme.of(context).textTheme.textLow,
                                onPressed: () {},
                                leading: const Icon(
                                  Icons.playlist_play,
                                  size: 24,
                                ),
                                body: const Text(
                                  'Playing Now',
                                  //    style:
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Button.icon(
                                Icons.repeat,
                                onPressed: () {},
                              ),
                              Button.icon(
                                Icons.shuffle,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      constraints: const BoxConstraints(
                        minHeight: 100,
                        maxHeight: 400,
                      ),
                      color: Theme.of(context).colorScheme.background[0],
                      child: createAlbumItems(context),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //     vertical: 0,
                  //   ),
                  //   color: Theme.of(context)
                  //       .colorScheme
                  //       .primary[30],
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Text(
                  //       'Up Next',
                  //       style:
                  //           Theme.of(context).textTheme.title,
                  //     ),
                  //   ),
                  // )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

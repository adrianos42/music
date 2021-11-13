import 'package:desktop/desktop.dart';
import '../mock/mock.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying(
    this.currentTrackIndex, {
    Key? key,
  }) : super(key: key);

  final int currentTrackIndex;

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  ScrollController controller = ScrollController();

  Widget createCurrentTitle(BuildContext context, Orientation orientation) {
    final currentTrackIndex = widget.currentTrackIndex;
    final textTheme = Theme.of(context).textTheme;
    final album = albums[0];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  albums[0].songs[currentTrackIndex].title,
                  style: textTheme.header,
                ),
                Text(
                  albums[0].album,
                  style:
                      textTheme.subheader.copyWith(color: textTheme.textMedium),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  albums[0].composer,
                  style:
                      textTheme.subheader.copyWith(color: textTheme.textMedium),
                  overflow: TextOverflow.ellipsis,
                ),
                if (orientation == Orientation.portrait)
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        album.cover,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (orientation == Orientation.landscape)
            SizedBox(
              width: 300.0,
              height: 300.0,
              child: Image.asset(
                album.cover,
                fit: BoxFit.fitWidth,
              ),
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
          // if (constraintts.maxWidth < 500.0)
          //   Expanded(
          //     child: Container(
          //       alignment: Alignment.topCenter,
          //       padding: const EdgeInsets.only(left: 0.0),
          //       child: Image.asset(album.cover),
          //     ),
          //   ),
          //if (constraintts.maxWidth >= 500.0)
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
    return OrientationBuilder(
      builder: (context, orientation) => Column(
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
                    if (constraints.maxHeight >= 200.0)
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 200.0,
                          alignment: Alignment.topLeft,
                          child: createCurrentTitle(context, orientation),
                        ),
                      ),
                    //if (constraints.maxHeight >= 500)
                    if (constraints.maxHeight >= 200.0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 0.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonTheme.copyWith(
                              textStyle: Theme.of(context).textTheme.title,
                              child: Button(
                                padding: EdgeInsets.zero,
                                highlightColor:
                                    Theme.of(context).textTheme.textLow,
                                onPressed: () {},
                                leading: const Icon(
                                  Icons.music_note,
                                  size: 22.0,
                                ),
                                body: const Text(
                                  'Now Playing',
                                  //    style:
                                  overflow: TextOverflow.ellipsis,
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
                          minHeight: 100.0,
                          maxHeight: 400.0,
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
      ),
    );
  }
}
 
import 'package:desktop/desktop.dart';
import '../mock/mock.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    final newMusics = [
      ...albums[0].songs,
      ...albums[0].songs,
      ...albums[0].songs,
      ...albums[0].songs
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Music',
            style: Theme.of(context).textTheme.header,
          ),
        ),
        Expanded(
          child: ListTable(
            itemCount: newMusics.length,
            colCount: 4,
            tableBorder: TableBorder(
              horizontalInside: BorderSide(
                color: Theme.of(context).colorScheme.background[20],
              ),
            ),
            tableHeaderBuilder: (context, col, constraints) {
              final Widget result;

              switch (col) {
                case 0:
                  result = const Text(
                    'Title',
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                case 1:
                  result = const Text(
                    'Album',
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                case 2:
                  result = const Text(
                    'Composer',
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                case 3:
                  result = const Text(
                    'Conductor',
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                default:
                  result = Container();
                  break;
              }

              return Container(
                constraints: constraints,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: result,
              );
            },
            onPressed: (index) async {
              await showDialog(context, builder: (context) {
                final textTheme = Theme.of(context).textTheme;

                return Dialog(
                  body: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          albums[0].cover,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                newMusics[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.title,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                albums[0].album,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.subtitle.copyWith(
                                  color: textTheme.textMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                albums[0].composer,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.body1.copyWith(
                                  color: textTheme.textMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                albums[0].artist,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.body1.copyWith(
                                  color: textTheme.textMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                albums[0].conductor,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.body1.copyWith(
                                  color: textTheme.textMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                albums[0].year.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.caption.copyWith(
                                  color: textTheme.textMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Row(
                                children: [
                                  Button.icon(
                                    Icons.play_arrow,
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                  ),
                                  Button.icon(
                                    Icons.playlist_add,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).closed;
            },
            tableRowBuilder: (context, row, col, constraints) {
              final Widget result;

              switch (col) {
                case 0:
                  result = Text(
                    newMusics[row].title,
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                case 1:
                  result = Text(
                    albums[0].album,
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                case 2:
                  result = Text(
                    albums[0].composer,
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                case 3:
                  result = Text(
                    albums[0].conductor,
                    overflow: TextOverflow.ellipsis,
                  );
                  break;
                default:
                  result = Container();
                  break;
              }

              return Container(
                constraints: constraints,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: result,
              );
            },
          ),
        ),
      ],
    );
  }
}

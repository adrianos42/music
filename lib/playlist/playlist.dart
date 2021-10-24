import 'package:desktop/desktop.dart';
import '../mock/mock.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    final newSongs = [
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Playlist',
                style: Theme.of(context).textTheme.header,
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Button.icon(Icons.undo),
                    Button.icon(
                      Icons.redo,
                      onPressed: () {},
                    ),
                    Button.icon(
                      Icons.clear,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Button(
                    leading: const Icon(Icons.playlist_play),
                    onPressed: () {},
                    body: const Text('Play'),
                  ),
                  Button(
                    leading: const Icon(Icons.playlist_add),
                    onPressed: () {},
                    body: const Text('Add Music'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Tree(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Button.icon(
                      Icons.add,
                      onPressed: () {},
                    ),
                    Button.icon(
                      Icons.copy_all,
                      onPressed: () {},
                    ),
                  ],
                ),
                Button.icon(
                  Icons.delete_forever,
                  onPressed: () {},
                ),
              ],
            ),
            nodes: [
              TreeNode.child(
                titleBuilder: (context) => const Text('Playing Now'),
                builder: (context) {
                  return ListTable(
                    itemCount: newSongs.length,
                    colCount: 4,
                    tableBorder: TableBorder(
                      left: BorderSide(
                        color: Theme.of(context).colorScheme.background[20],
                      ),
                      horizontalInside: BorderSide(
                        color: Theme.of(context).colorScheme.background[20],
                      ),
                    ),
                    headerColumnBorder: BorderSide(
                      color: Theme.of(context).colorScheme.background[20],
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
                    tableRowBuilder: (context, row, col, constraints) {
                      final Widget result;

                      switch (col) {
                        case 0:
                          result = Text(
                            newSongs[row].title,
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
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

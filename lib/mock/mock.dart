class Song {
  const Song({
    required this.source,
    required this.title,
    required this.track,
  });

  final String title;
  final String source;
  final int track;
}

class Album {
  const Album({
    required this.album,
    required this.artist,
    required this.composer,
    required this.conductor,
    required this.cover,
    required this.orchestra,
    required this.songs,
    required this.year,
  });

  final String album;
  final String orchestra;
  final String composer;
  final String conductor;
  final String artist;
  final int year;
  final String cover;
  final List<Song> songs;
}

const albums = [
  Album(
    album: 'Il barbiere di Siviglia',
    artist: 'Maria Callas / Luigi ALva',
    composer: 'Gioachino Rossini',
    conductor: 'Alceo Galliera',
    //cover: 'assets/Il_barbiere_di_Siviglia_sleeve.jpg',
    cover: 'assets/cover.jpg',
    orchestra: 'Philharmonia Orchestra and Chorus',
    songs: [
      Song(
        track: 1,
        title: 'Sinfonia (Orchestra)',
        source: '',
      ),
      Song(
        track: 2,
        title: 'Piano, pianissimo, senza parlar (Fiorello/Coro/Conte)',
        source: '',
      ),
      Song(
        track: 3,
        title: 'Ecco ridente in cielo (Conte)',
        source: '',
      ),
      Song(
        track: 4,
        title: 'Ehi, Fiorello?',
        source: '',
      ),
      Song(
        track: 5,
        title: 'Mille grazie, mio signore (Conte/Fiorello/Coro)',
        source: '',
      ),
      Song(
        track: 6,
        title: 'Gente indiscreta! (Conte/Fiorello/Figaro)',
        source: '',
      ),
      Song(
        track: 7,
        title: 'La ran la le ra, la ran la la. Largo al factotum (Figaro)',
        source: '',
      ),
      Song(
        track: 8,
        title: 'Ah, che bella vita! (Figaro/Conte)',
        source: '',
      ),
      Song(
        track: 9,
        title: 'Se il mio nome saper voi bramate (Conte/Rosina/Figaro)',
        source: '',
      ),
      Song(
        track: 10,
        title: 'Oh, cielo!',
        source: '',
      ),
      Song(
        track: 11,
        title: 'All’idea di quel metallo (Conte/Figaro)',
        source: '',
      ),
      Song(
        track: 12,
        title: 'Una voce poco fa (Rosina)',
        source: '',
      ),
      Song(
        track: 13,
        title: 'Sì, sì, la vincerò (Rosina/Figaro)',
        source: '',
      ),
      Song(
        track: 14,
        title: 'Ah, disgraziato Figaro! (Bartolo/Rosina/Berta/Ambrogio)',
        source: '',
      ),
    ],
    year: 2014,
  )
];

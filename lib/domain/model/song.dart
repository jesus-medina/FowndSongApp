class Song {
  String lyrics;
  MusicalTone musicalTone;
  String name;
  String player;
  String shownLyrics;

  Song(
      {this.lyrics,
      this.musicalTone,
      this.name,
      this.player,
      this.shownLyrics});

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      lyrics: map['lyrics'],
      musicalTone: MusicalTone.fromMap(map['musicalTone']),
      name: map['name'],
      player: map['player'],
      shownLyrics: map['shown-lyrics'],
    );
  }

  String fullLyrics() {
    return this
        .lyrics
        .replaceAll('abcdefghijklmnopqrstuvwxyza', '')
        .replaceAll('...', '')
        .toUpperCase();
  }
}

class MusicalTone {
  String tone;
  String type;

  MusicalTone({
    this.tone,
    this.type,
  });

  factory MusicalTone.fromMap(Map<String, dynamic> map) {
    return MusicalTone(
      tone: map['tone'],
      type: map['type'],
    );
  }
}

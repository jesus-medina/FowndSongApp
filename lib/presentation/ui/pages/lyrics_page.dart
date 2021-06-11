import 'package:flutter/material.dart';
import 'package:fownd_songs/domain/model/song.dart';

class LyricsPage extends StatefulWidget {
  Song song;

  LyricsPage(this.song);

  @override
  State<StatefulWidget> createState() {
    return _LyricsPageState(this.song);
  }
}

class _LyricsPageState extends State<LyricsPage> {
  Song song;

  _LyricsPageState(this.song);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.song.name),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
              child: SelectableText(this.song.fullLyrics()),
              padding: EdgeInsets.all(16)),
        )));
  }
}

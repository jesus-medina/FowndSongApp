import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fownd_songs/domain/model/song.dart';
import 'lyrics_page.dart';

class SongsPage extends StatefulWidget {
  SongsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: StreamBuilder(
            stream: _firestore.collection('songs').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              QuerySnapshot query = snapshot.data;
              List<QueryDocumentSnapshot> docs = query.docs;
              docs
                ..removeAt(0)
                ..removeLast();

              return ListView(
                  children: docs.map((doc) {
                Song song = Song.fromMap(doc.data());
                return songItem(context, song);
              }).toList());
            },
          ),
        );
      },
    );
  }

  Widget songItem(BuildContext context, Song song) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text(song.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LyricsPage(song)),
            );
          },
        ),
        Divider(
          thickness: 2,
          endIndent: 20,
          indent: 20,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'presentation/ui/pages/songs_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FowndSongsApp());
}

class FowndSongsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fownd Songs',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SongsPage(title: 'Alabanzas'),
    );
  }
}

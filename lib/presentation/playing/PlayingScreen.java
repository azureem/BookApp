import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:book_hive/pdf_screen.dart';
import '../../data/book_data.dart';

class PlayingScreen extends StatefulWidget {
  final BookUiData comingBook;

  const PlayingScreen({required this.comingBook});

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  final AudioPlayer player = AudioPlayer();

  String formatDuration(Duration d) {
    final min = d.inMinutes.remainder(60);
    final sec = d.inSeconds.remainder(60);
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    await player.setUrl(widget.comingBook.audio);

    player.positionStream.listen((position) {
      setState(() => this.position = position);
    });

    player.durationStream.listen((duration) {
      setState(() => this.duration = duration ?? Duration.zero);
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          position = Duration.zero;
        });
        player.pause();
        player.seek(position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF26B6C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            player.stop();
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Explore',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/parti.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(url: widget.comingBook.doc),
                        ),
                      );
                    },
                    child: Image.network(
                      widget.comingBook.img ?? '',
                      width: 185,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Chapter - 01',
                  style: TextStyle(color: Color(0xFFF26B6C), fontSize: 18),
                ),
                Text(
                  widget.comingBook.title,
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Text(
                  widget.comingBook.author,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: [
                      Text(formatDuration(position), style: TextStyle(color: Colors.black54)),
                      Spacer(),
                      Text(formatDuration(duration), style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: handleSeek,
                    activeColor: Color(0xFFF26B6C),
                    inactiveColor: Colors.grey,
                    thumbColor: Color(0xFFF26B6C),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/one.png',
                      width: 24,
                      height: 24,
                    ),
                    Image.asset(
                      'assets/images/two.png',
                      width: 24,
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: handlePlayPause,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0x42F26B6C),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(player.playing ? Icons.pause : Icons.play_arrow, color: Color(0xFFF26B6C)),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/three.png',
                      width: 24,
                      height: 24,
                    ),
                    Image.asset(
                      'assets/images/four.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/moon.png',
                      width: 18,
                      height: 18,
                    ),
                    Image.asset(
                      'assets/images/exchange.png',
                      width: 18,
                      height: 18,
                    ),
                    Image.asset(
                      'assets/images/saved.png',
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

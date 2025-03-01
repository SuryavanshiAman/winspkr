import 'package:just_audio/just_audio.dart';

class Audio {
  static AudioPlayer audioPlayers = AudioPlayer();

  static Future<void> depositmusic() async {
    var duration = await audioPlayers.setAsset('assets/music/mp3.mp3');
    audioPlayers.play();
    audioPlayers.setLoopMode(LoopMode.off);
    return Future.delayed(duration ?? Duration.zero);
  }
  static Future<void> aviatorplanmusic() async {
    var duration = await audioPlayers.setAsset('assets/music/aviatorplan.mp3');
    audioPlayers.play();
    audioPlayers.setLoopMode(LoopMode.all);
    return Future.delayed(duration ?? Duration.zero);
  }
  static Future<void> WingoTimerone() async {
    var duration = await audioPlayers.setAsset('assets/music/countdownone.mp3');
    audioPlayers.play();
    audioPlayers.setLoopMode(LoopMode.off);
    return Future.delayed(duration ?? Duration.zero);
  }
  static Future<void> WingoTimertwo() async {
    var duration = await audioPlayers.setAsset('assets/music/countdowntwo.mp3');
    audioPlayers.play();
    audioPlayers.setLoopMode(LoopMode.all);
    return Future.delayed(duration ?? Duration.zero);
  }
  static Future<void> DragonbgSound() async {
    var duration = await audioPlayers.setAsset('assets/music/dragontiger.mp3');
    audioPlayers.play();
    audioPlayers.setLoopMode(LoopMode.all);
    return Future.delayed(duration ?? Duration.zero);
  }

}


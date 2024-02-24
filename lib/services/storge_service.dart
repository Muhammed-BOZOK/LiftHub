import 'package:firebase_storage/firebase_storage.dart';

class StorgeService {
  Future<List<String>> loadVideo() async {
    final ListResult result =
        await FirebaseStorage.instance.ref().child('videos/').listAll();

    final List<String> videoUrls = [];
    await Future.forEach(result.items, (Reference ref) async {
      final String videoUrl = await ref.getDownloadURL();
      videoUrls.add(videoUrl);
    });
    
    return videoUrls;
  }
}

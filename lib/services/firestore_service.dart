import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solution_challenge/models/video_model.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  Future<List<VideoModel>> getVideoModel(String filterOption) async {
    try {
      final queryVideo = await db.collection("training_videos").get();
      List<VideoModel> videoList = [];
      for (var doc in queryVideo.docs) {
        videoList.add(VideoModel.fromJson(doc.data()));
      }

      if (filterOption != 'All') {
        return videoList
            .where((element) => element.category == filterOption)
            .toList();
      } else {
        return videoList;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Veri okuma hatası: $e');
      return [];
    }
  }
}

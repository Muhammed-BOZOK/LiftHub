import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/app_color.dart';
import 'package:solution_challenge/constants/general_constants.dart';
import 'package:solution_challenge/constants/text_style.dart';
import 'package:solution_challenge/services/firestore_service.dart';
import 'package:solution_challenge/models/video_model.dart';
import 'package:solution_challenge/view/filterr_screen.dart';
import 'package:solution_challenge/view/video_player_screen.dart';

class TrainingVideosScreen extends StatefulWidget {
  const TrainingVideosScreen({super.key});

  @override
  State<TrainingVideosScreen> createState() => _TrainingVideosScreenState();
}

class _TrainingVideosScreenState extends State<TrainingVideosScreen> {
  String filterOption = 'All';

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: screenPadding - 10,
                ),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: deviceWidth * 0.08,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        filterOption = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterScreen(
                              deviceWidth: deviceWidth,
                            ),
                          ),
                        );
                        debugPrint('video page filterOption: $filterOption');
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        size: deviceWidth * 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: screenPadding,
                ),
                child: FutureBuilder(
                  future: FirestoreService().getVideoModel(filterOption),
                  builder: (context, snapshot) {
                    List<VideoModel>? listVideos = snapshot.data;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      debugPrint('HATA OLUŞTU');
                      throw Error();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: listVideos!.length,
                        itemBuilder: (context, index) {
                          return VideoItemsWidget(
                            deviceWidth: deviceWidth,
                            deviceHeight: deviceHeight,
                            vidoTitle: listVideos[index].title,
                            thumbnailUrl: listVideos[index].thumbnailUrl,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(
                                    videoUrl: listVideos[index].url,
                                    videoTitle: listVideos[index].title,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const Text('No Data');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VideoItemsWidget extends StatelessWidget {
  const VideoItemsWidget({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
    this.vidoTitle,
    this.thumbnailUrl,
    this.onTap,
  });

  final double deviceWidth;
  final double deviceHeight;
  final String? vidoTitle;
  final String? thumbnailUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const borderSide = BorderSide(color: borderColor, width: 1.3);
    return Container(
      margin: const EdgeInsets.only(
        bottom: screenPadding,
      ),
      width: deviceWidth - 2 * screenPadding,
      height: deviceHeight * 0.35,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                border: const Border(top: borderSide),
                image: DecorationImage(
                    image: NetworkImage(thumbnailUrl!), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  border: Border(bottom: borderSide),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        vidoTitle ?? 'VIDEO TİTLE',
                        style: mediumTitle,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onTap,
                      icon: Icon(
                        Icons.play_circle_outline,
                        size: deviceWidth * 0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

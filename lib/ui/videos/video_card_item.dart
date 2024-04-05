import 'package:arnavbansal/core/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoCardItem extends StatelessWidget{
  VideoModel currentVideoModel;
  VoidCallback onVideoTapped;
  VideoCardItem({required this.currentVideoModel, required this.onVideoTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onVideoTapped();
      },
      child: Card(
        child: Stack(
          children: [
            Image.network(
              'https://img.youtube.com/vi/${currentVideoModel.videoIDs}/mqdefault.jpg',
              height: 300,
            ),
            Positioned(
                bottom: 30,
                right: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5)
                  ),
                  child: Text(
                    "${currentVideoModel.videoLength}",
                    style: TextStyle(
                      color: Colors.white,

                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}
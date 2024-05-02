import 'package:arnavbansal/constants/color_constants.dart';
import 'package:arnavbansal/core/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoCardItem extends StatelessWidget{
  VideoModel currentVideoModel;
  VoidCallback onVideoTapped;
  VideoCardItem({required this.currentVideoModel, required this.onVideoTapped});

  @override
  Widget build(BuildContext context) {
    Size stringSize = getTextSize(currentVideoModel.videoName ?? '');
    return GestureDetector(
      onTap: (){
        onVideoTapped();
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(left: 12, right: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5)),
              child: Text(
                "${currentVideoModel.videoName}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              children: [
                Image.network(
                  'https://img.youtube.com/vi/${currentVideoModel.videoIDs}/mqdefault.jpg',
                  height: 300,
                  fit: BoxFit.contain,
                ),
                Positioned(
                    bottom: 30,
                    right: 30,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.5)),
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

          ],
        ),
      ),
    );


  }


  Size getTextSize(String inputText){
    final Size stringSize = (TextPainter(
        text: TextSpan(text: inputText),
        maxLines: 1,
        textDirection: TextDirection.rtl)..layout()).size;
    return stringSize;
  }
}
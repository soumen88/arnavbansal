class VideoModel {
  String? categoryName;
  String? videoName;
  String? videoLink;
  String? videoUrls;
  String? videoIDs;
  String? videoLength;

  VideoModel(
      {
        this.categoryName,
        this.videoName,
        this.videoLink,
        this.videoUrls,
        this.videoIDs,
        this.videoLength});

  VideoModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['Category Name'];
    videoName = json['Video Name'];
    videoLink = json['Video Link'];
    videoUrls = json['VideoUrls'];
    videoIDs = json['VideoIDs'];
    videoLength = json['Video Length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category Name'] = this.categoryName;
    data['Video Name'] = this.videoName;
    data['Video Link'] = this.videoLink;
    data['VideoUrls'] = this.videoUrls;
    data['VideoIDs'] = this.videoIDs;
    data['Video Length'] = this.videoLength;
    return data;
  }

  @override
  String toString() {
    return 'VideoModel{categoryName: $categoryName, videoName: $videoName, videoLink: $videoLink, videoUrls: $videoUrls, videoIDs: $videoIDs, videoLength: $videoLength}';
  }
}

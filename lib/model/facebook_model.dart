class FaceBookModel {
  final String? name;
  final String? email;
  final String? id;
  final FaceBookPhotoModel? faceBookPhotoModel;

  FaceBookModel({this.name, this.email, this.id, this.faceBookPhotoModel});

  factory FaceBookModel.fromJson(Map<String, dynamic> json) => FaceBookModel(
        email: json['email'],
        name: json['name'],
        id: json['id'],
        faceBookPhotoModel:
            FaceBookPhotoModel.fromJson(json['picture']['data']),
      );
}

class FaceBookPhotoModel {
  final String? url;
  final int? height;
  final int? widht;

  FaceBookPhotoModel({this.url, this.height, this.widht});

  factory FaceBookPhotoModel.fromJson(Map<String, dynamic> json) =>
      FaceBookPhotoModel(
        url: json['url'],
        widht: json['width'],
        height: json['height'],
      );
}

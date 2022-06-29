class Avatar {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? assetId;
  String? publicId;
  String? path;
  String? format;
  String? size;
  String? height;
  String? width;
  String? thumbnail1;
  String? thumbnail2;

  Avatar({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.assetId,
    this.publicId,
    this.path,
    this.format,
    this.size,
    this.height,
    this.width,
    this.thumbnail1,
    this.thumbnail2,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      assetId: json['asset_id'],
      publicId: json['public_id'],
      path: json['path'],
      format: json['format'],
      size: json['size'],
      height: json['height'],
      width: json['width'],
      thumbnail1: json['thumbnail_1'],
      thumbnail2: json['thumbnail_2'],
    );
  }
}

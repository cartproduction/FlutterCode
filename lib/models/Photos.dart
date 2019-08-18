class Photos {
  bool cover;
  String direction;
  int filesize;
  String font;
  int height;
  int id;
  int itemId;
  String note;
  int position;
  bool processed;
  int quantity;
  String url;
  int width;

  Photos(
      {this.cover,
        this.direction,
        this.filesize,
        this.font,
        this.height,
        this.id,
        this.itemId,
        this.note,
        this.position,
        this.processed,
        this.quantity,
        this.url,
        this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    direction = json['direction'];
    filesize = json['filesize'];
    font = json['font'];
    height = json['height'];
    id = json['id'];
    itemId = json['itemId'];
    note = json['note'];
    position = json['position'];
    processed = json['processed'];
    quantity = json['quantity'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['direction'] = this.direction;
    data['filesize'] = this.filesize;
    data['font'] = this.font;
    data['height'] = this.height;
    data['id'] = this.id;
    data['itemId'] = this.itemId;
    data['note'] = this.note;
    data['position'] = this.position;
    data['processed'] = this.processed;
    data['quantity'] = this.quantity;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}
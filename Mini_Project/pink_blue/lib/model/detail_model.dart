class DetailResepModel {
  String? method;
  bool? status;
  ResultDetail? resultdetail;

  DetailResepModel({this.method, this.status, this.resultdetail});

  DetailResepModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    resultdetail = json['results'] != null
        ? new ResultDetail.fromJson(json['results'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['status'] = this.status;
    if (this.resultdetail != null) {
      data['results'] = this.resultdetail!.toJson();
    }
    return data;
  }
}

class ResultDetail {
  String? title;
  String? thumb;
  String? servings;
  String? times;
  String? difficulty;
  Author? author;
  String? desc;
  List<NeedItem>? needItem;
  List<String>? ingredient;
  List<String>? step;

  ResultDetail(
      {this.title,
      this.thumb,
      this.servings,
      this.times,
      this.difficulty,
      this.author,
      this.desc,
      this.needItem,
      this.ingredient,
      this.step});

  ResultDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    servings = json['servings'];
    times = json['times'];
    difficulty = json['difficulty'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    desc = json['desc'];
    if (json['needItem'] != null) {
      needItem = <NeedItem>[];
      json['needItem'].forEach((v) {
        needItem!.add(new NeedItem.fromJson(v));
      });
    }
    ingredient = json['ingredient'].cast<String>();
    step = json['step'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['servings'] = this.servings;
    data['times'] = this.times;
    data['difficulty'] = this.difficulty;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['desc'] = this.desc;
    if (this.needItem != null) {
      data['needItem'] = this.needItem!.map((v) => v.toJson()).toList();
    }
    data['ingredient'] = this.ingredient;
    data['step'] = this.step;
    return data;
  }
}

class Author {
  String? user;
  String? datePublished;

  Author({this.user, this.datePublished});

  Author.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    datePublished = json['datePublished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['datePublished'] = this.datePublished;
    return data;
  }
}

class NeedItem {
  String? itemName;
  String? thumbItem;

  NeedItem({this.itemName, this.thumbItem});

  NeedItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    thumbItem = json['thumb_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['thumb_item'] = this.thumbItem;
    return data;
  }
}

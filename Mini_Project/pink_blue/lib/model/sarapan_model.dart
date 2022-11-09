class SarapanModel {
  String? method;
  bool? status;
  List<ResultSarapan>? result;

  SarapanModel({this.method, this.status, this.result});

  SarapanModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      result = <ResultSarapan>[];
      json['results'].forEach((v) {
        result!.add(new ResultSarapan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['status'] = this.status;
    if (this.result != null) {
      data['results'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultSarapan {
  String? title;
  String? thumb;
  String? key;
  String? times;
  String? serving;
  String? difficulty;

  ResultSarapan(
      {this.title,
      this.thumb,
      this.key,
      this.times,
      this.serving,
      this.difficulty});

  ResultSarapan.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    serving = json['serving'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['key'] = this.key;
    data['times'] = this.times;
    data['serving'] = this.serving;
    data['difficulty'] = this.difficulty;
    return data;
  }
}

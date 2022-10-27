class Datass {
  final String author, description, title;
  Datass(this.author, this.description, this.title);
}

class DataNewsModel {
  String? responseMsg;
  int? responseCode;
  List<Data>? data;

  DataNewsModel({this.responseMsg, this.responseCode, this.data});

  DataNewsModel.fromJson(Map<String, dynamic> json) {
    responseMsg = json['response_msg'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_msg'] = this.responseMsg;
    data['response_code'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? author;
  String? title;
  String? description;

  Data({
    this.author,
    this.title,
    this.description,
  });

  Data.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

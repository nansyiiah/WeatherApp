import 'dart:convert';

class Datas {
  final String cuaca, tempC, jamCuaca;
  Datas(this.cuaca, this.tempC, this.jamCuaca);
}

class DataAPIModel {
  String? kodeCuaca;
  String? cuaca;
  String? humidity;
  String? tempC;
  String? tempF;

  DataAPIModel(
      {this.kodeCuaca, this.cuaca, this.humidity, this.tempC, this.tempF});

  DataAPIModel.fromJson(Map<String, dynamic> json) {
    kodeCuaca = json['kodeCuaca'];
    cuaca = json['cuaca'];
    humidity = json['humidity'];
    tempC = json['tempC'];
    tempF = json['tempF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kodeCuaca'] = this.kodeCuaca;
    data['cuaca'] = this.cuaca;
    data['humidity'] = this.humidity;
    data['tempC'] = this.tempC;
    data['tempF'] = this.tempF;
    return data;
  }
}

class SearchRubblishEntity {
  var id;
  var name;
  var city;
  var classify;
  var remark;

  SearchRubblishEntity(this.id, this.name, this.city, this.classify, this.remark);

  SearchRubblishEntity.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.city = map['city'];
    this.classify = map['classify'];
    this.remark = map['remark'];
  }

  SearchRubblishEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        city = json['city'],
        classify = json['classify'],
        remark = json['remark'];

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
      'id': id,
      'name': name,
      'city': city,
      'classify': classify,
      'remark': remark
    };
}


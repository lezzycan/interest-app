// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemsModel {
  String? id;
  String? name;
  ItemsModel({
    this.id,
    this.name,
  });

  // ItemsModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  // }
  // or
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      name: json['name']
    );
  }
}

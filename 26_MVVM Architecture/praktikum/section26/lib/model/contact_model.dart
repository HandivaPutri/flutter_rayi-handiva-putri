class ContactModel {
  final int id;
  final String name;
  final String phone;

  ContactModel({required this.id, required this.name, required this.phone});

  // factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
  //     id: json['id'], Name: json['name'], Contact: json['contact']);
}

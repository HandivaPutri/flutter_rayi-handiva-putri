class ContactModel {
  String id;
  String Name;
  String Contact;

  ContactModel({required this.id, required this.Name, required this.Contact});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
      id: json['id'], Name: json['name'], Contact: json['contact']);
}

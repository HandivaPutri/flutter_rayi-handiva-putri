class ContactModel {
  final String id;
  final String Name;
  final String Contact;

  ContactModel({
    required this.id,
    required this.Name,
    required this.Contact,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
      id: json['id'], Name: json['name'], Contact: json['contact']);
}

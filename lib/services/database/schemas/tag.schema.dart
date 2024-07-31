class TagSchema {
  final String? id;
  final String? name;
  final String? company;
  final String? jobTitle;
  final String? urls;
  final String? phoneNumber;
  final String? email;

  TagSchema({
    this.id,
    this.name,
    this.company,
    this.jobTitle,
    this.urls,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'jobTitle': jobTitle,
      'urls': urls,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory TagSchema.fromMap(Map<String, dynamic> map) {
    return TagSchema(
      id: map['id'],
      name: map['name'],
      company: map['company'],
      jobTitle: map['jobTitle'],
      urls: map['urls'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }
}

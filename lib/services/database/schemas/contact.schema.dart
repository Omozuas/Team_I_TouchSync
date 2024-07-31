class ContactSchema {
  final String id;
  final String? userName;
  final String? surName;
  final String? otherName;
  final String? location;
  final String? phoneNumber;
  final String? email;
  final String? messanger;
  final String? whatsapp;
  final String? telegram;
  final String? tiktok;
  final String? paypal;
  final String? youtube;
  final String? facebook;
  final String? snapchat;
  final String? zoomMeeting;
  final String? teams;
  final String? notion;
  final String? texts;
  final String day;
  final String time;

  ContactSchema(
      {required this.id,
      this.userName,
      this.surName,
      this.otherName,
      this.location,
      this.phoneNumber,
      this.messanger,
      this.whatsapp,
      this.telegram,
      this.tiktok,
      this.email,
      this.paypal,
      this.youtube,
      this.facebook,
      this.snapchat,
      this.zoomMeeting,
      required this.day,
      required this.time,
      this.texts,
      this.teams,
      this.notion});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'surName': surName,
      'otherName': otherName,
      'location': location,
      'phoneNumber': phoneNumber,
      'messanger': messanger,
      'whatsapp': whatsapp,
      'telegram': telegram,
      'tiktok': tiktok,
      'email': email,
      'notion': notion,
      'paypal': paypal,
      'youtube': youtube,
      'facebook': facebook,
      'snapchat': snapchat,
      'zoomMeeting': zoomMeeting,
      'teams': teams,
      'texts': texts,
      'day': day,
      'time': time,
    };
  }

  factory ContactSchema.fromMap(Map<String, dynamic> map) {
    return ContactSchema(
      id: map['id'],
      userName: map['userName'],
      surName: map['surName'],
      otherName: map['otherName'],
      location: map['location'],
      phoneNumber: map['phoneNumber'],
      messanger: map['messanger'],
      whatsapp: map['whatsapp'],
      telegram: map['telegram'],
      tiktok: map['tiktok'],
      email: map['email'],
      notion: map['notion'],
      paypal: map['paypal'],
      youtube: map['youtube'],
      facebook: map['facebook'],
      snapchat: map['snapchat'],
      zoomMeeting: map['zoomMeeting'],
      teams: map['teams'],
      texts: map['texts'],
      day: map['day'],
      time: map['time'],
    );
  }
}

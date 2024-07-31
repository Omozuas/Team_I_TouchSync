class ProfileSchema {
  final String id;
  final String? userName;
  final String? surName;
  final String? otherName;
  final String? location;
  final String? phoneNumber;
  final String? email;
  final String? messenger;
  final String? whatsapp;
  final String? telegram;
  final String? tiktok;
  final String? paypal;
  final String? youtube;
  final String? facebook;
  final String? instagram;
  final String? zoom;
  final String? teams;
  final String? notion;

  final String? appStore;

  ProfileSchema({
    required this.id,
    this.userName,
    this.surName,
    this.otherName,
    this.location,
    this.phoneNumber,
    this.messenger,
    this.whatsapp,
    this.telegram,
    this.tiktok,
    this.email,
    this.paypal,
    this.youtube,
    this.facebook,
    this.instagram,
    this.zoom,
    this.teams,
    this.appStore,
    this.notion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'surName': surName,
      'otherName': otherName,
      'location': location,
      'phoneNumber': phoneNumber,
      'messenger': messenger,
      'whatsapp': whatsapp,
      'telegram': telegram,
      'tiktok': tiktok,
      'email': email,
      'notion': notion,
      'paypal': paypal,
      'youtube': youtube,
      'facebook': facebook,
      'instagram': instagram,
      'zoom': zoom,
      'appStore': appStore,
      'teams': teams,
    };
  }

  factory ProfileSchema.fromMap(Map<String, dynamic> map) {
    return ProfileSchema(
      id: map['id'],
      userName: map['userName'],
      surName: map['surName'],
      otherName: map['otherName'],
      location: map['location'],
      phoneNumber: map['phoneNumber'],
      messenger: map['messenger'],
      whatsapp: map['whatsapp'],
      telegram: map['telegram'],
      tiktok: map['tiktok'],
      email: map['email'],
      notion: map['notion'],
      paypal: map['paypal'],
      youtube: map['youtube'],
      facebook: map['facebook'],
      instagram: map['instagram'],
      appStore: map['appStore'],
      zoom: map['zoom'],
      teams: map['teams'],
    );
  }
}

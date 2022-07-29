class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? state;
  String? address;
  String? phone;
  String? username;
  String? password;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.country,
    this.state,
    this.address,
    this.phone,
    this.username,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    country = json['country'];
    state = json['state'];
    address = json['address'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['country'] = country;
    data['state'] = state;
    data['address'] = address;
    data['phone'] = phone;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

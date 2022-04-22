class Contact {
  late String name;
  late String phoneNumber;
  late String time;

  Contact({required this.name, required this.phoneNumber}) {
    time = DateTime.now().toString();
  }

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'time': time,
      };

  @override
  String toString() {
    return "Name : $name\n Phone number : $phoneNumber";
  }
}

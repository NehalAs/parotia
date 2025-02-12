class RentalModel {
  List<String>? images;
  Calendar? calendar;
  int? guests;
  String? name;
  String? description;
  String? address;
  String? id;

  RentalModel(
      {this.images,
        this.calendar,
        this.guests,
        this.name,
        this.description,
        this.address,
        this.id});

  RentalModel.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    calendar = json['calendar'] != null
        ? new Calendar.fromJson(json['calendar'])
        : null;
    guests = json['guests'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    if (this.calendar != null) {
      data['calendar'] = this.calendar!.toJson();
    }
    data['guests'] = this.guests;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['id'] = this.id;
    return data;
  }
}

class Calendar {
  List<String>? notAvailableDays;
  Map? daysPrices;

  Calendar({this.notAvailableDays, this.daysPrices});

  Calendar.fromJson(Map<String, dynamic> json) {
    notAvailableDays = json['notAvailableDays'].cast<String>();
    daysPrices = json['daysPrices'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notAvailableDays'] = this.notAvailableDays;
    if (this.daysPrices != null) {
      data['daysPrices'] = this.daysPrices!;
    }
    return data;
  }
}



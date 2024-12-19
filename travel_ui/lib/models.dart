class Country {
  final int id;
  final String name;

  Country({required this.id, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Tour {
  final String tourName;
  final String description;
  final String duration;
  final double price;
  final String? dateFrom;
  final String? dateTo;

  Tour({
    required this.tourName,
    required this.description,
    required this.duration,
    required this.price,
    this.dateFrom,
    this.dateTo,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      tourName: json['tour_name'],
      description: json['description'],
      duration: json['duration'],
      price: json['price'],
      dateFrom: json['date_from'],
      dateTo: json['date_to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tour_name': tourName,
      'description': description,
      'duration': duration,
      'price': price,
      'date_from': dateFrom,
      'date_to': dateTo,
    };
  }
}

class Day {
  final String day;
  final String title;
  final String morning;
  final String afternoon;
  final String evening;

  Day({
    required this.day,
    required this.title,
    required this.morning,
    required this.afternoon,
    required this.evening,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day: json['day'],
      title: json['title'],
      morning: json['morning'],
      afternoon: json['afternoon'],
      evening: json['evening'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'title': title,
      'morning': morning,
      'afternoon': afternoon,
      'evening': evening,
    };
  }
}

class Detail {
  final String countryName;
  final String cityName;
  final double rating;
  final int reviews;
  final String dateFrom;
  final String dateTo;
  final List<Tour> tours;
  final List<Day> days;

  Detail({
    required this.countryName,
    required this.cityName,
    required this.rating,
    required this.reviews,
    required this.dateFrom,
    required this.dateTo,
    required this.tours,
    required this.days,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    var toursList =
        (json['tours'] as List).map((i) => Tour.fromJson(i)).toList();
    var daysList = (json['days'] as List).map((i) => Day.fromJson(i)).toList();

    return Detail(
      countryName: json['countryname'],
      cityName: json['cityname'],
      rating: json['rating'],
      reviews: json['reviews'],
      dateFrom: json['date_from'] ?? "",
      dateTo: json['date_to'] ?? "",
      tours: toursList,
      days: daysList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countryname': countryName,
      'cityname': cityName,
      'rating': rating,
      'reviews': reviews,
      'date_from': dateFrom,
      'date_to': dateTo,
      'tours': tours.map((tour) => tour.toJson()).toList(),
      'days': days.map((day) => day.toJson()).toList(),
    };
  }
}

class CountryData {
  final List<Country> countries;
  final List<String> images;
  final List<Detail> details;

  CountryData({
    required this.countries,
    required this.images,
    required this.details,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    var countriesList =
        (json['countries'] as List).map((i) => Country.fromJson(i)).toList();
    var detailsList =
        (json['details'] as List).map((i) => Detail.fromJson(i)).toList();

    return CountryData(
      countries: countriesList,
      images: List<String>.from(json['images']),
      details: detailsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countries': countries.map((country) => country.toJson()).toList(),
      'images': images,
      'details': details.map((detail) => detail.toJson()).toList(),
    };
  }
}

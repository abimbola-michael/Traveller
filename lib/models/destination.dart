// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:traveller/models/activity.dart';

class Destination {
  String url;
  String country;
  String city;
  String description;
  List<Activity> activities;
  Destination({
    required this.url,
    required this.country,
    required this.city,
    required this.description,
    required this.activities,
  });

  Destination copyWith({
    String? url,
    String? country,
    String? city,
    String? description,
    List<Activity>? activities,
  }) {
    return Destination(
      url: url ?? this.url,
      country: country ?? this.country,
      city: city ?? this.city,
      description: description ?? this.description,
      activities: activities ?? this.activities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'country': country,
      'city': city,
      'description': description,
      'activities': activities.map((x) {
        return x.toMap();
      }).toList(growable: false),
    };
  }

  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      url: (map["url"] ?? '') as String,
      country: (map["country"] ?? '') as String,
      city: (map["city"] ?? '') as String,
      description: (map["description"] ?? '') as String,
      activities: List<Activity>.from(
        ((map['activities'] ?? const <Activity>[]) as List).map<Activity>((x) {
          return Activity.fromMap(
              (x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>);
        }),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Destination.fromJson(String source) =>
      Destination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Destination(url: $url, country: $country, city: $city, description: $description, activities: $activities)';
  }

  @override
  bool operator ==(covariant Destination other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.country == country &&
        other.city == city &&
        other.description == description &&
        listEquals(other.activities, activities);
  }

  @override
  int get hashCode {
    return url.hashCode ^
        country.hashCode ^
        city.hashCode ^
        description.hashCode ^
        activities.hashCode;
  }
}

List<Destination> destinations = [
  Destination(
    url: 'assets/images/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    url: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    url: 'assets/images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    url: 'assets/images/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    url: 'assets/images/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
List<Activity> activities = [
  Activity(
    url: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    url: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    url: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

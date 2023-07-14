// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Activity {
  String url;
  String name;
  String type;
  int rating;
  int price;
  List<String> startTimes;
  Activity({
    required this.url,
    required this.name,
    required this.type,
    required this.rating,
    required this.price,
    required this.startTimes,
  });

  Activity copyWith({
    String? url,
    String? name,
    String? type,
    int? rating,
    int? price,
    List<String>? startTimes,
  }) {
    return Activity(
      url: url ?? this.url,
      name: name ?? this.name,
      type: type ?? this.type,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      startTimes: startTimes ?? this.startTimes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'name': name,
      'type': type,
      'rating': rating,
      'price': price,
      'startTimes': startTimes,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      url: (map["url"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      type: (map["type"] ?? '') as String,
      rating: (map["rating"] ?? 0) as int,
      price: (map["price"] ?? 0) as int,
      startTimes: List<String>.from(
        ((map['startTimes'] ?? const <String>[]) as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Activity(url: $url, name: $name, type: $type, rating: $rating, price: $price, startTimes: $startTimes)';
  }

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.name == name &&
        other.type == type &&
        other.rating == rating &&
        other.price == price &&
        listEquals(other.startTimes, startTimes);
  }

  @override
  int get hashCode {
    return url.hashCode ^
        name.hashCode ^
        type.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        startTimes.hashCode;
  }
}

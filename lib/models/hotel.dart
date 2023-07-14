// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Hotel {
  String url;
  String name;
  String address;
  int price;
  Hotel({
    required this.url,
    required this.name,
    required this.address,
    required this.price,
  });

  Hotel copyWith({
    String? url,
    String? name,
    String? address,
    int? price,
  }) {
    return Hotel(
      url: url ?? this.url,
      name: name ?? this.name,
      address: address ?? this.address,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'name': name,
      'address': address,
      'price': price,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      url: (map["url"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      address: (map["address"] ?? '') as String,
      price: (map["price"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) =>
      Hotel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hotel(url: $url, name: $name, address: $address, price: $price)';
  }

  @override
  bool operator ==(covariant Hotel other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.name == name &&
        other.address == address &&
        other.price == price;
  }

  @override
  int get hashCode {
    return url.hashCode ^ name.hashCode ^ address.hashCode ^ price.hashCode;
  }
}

final List<Hotel> hotels = [
  Hotel(
    url: 'assets/images/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    url: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    url: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Great St',
    price: 240,
  ),
];


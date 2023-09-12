import 'dart:convert';

import 'package:equatable/equatable.dart';

class HubModel extends Equatable {
  final String id;
  final String address;
  final String name;
  final String serialId;

  const HubModel({
    required this.id,
    required this.address,
    required this.name,
    required this.serialId,
  });

  factory HubModel.init() =>
      const HubModel(id: '', address: '', name: '', serialId: '');

  HubModel copyWith({
    String? id,
    String? address,
    String? name,
    String? serialId,
  }) {
    return HubModel(
      id: id ?? this.id,
      address: address ?? this.address,
      name: name ?? this.name,
      serialId: serialId ?? this.serialId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'name': name,
      'serialId': serialId,
    };
  }

  factory HubModel.fromMap(Map<String, dynamic> map) {
    return HubModel(
      id: map['id'] ?? '',
      address: map['address'] ?? '',
      name: map['name'] ?? '',
      serialId: map['serialId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HubModel.fromJson(String source) =>
      HubModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HubModel(id: $id, address: $address, name: $name, serialId: $serialId)';
  }

  @override
  List<Object> get props => [id, address, name, serialId];
}

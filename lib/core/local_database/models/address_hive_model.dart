import 'dart:convert';
import 'package:hive/hive.dart';

part '../adapters/address_hive_model.g.dart';

@HiveType(typeId: 0)
class AddressHiveModel {
  AddressHiveModel({
    this.uid,
    this.street,
    this.flat,
    this.city,
    this.county,
    this.postcode,
    this.voterIds,
  });

  @HiveField(0)
  final String? uid;

  @HiveField(1)
  final String? street;

  @HiveField(2)
  final String? flat;

  @HiveField(3)
  final String? city;

  @HiveField(4)
  final String? county;

  @HiveField(5)
  final String? postcode;

  @HiveField(6)
  final List<String>? voterIds;

  AddressHiveModel copyWith({
    String? uid,
    String? street,
    String? flat,
    String? city,
    String? county,
    String? postcode,
    List<String>? voterIds,
  }) {
    return AddressHiveModel(
      uid: uid ?? this.uid,
      street: street ?? this.street,
      flat: flat ?? this.flat,
      city: city ?? this.city,
      county: county ?? this.county,
      postcode: postcode ?? this.postcode,
      voterIds: voterIds ?? this.voterIds,
    );
  }

  Map<String, dynamic> toAddress() {
    List<String?> address = [street, flat, city, county, postcode];
    address.removeWhere((element) => element == null || element.isEmpty);
    return {
      uid!: address.join(", "),
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'street': street,
      'flat': flat,
      'city': city,
      'county': county,
      'postcode': postcode,
      'voter_ids': voterIds,
    };
  }

  factory AddressHiveModel.fromMap(Map<String, dynamic> map) {
    return AddressHiveModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      flat: map['flat'] != null ? map['flat'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      county: map['county'] != null ? map['county'] as String : null,
      postcode: map['postcode'] != null ? map['postcode'] as String : null,
      voterIds: map['voter_ids']?.cast<String>(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressHiveModel.fromJson(String source) =>
      AddressHiveModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressHiveModel(uid: $uid, street: $street, flat: $flat, city: $city, county: $county, postcode: $postcode, voterIds: $voterIds)';
  }
}

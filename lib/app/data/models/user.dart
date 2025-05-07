import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:herdrobe_app/app/data/enums/user_type.dart';
import 'package:herdrobe_app/app/utils/safe_parsing.dart';

class AppUser extends Equatable {
  final String uid;
  final String fullName;
  final String email;
  final String? phone;
  final String? imageUrl;
  final String? fcmToken;
  final String? cnicImageUrl;
  final String? cnicNumber;
  final bool isVerifiedPhone;
  final bool isVerifiedEmail;
  final double rating;
  final int productLength;
  final UserType userType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? isSuspended;

  const AppUser({
    required this.uid,
    required this.fullName,
    required this.email,
    this.phone,
    this.imageUrl,
    this.fcmToken,
    this.cnicImageUrl,
    this.cnicNumber,
    this.isVerifiedPhone = false,
    this.isVerifiedEmail = false,
    this.rating = 0.0,
    this.productLength = 0,
    this.userType = UserType.none,
    required this.createdAt,
    required this.updatedAt,
    this.isSuspended,
  });

  AppUser copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? photoUrl,
    String? fcmToken,
    String? cnicImageUrl,
    String? cnicNumber,
    bool? isVerifiedPhone,
    bool? isVerifiedEmail,
    double? rating,
    int? productLength,
    UserType? userType,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? isSuspended,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      fullName: name ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      imageUrl: photoUrl ?? this.imageUrl,
      fcmToken: fcmToken ?? this.fcmToken,
      cnicImageUrl: cnicImageUrl ?? this.cnicImageUrl,
      cnicNumber: cnicNumber ?? this.cnicNumber,
      isVerifiedPhone: isVerifiedPhone ?? this.isVerifiedPhone,
      isVerifiedEmail: isVerifiedEmail ?? this.isVerifiedEmail,
      rating: rating ?? this.rating,
      productLength: productLength ?? this.productLength,
      userType: userType ?? this.userType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSuspended: isSuspended ?? this.isSuspended,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': fullName,
      'email': email,
      'phone': phone,
      'photoUrl': imageUrl,
      'fcmToken': fcmToken,
      'cnicImageUrl': cnicImageUrl,
      'cnicNumber': cnicNumber,
      'isVerifiedPhone': isVerifiedPhone,
      'isVerifiedEmail': isVerifiedEmail,
      'rating': rating,
      'productLength': productLength,
      'userType': userType.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'isSuspended': isSuspended?.millisecondsSinceEpoch,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] as String,
      fullName: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      imageUrl: map['photoUrl'] as String?,
      fcmToken: map['fcmToken'] as String?,
      cnicImageUrl: map['cnicImageUrl'] as String?,
      cnicNumber: map['cnicNumber'] as String?,
      isVerifiedPhone: SafeParsing.parseBool(map['isVerifiedPhone']),
      isVerifiedEmail: SafeParsing.parseBool(map['isVerifiedEmail']),
      rating: SafeParsing.parseDouble(map['rating']),
      productLength: SafeParsing.parseInt(map['productLength']),
      userType: SafeParsing.parseEnum<UserType>(
        map['userType'],
        UserType.values,
      ),
      createdAt: SafeParsing.parseDate(map['createdAt']) ?? DateTime.now(),
      updatedAt: SafeParsing.parseDate(map['updatedAt']) ?? DateTime.now(),
      isSuspended: SafeParsing.parseDate(map['isSuspended']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      uid,
      fullName,
      email,
      phone,
      imageUrl,
      fcmToken,
      cnicImageUrl,
      cnicNumber,
      isVerifiedPhone,
      isVerifiedEmail,
      rating,
      productLength,
      userType,
      createdAt,
      updatedAt,
      isSuspended,
    ];
  }
}

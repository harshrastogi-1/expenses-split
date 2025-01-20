// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class BaseResponse<T> {
//   @JsonKey(name: 'success')
//   bool? success = true;
//
//   @JsonKey(name: 'response')
//   final String? response;
//
//   @JsonKey(name: 'message')
//   final String? message;
//
//   @JsonKey(name: 'data')
//   final dynamic data;
//
//   @JsonKey(name: 'error')
//   dynamic error;
//
//   BaseResponse(
//       {this.success, this.response, this.message, this.data, this.error});
//
//   // Existing fromJson factory constructor
//   // factory BaseResponse.fromFire(dynamic json, {required String dataKey}) {
//   //   // Your existing logic...
//   // }
//
//   // New factory constructor for Firestore DocumentSnapshot
//   factory BaseResponse.fromFirestore(DocumentSnapshot snapshot) {
//     if (snapshot.exists) {
//       return BaseResponse(
//         success: true,
//         message: 'Document retrieved successfully',
//         data: snapshot.data(), // This returns the document data as a map
//       );
//     } else {
//       return BaseResponse(
//         success: false,
//         message: 'Document not found',
//         error: 'Document does not exist',
//       );
//     }
//   }
// }

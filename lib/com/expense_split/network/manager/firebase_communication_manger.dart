// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../base/data/api/model/result_state.dart';
// import '../../logger/log_manager.dart';
//
// class FirebaseCommunicationManager {
//   /// Firebase Firestore - Get Document
//   Future<ResultState> getDocument(
//       String collectionPath, String documentId) async {
//     try {
//       DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//           .collection(collectionPath)
//           .doc(documentId)
//           .get();
//
//       if (documentSnapshot.exists) {
//         LogManager.logData(
//             'FirebaseCommunicationManager>> Document retrieved successfully',
//             logType: LogType.info);
//         return Success(data: documentSnapshot.data());
//       } else {
//         LogManager.logData('FirebaseCommunicationManager>> Document not found',
//             logType: LogType.info);
//         return Error(
//           message: "Document not found",
//           errorCode: "404",
//         );
//       }
//     } catch (exception) {
//       LogManager.logData('FirebaseCommunicationManager>> Exception: $exception',
//           logType: LogType.error);
//       return Error(
//         message: "Failed to fetch document",
//         errorCode: exception.toString(),
//       );
//     }
//   }
//
//   /// Firebase Firestore - Add Document
//   Future<ResultState> addDocument(
//       String collectionPath, Map<String, dynamic> data) async {
//     try {
//       DocumentReference documentReference =
//           await FirebaseFirestore.instance.collection(collectionPath).add(data);
//
//       LogManager.logData(
//           'FirebaseCommunicationManager>> Document added successfully',
//           logType: LogType.info);
//       return Success(data: {"documentId": documentReference.id});
//     } catch (exception) {
//       LogManager.logData('FirebaseCommunicationManager>> Exception: $exception',
//           logType: LogType.error);
//       return Error(
//         message: "Failed to add document",
//         errorCode: exception.toString(),
//       );
//     }
//   }
//
//   /// Firebase Firestore - Update Document
//   Future<ResultState> updateDocument(String collectionPath, String documentId,
//       Map<String, dynamic> data) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection(collectionPath)
//           .doc(documentId)
//           .update(data);
//
//       LogManager.logData(
//           'FirebaseCommunicationManager>>  Document updated successfully',
//           logType: LogType.info);
//       return Success(data: "Document updated successfully");
//     } catch (exception) {
//       LogManager.logData(
//           'FirebaseCommunicationManager>>  Exception: $exception',
//           logType: LogType.error);
//       return Error(
//         message: "Failed to update document",
//         errorCode: exception.toString(),
//       );
//     }
//   }
//
//   /// Firebase Firestore - Delete Document
//   Future<ResultState> deleteDocument(
//       String collectionPath, String documentId) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection(collectionPath)
//           .doc(documentId)
//           .delete();
//
//       LogManager.logData(
//           'FirebaseCommunicationManager>> Document deleted successfully',
//           logType: LogType.info);
//       return Success(data: "Document deleted successfully");
//     } catch (exception) {
//       LogManager.logData('FirebaseCommunicationManager>> : $exception',
//           logType: LogType.error);
//       return Error(
//         message: "Failed to delete document",
//         errorCode: exception.toString(),
//       );
//     }
//   }
// }
